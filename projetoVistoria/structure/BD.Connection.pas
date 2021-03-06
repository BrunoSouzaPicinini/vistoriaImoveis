unit BD.Connection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, Data.DB, FireDAC.Comp.Client;

type
  TdmConnection = class(TDataModule)
    conDatabase: TFDConnection;
    dlPg: TFDPhysPgDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
   TConnection = class
     class function GetConnection : TFDConnection;
   end;
var
  dmConnection: TdmConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TConnection }

class function TConnection.GetConnection: TFDConnection;
begin
  with dmConnection do
  begin
    if not conDatabase.Connected then
      conDatabase.Open();
     Result := conDatabase;
  end;
end;

end.
