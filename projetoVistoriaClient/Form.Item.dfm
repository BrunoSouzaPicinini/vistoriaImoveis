object frmItem: TfrmItem
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsSizeToolWin
  Caption = 'Item'
  ClientHeight = 233
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcItem: TPageControl
    Left = 0
    Top = 0
    Width = 488
    Height = 233
    ActivePage = tsCadastro
    Align = alClient
    TabOrder = 0
    OnChange = FormShow
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      object lblCodigo: TLabel
        Left = 16
        Top = 3
        Width = 33
        Height = 13
        Caption = 'Codigo'
      end
      object lblNome: TLabel
        Left = 16
        Top = 49
        Width = 46
        Height = 13
        Caption = 'Descric'#227'o'
      end
      object edtCodigo: TEdit
        Left = 16
        Top = 22
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edtNome: TEdit
        Left = 16
        Top = 68
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object btnAlterar: TButton
        Left = 113
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Alterar'
        TabOrder = 2
        OnClick = btnAlterarClick
      end
      object btnExcluir: TButton
        Left = 209
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 3
        OnClick = btnExcluirClick
      end
      object btnGravar: TButton
        Left = 306
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 4
        OnClick = btnGravarClick
      end
    end
    object Consulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object grdItem: TDBGrid
        Left = 0
        Top = 0
        Width = 480
        Height = 205
        Align = alClient
        DataSource = dsItem
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object cdsItem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 104
    object intgrfldItemIdItem: TIntegerField
      FieldName = 'IdItem'
    end
    object strngfldItemDescricao: TStringField
      FieldName = 'Descricao'
      Size = 45
    end
  end
  object dsItem: TDataSource
    DataSet = cdsItem
    Left = 352
    Top = 104
  end
end
