unit Dao.Imovel;

interface
uses
System.Generics.Collections, DBXJSON, DBXJSONReflect, BD.Connection,Dialogs,Messages,
  FireDAC.Comp.Client, SysUtils, Imovel, FireDAC.Phys.Intf, FireDAC.DApt;

type
  TImovelDao = class
  private
    class function Create (AImovel: TImovel): TImovel;
    class function Update (AImovel: TImovel): TImovel;
    class procedure Consolidate (var AImovel: TImovel; AQuery : TFDQuery);
  public
    class function Read(): TObjectList<TImovel>; overload;
    class function Read(AIdImovel: Integer) : TImovel; overload;
    class function Save(AImovel : TImovel): TImovel;
    class procedure Delete (AIdImovel: Integer);
  end;

implementation

{ TImovelDao }

class procedure TImovelDao.Consolidate(var AImovel: TImovel; AQuery: TFDQuery);
begin
 with AQuery do
  begin
    AImovel.IdImovel := FindField('idimovel').AsInteger;
    AImovel.Quadra := FindField('quadra').AsString;
    AIMovel.lote := FindField('lote').AsString;
    AImovel.metragemTerreno := FindField('metragemterreno').AsFloat;
    AImovel.metragemImovel := FindField('metragemimovel').AsFloat;
    AImovel.logradouro := FindField('logradouro').AsString;
    AImovel.bairro := FindField('bairro').AsString;
    AImovel.complemento := FindField('complemento').AsString;
    AImovel.numero := FindField('numero').AsInteger;
    AImovel.cep := FindField('cep').AsString;
  end;
end;

class function TImovelDao.Create(AImovel: TImovel): TImovel;
var
  Con : TFDConnection;
  QueryString : string;
begin
  Con := TConnection.GetConnection;
  FormatSettings.DecimalSeparator := '.';
  QueryString := Format(
  'INSERT INTO aula.cadimovel '+
  '(quadra,lote,metragemterreno,metragemimovel,logradouro,bairro,complemento,numero,cep)'+
  ' VALUES ( ''%s'',''%s'',''%n'',''%n'',''%s'',''%s'',''%s'',''%d'',''%s'' ) RETURNING idimovel',
    [AImovel.quadra,AImovel.lote,AImovel.metragemterreno,AImovel.metragemimovel,AImovel.logradouro,AImovel.bairro,AImovel.complemento,AImovel.numero,AImovel.cep]);
  //ShowMessage(QueryString);
  AImovel.idImovel := Con.ExecSQLScalar(QueryString);

  Result := AImovel;
end;

class procedure TImovelDao.Delete(AIdImovel: Integer);
var
  Con: TFDConnection;
  QueryString: string;
begin
  Con := TConnection.GetConnection;
  QueryString := Format('DELETE FROM aula.cadimovel WHERE idimovel = %d', [AIdImovel]);
  Con.ExecSQL(QueryString);
end;

class function TImovelDao.Read(AIdImovel: Integer): TImovel;
var
  Query: TFDQuery;
  QueryString: string;
begin
  Result := TImovel.Create;
  Query := TFDQuery.Create(nil);

  QueryString := Format('SELECT * FROM aula.cadimovel WHERE idimovel = %d', [AIdImovel]);

  with Query do
  begin
    Connection := TConnection.GetConnection;
    Close;
    SQL.Clear;
    SQL.Add(QueryString);
    Open;

    if IsEmpty then
      Raise Exception.Create('Not Found.');

    First;
    Consolidate(Result, Query);
  end;
end;

class function TImovelDao.Read: TObjectList<TImovel>;
var
  Query: TFDQuery;
  QueryString: string;
  Imovel: TImovel;
begin
  Result := TObjectList<TImovel>.Create;
  Query := TFDQuery.Create(nil);

  QueryString := 'SELECT * FROM aula.cadimovel';

  with Query do
  begin
    Connection := TConnection.GetConnection;
    Close;
    SQL.Clear;
    SQL.Add(QueryString);
    Open;

    if IsEmpty then
      Raise Exception.Create('Not Found.');

    First;
    while not eof do
    begin
      Imovel := TImovel.Create;
      Consolidate(Imovel, Query);
      Result.Add(Imovel);
      Next;
    end;
  end;
end;

class function TImovelDao.Save(AImovel: TImovel): TImovel;
begin
  if (AImovel.IdImovel = 0) then
  begin
    Exit(Create(AImovel));
  end;
    Exit(Update(AImovel));
end;

class function TImovelDao.Update(AImovel: TImovel): TImovel;
var
  Con: TFDConnection;
  QueryString: string;
begin
  Con := TConnection.getConnection;
  FormatSettings.DecimalSeparator := '.';
  QueryString := Format(
    'UPDATE aula.cadimovel SET quadra = ''%s'', lote=''%s'' , '+
    ' metragemterreno =''%n'', metragemimovel =''%n'', logradouro = ''%s'', '+
    ' bairro =''%s'', complemento =''%s'',numero=''%d'', cep=''%s'' '+
    ' WHERE idimovel = %d',
    [AImovel.quadra, AImovel.lote, AImovel.metragemterreno, AImovel.metragemimovel,AImovel.logradouro
    ,AImovel.bairro, AImovel.complemento, AImovel.numero,AImovel.cep, AImovel.idimovel ]
  );

  Con.ExecSQL(QueryString);

  Result := AImovel;
end;

end.
