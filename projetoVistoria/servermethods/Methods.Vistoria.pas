unit Methods.Vistoria;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  System.JSON,Pessoa, Datasnap.DSProviderDataModuleAdapter,DBXPlatform,
  Imovel, Dao.Vistoria, Bo.Vistoria,Vistoria,
  HttpStatusCode;

type
  TsmVistoria = class(TDSServerModule)
  private
    { Private declarations }
  public
    function updateVistoria(AIdPessoa, AIdImovel: Integer;
      AData, AObeservacao: string): TVistoria; // Post - Create
    //
    procedure acceptVistoria(AIdVistoria, AIdImovel, AIdPessoa: Integer;
      AData, AObservacao: string); // PutUpdate
    //
    procedure cancelVistoria(AIdVistoria: Integer); // Delete - Delete
  end;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TsmVistoria }

procedure TsmVistoria.acceptVistoria(AIdVistoria, AIdImovel, AIdPessoa: Integer;
  AData, AObservacao: string);
var
  Dao: TVistoriaDao;
  Vistoria: TVistoria;
begin
  try
    try
      Dao := TVistoriaDao.Create;
      Vistoria := Dao.Read(AIdVistoria);
      TVistoriaBo.Update(Vistoria, AIdImovel, AIdPessoa, AData, AObservacao);
      Dao.Save(Vistoria);
      GetInvocationMetadata().ResponseCode := HttpStatusCode.SUCESS_ACCEPTED;
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

procedure TsmVistoria.cancelVistoria(AIdVistoria: Integer);
var
  Dao: TVistoriaDao;
begin
  try
    try
      Dao := TVistoriaDao.Create;
      Dao.Delete(AIdVistoria);

      GetInvocationMetadata().ResponseCode := HttpStatusCode.SUCCESS_CREATED_RESOURCE;
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

function TsmVistoria.updateVistoria(AIdPessoa, AIdImovel: Integer;
  AData, AObeservacao: string) : TVistoria;
var
  Dao: TVistoriaDao;
  Vistoria: TVistoria;
begin
  try
    try
      Dao := TVistoriaDao.Create;
      Vistoria := Dao.Save(TVistoriaBo.Create( AIdImovel,AIdPessoa, AData, AObeservacao));
      Result := Vistoria;
      GetInvocationMetadata().ResponseCode := HttpStatusCode.SUCCESS_CREATED_RESOURCE;
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

end.

