program projetoVistoria;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Form.App in 'structure\Form.App.pas' {Form1},
  Web.Module in 'structure\Web.Module.pas' {WebModule1: TWebModule},
  Bo.Pessoa in 'bo\Bo.Pessoa.pas',
  Pessoa in 'classes\Pessoa.pas',
  Item in 'classes\Item.pas',
  Vistoria in 'classes\Vistoria.pas',
  Imovel in 'classes\Imovel.pas',
  ItemVistoria in 'classes\ItemVistoria.pas',
  Dao.Item in 'dao\Dao.Item.pas',
  Dao.Pessoa in 'dao\Dao.Pessoa.pas',
  Dao.Imovel in 'dao\Dao.Imovel.pas',
  Methods.Teste in 'servermethods\Methods.Teste.pas' {smTeste: TDSServerModule},
  BaseObject in 'classes\BaseObject.pas',
  BD.Connection in 'structure\BD.Connection.pas' {dmConnection: TDataModule},
  HttpStatusCode in 'classes\HttpStatusCode.pas',
  Methods.Pessoa in 'servermethods\Methods.Pessoa.pas' {smPessoa: TDSServerModule};

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmConnection, dmConnection);
  Application.Run;
end.
