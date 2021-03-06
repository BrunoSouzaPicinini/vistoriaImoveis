program client_app;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {frmMain},
  Form.Pessoa in 'Form.Pessoa.pas' {frmPessoa},
  Client.Module in 'dm\Client.Module.pas' {ClientModule: TDataModule},
  Client.Classes in 'Client.Classes.pas',
  BaseObject in 'classes\BaseObject.pas',
  HttpStatusCode in 'classes\HttpStatusCode.pas',
  Imovel in 'classes\Imovel.pas',
  Item in 'classes\Item.pas',
  ItemVistoria in 'classes\ItemVistoria.pas',
  Pessoa in 'classes\Pessoa.pas',
  Vistoria in 'classes\Vistoria.pas',
  Form.Item in 'Form.Item.pas' {frmItem},
  Form.Imovel in 'Form.Imovel.pas' {frmImovel},
  Form.Vistoria in 'Form.Vistoria.pas' {frmVistoria};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TClientModule, ClientModule);
  Application.Run;
end.
