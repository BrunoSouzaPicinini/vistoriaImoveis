object DataModule1: TDataModule1
  Left = 0
  Top = 0
  ClientHeight = 111
  ClientWidth = 199
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dlPg: TFDPhysPgDriverLink
    Left = 24
    Top = 8
  end
  object conDatabase: TFDConnection
    Params.Strings = (
      'Database=vistoriaImoveis'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
    Left = 24
    Top = 72
  end
end
