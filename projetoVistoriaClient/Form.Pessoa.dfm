object frmPessoa: TfrmPessoa
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsSizeToolWin
  Caption = 'Pessoa'
  ClientHeight = 201
  ClientWidth = 514
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
  object pgcPessoa: TPageControl
    Left = 0
    Top = 0
    Width = 514
    Height = 201
    ActivePage = tsCadastro
    Align = alClient
    TabOrder = 0
    object Consulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      ExplicitWidth = 439
      object grdPessoa: TDBGrid
        Left = 0
        Top = 0
        Width = 506
        Height = 173
        Align = alClient
        DataSource = dsPessoa
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      ExplicitLeft = 8
      ExplicitTop = 28
      ExplicitWidth = 439
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
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object btnGravar: TButton
        Left = 306
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 0
        OnClick = btnGravarClick
      end
      object edtCodigo: TEdit
        Left = 16
        Top = 22
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object edtNome: TEdit
        Left = 16
        Top = 68
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object btnAlterar: TButton
        Left = 113
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Alterar'
        TabOrder = 3
        OnClick = btnAlterarClick
      end
      object btnExcluir: TButton
        Left = 209
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 4
        OnClick = btnExcluirClick
      end
    end
  end
  object dsPessoa: TDataSource
    DataSet = cdsPessoa
    Left = 320
    Top = 56
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 56
    object intgrfldPessoaIdPessoa: TIntegerField
      FieldName = 'IdPessoa'
    end
    object cdsPessoaNome: TStringField
      FieldName = 'Nome'
      Size = 45
    end
  end
end
