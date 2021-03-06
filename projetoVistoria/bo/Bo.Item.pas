unit Bo.Item;

interface
uses
Item;

type
TItemBo = class
  private
  public
    class function Create(const ADescricao : string): TItem;
    class procedure Update(var AItem : TItem; const ADescricao: string);
end;
implementation

{ TItemDao }

class function TItemBo.Create(const ADescricao: string): TItem;
begin
   Result := TItem.Create;
   Result.IdItem := 0;
   Result.Descricao := ADescricao;
end;

class procedure TItemBo.Update(var AItem: TItem; const ADescricao: string);
begin
  AItem.descricao := ADescricao;
end;

end.
