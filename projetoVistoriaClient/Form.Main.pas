unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmMain = class(TForm)
    mmMenu: TMainMenu;
    Cadastros1: TMenuItem;
    Pessoa1: TMenuItem;
    Imovel1: TMenuItem;
    Item1: TMenuItem;
    Financeiro1: TMenuItem;
    Vistoria1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

end.
