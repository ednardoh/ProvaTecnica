unit uConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.VCLUI.Wait, FireDAC.VCLUI.Async,
  FireDAC.Phys.IBBase, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;




type
  TConexao = class
  private
    FConn: TFDConnection;

    procedure ConfigurarConexao;
  public
    constructor Create;
    destructor Destroy; override;

    function GetConn: TFDConnection;
    function CriarQuery: TFDQuery;
  end;

  const
    DATA_BASE: string = 'dbpedido_venda';

implementation

{ TConexao }

procedure TConexao.ConfigurarConexao;
begin
  FConn.Connected := false;
  FConn.LoginPrompt := false;
  FConn.Params.Clear;
  FConn.Params.Add('hostname='+ '127.0.0.1');
  FConn.Params.Add('user_name='+ 'root');
  FConn.Params.Add('password='+ '');
  FConn.Params.Add('Database='+ DATA_BASE);
  FConn.Params.Add('DriverID='+ 'MySQL');
  FConn.Connected := true;
end;

constructor TConexao.Create;
begin
  FConn := TFDConnection.Create(nil);

  Self.ConfigurarConexao();
end;

function TConexao.CriarQuery: TFDQuery;
var
  VQuery: TFDQuery;
begin
  VQuery := TFDQuery.Create(nil);
  VQuery.Connection := FConn;

  Result := VQuery;
end;

destructor TConexao.Destroy;
begin
  FConn.Free;

  inherited;
end;

function TConexao.GetConn: TFDConnection;
begin
  Result := FConn;
end;

end.
