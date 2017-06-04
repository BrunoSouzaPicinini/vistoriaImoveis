unit Form.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids, Pessoa,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls,Client.Classes, Client.Module, System.json;

type
  TfrmPessoa = class(TForm)
    pgcPessoa: TPageControl;
    tsCadastro: TTabSheet;
    Consulta: TTabSheet;
    grdPessoa: TDBGrid;
    dsPessoa: TDataSource;
    cdsPessoa: TClientDataSet;
    intgrfldPessoaIdPessoa: TIntegerField;
    cdsPessoaNome: TStringField;
    btnGravar: TButton;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblNome: TLabel;
    edtNome: TEdit;
    btnAlterar: TButton;
    btnExcluir: TButton;
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure getAllPessoa();
  end;

var
  frmPessoa: TfrmPessoa;

implementation

{$R *.dfm}
var
APessoaClient : TsmPessoaClient;

procedure TfrmPessoa.btnAlterarClick(Sender: TObject);
begin
  try
      APessoaClient := TsmPessoaClient.Create(ClientModule.dsConnection);
      APessoaClient.acceptPessoa(edtNome.Text ,StrToInt(edtCodigo.Text) );
      ShowMessage('Alterado com sucesso');
    finally
      FreeAndNil(APessoaClient);
    end;
end;

procedure TfrmPessoa.btnExcluirClick(Sender: TObject);
begin
  try
      APessoaClient := TsmPessoaClient.Create(ClientModule.dsConnection);
      APessoaClient.deleteUser(StrToInt(edtCodigo.Text) );
      ShowMessage('Excluido com sucesso');
    finally
      FreeAndNil(APessoaClient);
    end;
end;

procedure TfrmPessoa.btnGravarClick(Sender: TObject);
begin
    try
      APessoaClient := TsmPessoaClient.Create(ClientModule.dsConnection);
      APessoaClient.updatePessoa(edtNome.Text);
      ShowMessage('Gravado com sucesso');
    finally
      FreeAndNil(APessoaClient);
    end;
end;


procedure TfrmPessoa.FormShow(Sender: TObject);
begin
  getAllPessoa;
end;

procedure TfrmPessoa.getAllPessoa;
var
  APessoa: TPessoa;
  JArray: TJSONArray;
  i: Integer;
begin
  if not cdsPessoa.Active then
    cdsPessoa.CreateDataSet;

  cdsPessoa.EmptyDataSet;

  APessoaClient := TsmPessoaClient.Create(ClientModule.dsConnection);
  try
    JArray := APessoaClient.getAllPessoa();

    for i := 0 to JArray.Size -1 do
    begin
      APessoa := TPessoa.Create;
      try
        APessoa := TPessoa.JSONToObject<TPessoa>(JArray.Get(i));

        cdsPessoa.InsertRecord([APessoa.IdPessoa, APessoa.Nome]);
      finally
        APessoa.Free;
      end;
    end;
  finally
    FreeAndNil(APessoaClient);
  end;
end;

end.
