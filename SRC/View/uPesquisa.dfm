object FrmPesquisa: TFrmPesquisa
  Left = 467
  Top = 285
  BorderStyle = bsSingle
  Caption = 'Pesquisa'
  ClientHeight = 411
  ClientWidth = 906
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 906
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 32
      Width = 34
      Height = 13
      Caption = 'Nome :'
    end
    object Label2: TLabel
      Left = 64
      Top = 56
      Width = 191
      Height = 13
      Caption = 'Tecle <ENTER> para selecionar registro'
    end
    object Label3: TLabel
      Left = 64
      Top = 8
      Width = 219
      Height = 13
      Caption = 'Digite um valor para filtrar exemplo: "%Maria%"'
    end
    object edtNome: TEdit
      Left = 64
      Top = 27
      Width = 257
      Height = 21
      TabOrder = 0
      OnKeyDown = edtNomeKeyDown
      OnKeyPress = edtNomeKeyPress
    end
    object btnPesquisar: TButton
      Left = 333
      Top = 24
      Width = 108
      Height = 25
      Caption = 'Pesquisar - F3'
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
    object rdg_Ordenar: TRadioGroup
      Left = 480
      Top = 8
      Width = 113
      Height = 59
      Caption = 'Ordenar Por :'
      ItemIndex = 0
      Items.Strings = (
        '&C'#243'digo'
        '&Descri'#231#227'o')
      TabOrder = 2
      OnClick = rdg_OrdenarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 370
    Width = 906
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnSelecionar: TButton
      Left = 617
      Top = 6
      Width = 137
      Height = 25
      Caption = 'Selecionar - F5'
      TabOrder = 0
      OnClick = btnSelecionarClick
    end
    object btnCancelar: TButton
      Left = 760
      Top = 6
      Width = 129
      Height = 25
      Caption = 'Cancelar <ESC>'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object dbgPesquisa: TDBGrid
    Left = 0
    Top = 81
    Width = 906
    Height = 289
    Align = alClient
    DataSource = dsPesquisa
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgPesquisaDblClick
    OnKeyDown = dbgPesquisaKeyDown
    OnKeyPress = dbgPesquisaKeyPress
  end
  object dsPesquisa: TDataSource
    Left = 352
    Top = 104
  end
end
