﻿object frmImovel: TfrmImovel
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsSizeToolWin
  Caption = 'Im'#243'vel'
  ClientHeight = 286
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcImovel: TPageControl
    Left = 0
    Top = 0
    Width = 624
    Height = 286
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
      object lblQuadra: TLabel
        Left = 168
        Top = 3
        Width = 36
        Height = 13
        Caption = 'Quadra'
      end
      object lblBairro: TLabel
        Left = 312
        Top = 3
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object lblComplemento: TLabel
        Left = 464
        Top = 3
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object lblCep: TLabel
        Left = 464
        Top = 49
        Width = 19
        Height = 13
        Caption = 'Cep'
      end
      object Número: TLabel
        Left = 312
        Top = 49
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object lblMetragemTerreno: TLabel
        Left = 168
        Top = 51
        Width = 89
        Height = 13
        Caption = 'Metragem Terreno'
      end
      object lblLote: TLabel
        Left = 16
        Top = 51
        Width = 21
        Height = 13
        Caption = 'Lote'
      end
      object lblMetragemImovel: TLabel
        Left = 168
        Top = 101
        Width = 83
        Height = 13
        Caption = 'Metragem Im'#243'vel'
      end
      object lblLogradouro: TLabel
        Left = 16
        Top = 101
        Width = 55
        Height = 13
        Caption = 'Logradouro'
      end
      object edtCodigo: TEdit
        Left = 16
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object btnAlterar: TButton
        Left = 168
        Top = 208
        Width = 75
        Height = 25
        Caption = 'Alterar'
        TabOrder = 11
        OnClick = btnAlterarClick
      end
      object btnExcluir: TButton
        Left = 274
        Top = 208
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 12
        OnClick = btnExcluirClick
      end
      object btnGravar: TButton
        Left = 62
        Top = 208
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 10
        OnClick = btnGravarClick
      end
      object edtQuadra: TEdit
        Left = 168
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object edtLote: TEdit
        Left = 16
        Top = 70
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object edtMetragemTerreno: TEdit
        Left = 168
        Top = 70
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object edtMetragemImovel: TEdit
        Left = 168
        Top = 120
        Width = 121
        Height = 21
        TabOrder = 9
      end
      object edtLogradouro: TEdit
        Left = 16
        Top = 120
        Width = 121
        Height = 21
        TabOrder = 8
      end
      object edtBairro: TEdit
        Left = 312
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object edtNumero: TEdit
        Left = 312
        Top = 70
        Width = 121
        Height = 21
        TabOrder = 6
      end
      object edtCep: TEdit
        Left = 464
        Top = 70
        Width = 121
        Height = 21
        TabOrder = 7
      end
      object edtComplemento: TEdit
        Left = 464
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 3
      end
    end
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object grdImovel: TDBGrid
        Left = 0
        Top = 0
        Width = 616
        Height = 258
        Align = alClient
        DataSource = dsImovel
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object dsImovel: TDataSource
    DataSet = cdsImovel
    Left = 364
    Top = 232
  end
  object cdsImovel: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 412
    Top = 232
    object intgrfldImovelIdImovel: TIntegerField
      FieldName = 'IdImovel'
    end
    object strngfldImovelquadra: TStringField
      FieldName = 'quadra'
      Size = 45
    end
    object strngfldImovellote: TStringField
      FieldName = 'lote'
      Size = 45
    end
    object fltfldImovelmetragemterreno: TFloatField
      FieldName = 'metragemterreno'
    end
    object fltfldImovelmetragemimovel: TFloatField
      FieldName = 'metragemimovel'
    end
    object strngfldImovellogradouro: TStringField
      FieldName = 'logradouro'
      Size = 45
    end
    object strngfldImovelbairro: TStringField
      FieldName = 'bairro'
      Size = 45
    end
    object strngfldImovelcomplemento: TStringField
      FieldName = 'complemento'
      Size = 45
    end
    object intgrfldImovelnumero: TIntegerField
      FieldName = 'numero'
    end
    object strngfldImovelcep: TStringField
      FieldName = 'cep'
      Size = 45
    end
  end
end
