unit ItemVistoria;

interface
uses
BaseObject, Item, Vistoria;

type
  TItemVistoria = class (TBaseObject)
  private
    FIdItemVistoria : Integer;
    FItem : TItem;
    FVistoria : TVistoria;
    FObservacao : string;
  public
    property IdItemVistoria: Integer read FIdItemVistoria write FIdItemVistoria;
    property Item: TItem read FItem write FItem;
    property Vistoria: TVistoria read FVistoria write FVistoria;
    property Observacao: string read FObservacao write FObservacao;
  end;

implementation

end.
