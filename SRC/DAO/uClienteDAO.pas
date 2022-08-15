unit uClienteDAO;

interface

uses
  FireDAC.Comp.Client, uConexao, uClienteModel, System.SysUtils, uSistemaControl;

type
  TClienteDao = class
  private
    FConexao: TConexao;
  public
    constructor Create;

    function Incluir(AClienteModel: TClienteModel): Boolean;
    function Alterar(AClienteModel: TClienteModel): Boolean;
    function Excluir(AClienteModel: TClienteModel): Boolean;
    function GetId: Integer;
    function Obter(AorderBy: Integer;AValorparcial: string): TFDQuery;
    function ObterNomeCLI(AValorpesquisa: string): TFDQuery;
  end;

implementation

{ TClienteDao }

constructor TClienteDao.Create;
begin
  FConexao := TSistemaControl.GetInstance().Conexao;
end;

function TClienteDao.GetId: Integer;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.Open('SELECT coalesce(MAX(CODIGO),0)+1 AS CODIGO FROM tb_clientes');
    try
      Result := VQry.Fields[0].AsInteger;
    finally
      VQry.Close;
    end;
  finally
    VQry.Free;
  end;
end;

function TClienteDao.Incluir(AClienteModel: TClienteModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('insert into tb_clientes (codigo, nome, Cidade, UF) values (:codigo, :nome, :Cidade, :UF)',
                  [AClienteModel.Codigo, AClienteModel.Nome, AClienteModel.Cidade, AClienteModel.UF]);

    Result := True;
  finally
    VQry.Free;
  end;
end;

function TClienteDao.Excluir(AClienteModel: TClienteModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('delete from tb_clientes where (codigo = :codigo)', [AClienteModel.Codigo]);

    Result := True;
  finally
    VQry.Free;
  end;
end;

function TClienteDao.Alterar(AClienteModel: TClienteModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('update tb_clientes set nome = :nome, Cidade=:Cidade, UF=:UF where (codigo = :codigo)',
                 [AClienteModel.Nome, AClienteModel.Cidade, AClienteModel.UF, AClienteModel.Codigo]);

    Result := True;
  finally
    VQry.Free;
  end;
end;

function TClienteDao.Obter(AorderBy: Integer;AValorparcial: string): TFDQuery;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();

  if AValorparcial = '' then
    VQry.Open('select codigo, nome, Cidade, UF from tb_clientes order by '+AorderBy.ToString)
  else
     VQry.Open('select codigo, nome, Cidade, UF from tb_clientes where NOME like ' + quotedstr(AValorparcial) + ' order by '+AorderBy.ToString);

  Result := VQry;
end;

function TClienteDao.ObterNomeCLI(AValorpesquisa: string): TFDQuery;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();

  VQry.Open('select codigo, nome, Cidade, UF from tb_clientes where codigo = '+AValorpesquisa);

  Result := VQry;
end;

end.
