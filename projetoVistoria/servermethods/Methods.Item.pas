unit Methods.Item;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  Datasnap.DSProviderDataModuleAdapter,DBXPlatform, Item,System.JSON;

type
  TsmItem = class(TDSServerModule)
  private
    { Private declarations }
  public
    function getItem(AIdItem : Integer): TJSONValue;
    function getAllItem():TJSONArray;
    procedure updateItem(ADescricao : string);
    procedure acceptItem(ADescricao : string; AIdItem : Integer);
    procedure deleteItem(AidItem: Integer);
  end;

implementation
uses Dao.Item,Bo.Item ,HttpStatusCode;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TsmItem }

procedure TsmItem.acceptItem( ADescricao: string; AIdItem: Integer);
var
  Dao : TItemDao;
  AItem : TItem;
begin
  try
    try
      Dao := TItemDao.Create;
      AItem := Dao.Read(AIdItem);
      TItemBo.Update(AItem, ADescricao);
      Dao.Save(AItem);
      GetInvocationMetadata().ResponseCode := HttpStatusCode.SUCCESS_CREATED_RESOURCE;
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

procedure TsmItem.deleteItem(AidItem: Integer);
var
  Dao: TItemDao;
begin
  try
    try
      Dao := TItemDao.Create;
      Dao.Delete(AIdItem);

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

function TsmItem.getAllItem: TJSONArray;
var
  Dao: TItemDao;
  Item: TItem;
begin
  Result := TJSONArray.Create;
  try
    try
      Dao := TItemDao.Create;
      for Item in Dao.Read do
        Result.AddElement(TItem.ObjectToJSON(Item));
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

function TsmItem.getItem(AIdItem: Integer): TJSONValue;
var
  Dao: TItemDao;
  Item: TItem;
begin
  Result := TJSONValue.Create;
  try
    try
      Dao := TItemDao.Create;
      Result := TItem.ObjectToJSON(Dao.Read(AIdItem));
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

procedure TsmItem.updateItem(ADescricao: string);
var
  Dao: TItemDao;
begin
  try
    try
      Dao := TItemDao.Create;
      Dao.Save(TItemBo.Create(ADescricao));
      GetInvocationMetadata().ResponseCode := HttpStatusCode.SUCCESS_CREATED_RESOURCE;
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

end.

