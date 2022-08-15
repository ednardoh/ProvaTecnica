unit uPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, FMTBcd, SqlExpr,
  Provider, DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.Intf, uClienteControl, uProdutoControl;

type
  TFrmPesquisa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtNome: TEdit;
    btnPesquisar: TButton;
    btnSelecionar: TButton;
    btnCancelar: TButton;
    dbgPesquisa: TDBGrid;
    dsPesquisa: TDataSource;
    rdg_Ordenar: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgPesquisaDblClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure dbgPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rdg_OrdenarClick(Sender: TObject);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Clientes       : TClienteControl;
    Produtos       : TProdutoControl;
    //PedidoVenda    : TPedidovenda;
    //PedidoProdutos : TProdutosPedido;
    procedure buscaRegistro;
  public
    { Public declarations }
    gblNomeTabela,
    gblCodigo,
    gblNomepesquisa : String;
  end;

var
  FrmPesquisa: TFrmPesquisa;

implementation

{$R *.dfm}

uses UPrincipal;

procedure TFrmPesquisa.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmPesquisa.btnSelecionarClick(Sender: TObject);
begin
  frmPrincipal.LCodigo := dbgPesquisa.Columns.Grid.Fields[0].AsString;
  frmPrincipal.LNome   := dbgPesquisa.Columns.Grid.Fields[1].AsString;

  if gblNomeTabela = 'Produtos' then
    frmPrincipal.LPrcProd := FormatFloat(',0.00',dbgPesquisa.Columns.Grid.Fields[2].AsFloat);
  close;
end;

procedure TFrmPesquisa.buscaRegistro;
begin
  if gblNomeTabela = 'Clientes' then
    begin
      Clientes := TClienteControl.Create;
      if rdg_Ordenar.ItemIndex = 0 then
        dsPesquisa.DataSet := Clientes.Obter(1,'')  //ordena por codigo
      else
        dsPesquisa.DataSet := Clientes.Obter(2,''); //ordena por nome
      Clientes.Free;
    end
  else
    if gblNomeTabela = 'Produtos' then
      begin
        Produtos := TProdutoControl.Create;
        if rdg_Ordenar.ItemIndex = 0 then
          dsPesquisa.DataSet := Produtos.Obter(1,'')
        else
          dsPesquisa.DataSet := Produtos.Obter(2,'');
        Produtos.Free;
      end
  else
    if gblNomeTabela = 'tb_pedidovenda' then
      begin
        //PedidoVenda := TPedidovenda.Create;
        if rdg_Ordenar.ItemIndex = 0 then
          gblCodigo := 'NUMPEDIDO'
        else
          gblCodigo := 'NUMPEDIDO';
        //PedidoVenda.AbreTabela(gblNomeTabela,gblCodigo,gblNomepesquisa);
      end
  else
    if gblNomeTabela = 'tb_pedidos_produtos' then
      begin
        //PedidoProdutos := TProdutosPedido.Create;
        if rdg_Ordenar.ItemIndex = 0 then
          gblCodigo := 'NUMPEDIDO'
        else
          gblCodigo := 'NUMPEDIDO';
        //PedidoProdutos.AbreTabela(gblNomeTabela,gblCodigo,gblNomepesquisa);
      end;
end;

procedure TFrmPesquisa.FormShow(Sender: TObject);
begin
  buscaRegistro;
end;

procedure TFrmPesquisa.rdg_OrdenarClick(Sender: TObject);
begin
  buscaRegistro;
end;

procedure TFrmPesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Action := cafree;

end;

procedure TFrmPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f3 then btnPesquisarClick(Self);
  if key = vk_f5 then btnSelecionarClick(Self);
  if key = vk_escape then btnCancelarClick(Self);
end;

procedure TFrmPesquisa.dbgPesquisaDblClick(Sender: TObject);
begin
  btnSelecionarClick(Self);
end;

procedure TFrmPesquisa.btnPesquisarClick(Sender: TObject);
begin
  if edtNome.Text = '' then
    Showmessage('Campo pesquisa n�o pode ser vazio.')
  else
    begin
      if gblNomeTabela = 'Clientes' then
        begin
          Clientes := TClienteControl.Create;
          if rdg_Ordenar.ItemIndex = 0 then
            dsPesquisa.DataSet := Clientes.Obter(1, edtNome.Text)  //ordena por codigo
          else
            dsPesquisa.DataSet := Clientes.Obter(2, edtNome.Text); //ordena por nome
          Clientes.Free;
        end
      else
        if gblNomeTabela = 'Produtos' then
          begin
            Produtos := TProdutoControl.Create;
            if rdg_Ordenar.ItemIndex = 0 then
              dsPesquisa.DataSet := Produtos.Obter(1, edtNome.Text)  //ordena por codigo
            else
              dsPesquisa.DataSet := Produtos.Obter(2, edtNome.Text); //ordena por nome
            Produtos.Free;
          end
      else
        if gblNomeTabela = 'Pedidovenda' then
          begin
            //PedidoVenda := TPedidovenda.Create;
            if rdg_Ordenar.ItemIndex = 0 then
              gblCodigo := 'NUMPEDIDO'
            else
              gblCodigo := 'NUMPEDIDO';
            //PedidoVenda.AbreTabela(gblNomeTabela,gblCodigo,gblNomepesquisa);
          end
      else
        if gblNomeTabela = 'Pedidos_produtos' then
          begin
            //PedidoProdutos := TProdutosPedido.Create;
            if rdg_Ordenar.ItemIndex = 0 then
              gblCodigo := 'NUMPEDIDO'
            else
              gblCodigo := 'NUMPEDIDO';
            //PedidoProdutos.AbreTabela(gblNomeTabela,gblCodigo,gblNomepesquisa);
          end;
        end;
end;

procedure TFrmPesquisa.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    begin
      dbgPesquisa.SetFocus;
    end;
end;

procedure TFrmPesquisa.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      dbgPesquisa.SetFocus;
    end;
end;

procedure TFrmPesquisa.dbgPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_Return then btnSelecionarClick(Self);

end;

procedure TFrmPesquisa.dbgPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then btnSelecionarClick(Self);
end;

end.
