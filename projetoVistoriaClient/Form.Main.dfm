object frmMain: TfrmMain
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Sistema'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object mmMenu: TMainMenu
    Left = 208
    Top = 56
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Pessoa1: TMenuItem
        Caption = 'Pessoa'
      end
      object Imovel1: TMenuItem
        Caption = 'Imovel'
      end
      object Item1: TMenuItem
        Caption = 'Item'
      end
    end
    object Financeiro1: TMenuItem
      Caption = 'Financeiro'
      object Vistoria1: TMenuItem
        Caption = 'Vistoria'
      end
    end
  end
end
