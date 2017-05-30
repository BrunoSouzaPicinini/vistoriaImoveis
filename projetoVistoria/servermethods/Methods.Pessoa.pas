unit Methods.Pessoa;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  System.JSON,Pessoa, Datasnap.DSProviderDataModuleAdapter,DBXPlatform;

type
  TsmPessoa = class(TDSServerModule)
  private
    { Private declarations }
  public
    function getPessoa(AIdPessoa: Integer): TJSONValue; //GET - READ
    function getAllPessoa(): TJSONArray; //GET - READ
    procedure createPessoa(APessoa: TPessoa ); //POST - CREATE
    procedure updatePessoa(APessoa: TPessoa );  //PUT - UPDATE
    procedure deleteUser(AIdPessoa: Integer);  //DELETE - DELETE
  end;

implementation
uses Dao.Pessoa, Bo.Pessoa, HttpStatusCode;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDSServerModule }

procedure TsmPessoa.createPessoa(APessoa: TPessoa);
var
  Dao: TPessoaDao;
begin
  try
    try
      Dao := TPessoaDao.Create;

      TPessoaBo.Create(APessoa.nome);
      Dao.Save(APessoa);

      GetInvocationMetadata().ResponseCode := HttpStatusCode.SUCCESS_NO_CONTENT;
    except
      on e : Exception do
      begin
        GetInvocationMetadata().ResponseCode := HttpStatusCode.SERVER_ERROR;
      end
    end;
  finally
    Dao.Free;
  end;
end;

procedure TsmPessoa.deleteUser(AIdPessoa: Integer);
var
  Dao: TPessoaDao;
begin
  try
    try
      Dao := TPessoaDao.Create;
      Dao.Delete(AIdPessoa);

      GetInvocationMetadata().ResponseCode := HttpStatusCode.SUCCESS_NO_CONTENT;
    except
      on e: Exception do
      begin
        GetInvocationMetadata().ResponseCode := HttpStatusCode.SERVER_ERROR;
      end
    end;
  finally
    Dao.Free;
  end;
end;

function TsmPessoa.getAllPessoa: TJSONArray;
var
  Dao: TPessoaDao;
  Pessoa: TPessoa;
begin
  Result := TJSONArray.Create;
  try
    try
      Dao := TPessoaDao.Create;
      for Pessoa in Dao.Read do
        Result.AddElement(TPessoa.ObjectToJSON(Pessoa));
      GetInvocationMetadata().ResponseCode := HttpStatusCode.SUCCESS;
    except
      on e: Exception do
      begin
        GetInvocationMetadata().ResponseCode := HttpStatusCode.NOT_FOUND;
      end
    end;
  finally
    Dao.Free;
  end;

end;

function TsmPessoa.getPessoa(AIdPessoa: Integer): TJSONValue;
var
  Dao: TPessoaDao;
  Pessoa: TPessoa;
begin
  Result := TJSONValue.Create;
  try
    try
      Dao := TPessoaDao.Create;
      Result := TPessoa.ObjectToJSON(Dao.Read(AIdPessoa));
      GetInvocationMetadata().ResponseCode := HttpStatusCode.SUCCESS;
    except
      on e: Exception do
      begin
        GetInvocationMetadata().ResponseCode := HttpStatusCode.NOT_FOUND;
      end
    end;
  finally
    Dao.Free;
  end;

end;

procedure TsmPessoa.updatePessoa(APessoa: TPessoa);
var
  Dao : TPessoaDao;
begin
  try
    try
      Dao := TPessoaDao.Create;
      Dao.Save(APessoa);
      GetInvocationMetadata().ResponseCode := HttpStatusCode.SUCCESS_NO_CONTENT;
    except
      on e : Exception do
      begin
        GetInvocationMetadata().ResponseCode := HttpStatusCode.SERVER_ERROR;
      end;
    end;
  finally
    Dao.Free;
  end;

end;

end.

