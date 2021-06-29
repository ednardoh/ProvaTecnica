object frmDatamodulo: TfrmDatamodulo
  OldCreateOrder = False
  Height = 301
  Width = 409
  object dsPesquisa: TDataSource
    Left = 184
    Top = 24
  end
  object dsClientes: TDataSource
    Left = 274
    Top = 24
  end
  object dsContatos: TDataSource
    Left = 330
    Top = 28
  end
  object DBConect: TFDConnection
    Params.Strings = (
      'Server=DESKTOP-SJGTFOH'
      'Password=1234'
      'User_Name=sa'
      'Database=db_microdata'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 16
    Top = 24
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 192
    Top = 88
  end
  object QryAux: TFDQuery
    Connection = DBConect
    Left = 64
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 328
    Top = 88
  end
end
