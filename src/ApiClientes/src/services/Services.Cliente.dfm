object ServiceCliente: TServiceCliente
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 158
  Width = 493
  object Connection: TFDConnection
    Params.Strings = (
      'Server=DESKTOP-SJGTFOH'
      'Password=1234'
      'User_Name=sa'
      'Database=db_microdata'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 48
  end
  object qryCadastro: TFDQuery
    Connection = Connection
    SQL.Strings = (
      
        'select c.id, c.nome, c.Cep, c.Logradouro, c.Numero, c.Complement' +
        'o, c.Bairro, c.Cidade, c.Ibge_cidade, c.Sigla_uf, c.Ibge_uf'
      'from cliente c')
    Left = 128
    Top = 48
    object qryCadastroid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryCadastronome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object qryCadastroCep: TStringField
      FieldName = 'Cep'
      Origin = 'Cep'
      Required = True
      Size = 8
    end
    object qryCadastroLogradouro: TStringField
      FieldName = 'Logradouro'
      Origin = 'Logradouro'
      Required = True
      Size = 60
    end
    object qryCadastroNumero: TStringField
      FieldName = 'Numero'
      Origin = 'Numero'
      Required = True
      Size = 10
    end
    object qryCadastroComplemento: TStringField
      FieldName = 'Complemento'
      Origin = 'Complemento'
      Size = 40
    end
    object qryCadastroBairro: TStringField
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 40
    end
    object qryCadastroCidade: TStringField
      FieldName = 'Cidade'
      Origin = 'Cidade'
      Required = True
      Size = 40
    end
    object qryCadastroIbge_cidade: TStringField
      FieldName = 'Ibge_cidade'
      Origin = 'Ibge_cidade'
      Required = True
      Size = 7
    end
    object qryCadastroSigla_uf: TStringField
      FieldName = 'Sigla_uf'
      Origin = 'Sigla_uf'
      Required = True
      Size = 2
    end
    object qryCadastroIbge_uf: TStringField
      FieldName = 'Ibge_uf'
      Origin = 'Ibge_uf'
      Required = True
      Size = 2
    end
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 400
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 400
    Top = 96
  end
  object qryPesquisa: TFDQuery
    Connection = Connection
    SQL.Strings = (
      
        'select c.id, c.nome, c.Cep, c.Logradouro, c.Numero, c.Complement' +
        'o, c.Bairro, c.Cidade, c.Ibge_cidade, c.Sigla_uf, c.Ibge_uf'
      'from cliente c')
    Left = 216
    Top = 48
    object qryPesquisaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPesquisanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object qryPesquisaCep: TStringField
      FieldName = 'Cep'
      Origin = 'Cep'
      Required = True
      Size = 8
    end
    object qryPesquisaLogradouro: TStringField
      FieldName = 'Logradouro'
      Origin = 'Logradouro'
      Required = True
      Size = 60
    end
    object qryPesquisaNumero: TStringField
      FieldName = 'Numero'
      Origin = 'Numero'
      Required = True
      Size = 10
    end
    object qryPesquisaComplemento: TStringField
      FieldName = 'Complemento'
      Origin = 'Complemento'
      Size = 40
    end
    object qryPesquisaBairro: TStringField
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 40
    end
    object qryPesquisaCidade: TStringField
      FieldName = 'Cidade'
      Origin = 'Cidade'
      Required = True
      Size = 40
    end
    object qryPesquisaIbge_cidade: TStringField
      FieldName = 'Ibge_cidade'
      Origin = 'Ibge_cidade'
      Required = True
      Size = 7
    end
    object qryPesquisaSigla_uf: TStringField
      FieldName = 'Sigla_uf'
      Origin = 'Sigla_uf'
      Required = True
      Size = 2
    end
    object qryPesquisaIbge_uf: TStringField
      FieldName = 'Ibge_uf'
      Origin = 'Ibge_uf'
      Required = True
      Size = 2
    end
  end
end
