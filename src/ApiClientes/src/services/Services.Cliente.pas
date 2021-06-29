unit Services.Cliente;

interface

uses
  System.SysUtils, System.Classes, Data.DB, System.JSON, DataSet.Serialize,
  Vcl.Forms, UConecta, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.DataSet, FireDAC.Comp.UI,
  FireDAC.Phys.ODBCBase, FireDAC.Comp.Client;

type
  TServiceCliente = class(TDataModule)
    Connection: TFDConnection;
    qryCadastro: TFDQuery;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryCadastroid: TFDAutoIncField;
    qryCadastronome: TStringField;
    qryCadastroCep: TStringField;
    qryCadastroLogradouro: TStringField;
    qryCadastroNumero: TStringField;
    qryCadastroComplemento: TStringField;
    qryCadastroBairro: TStringField;
    qryCadastroCidade: TStringField;
    qryCadastroIbge_cidade: TStringField;
    qryCadastroSigla_uf: TStringField;
    qryCadastroIbge_uf: TStringField;
    qryPesquisa: TFDQuery;
    qryPesquisaid: TFDAutoIncField;
    qryPesquisanome: TStringField;
    qryPesquisaCep: TStringField;
    qryPesquisaLogradouro: TStringField;
    qryPesquisaNumero: TStringField;
    qryPesquisaComplemento: TStringField;
    qryPesquisaBairro: TStringField;
    qryPesquisaCidade: TStringField;
    qryPesquisaIbge_cidade: TStringField;
    qryPesquisaSigla_uf: TStringField;
    qryPesquisaIbge_uf: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    conexaoClass : TConexao;
  public
    function ListClientes(const ANome: string): TFDQuery;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TServiceCliente.DataModuleCreate(Sender: TObject);
begin
  conexaoClass := TConexao.Create(ExtractFilePath(Application.ExeName) + 'ConfigDB.ini', 'Conexao');
  conexaoClass.LeINI; //Lê as configurações de banco do aqruivo de configuração
  conexaoClass.Conectar(Connection); //Conecta ao banco de dados
end;

function TServiceCliente.ListClientes(const ANome: string): TFDQuery;
begin
  if ANome <> 'ALL' then
    begin
      qryPesquisa.SQL.Add('where Nome Like :Nome');
      qryPesquisa.ParamByName('Nome').AsString := '%'+ANome+'%';
    end;
  qryPesquisa.Open();
  Result := qryPesquisa;
end;

end.
