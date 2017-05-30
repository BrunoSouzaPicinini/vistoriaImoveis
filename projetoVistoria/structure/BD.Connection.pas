unit BD.Connection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf;
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
  public
      class function getConnection(): TFDConnection;
  end;

var
  dmConnection: TdmConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TConnection }

class function TConnection.GetConnection: TFDConnection;
begin
  FormatSettings.DecimalSeparator := '.';

  with dmConnection do
  begin
    if not conDatabase.Connected then
      conDatabase.Open();

    Result := conDatabase;
  end;
end;

end.
