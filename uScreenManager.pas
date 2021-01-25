unit uScreenManager;

interface

uses
  FMX.Types, Generics.Collections, uConst;

type

  TScreenManager = class
      screen : TFMXObject;           // объект, в котором будут отображаться игровые экраны
      CurrScreenType: TScreenTypes;  // идентификатор текущего отображаемого экрана
      ScreenSet: TDictionary<TScreenTypes, TFMXObject>;
                                     // набор ссылок на экраны с привязкой к идентификаторам
    public
      procedure SetMainScreen(_screen: TFMXObject);
      procedure ShowScreen(id: TScreenTypes);
      procedure AddScreen(id: TScreenTypes; _screen: TFMXObject);
  end;

var
   SM: TScreenManager;

implementation

{ TScreenManager }


procedure TScreenManager.AddScreen(id: TScreenTypes; _screen: TFMXObject);
begin
   ScreenSet.Add(id, _screen);
end;

procedure TScreenManager.SetMainScreen(_screen: TFMXObject);
begin
    screen := _screen;
end;

procedure TScreenManager.ShowScreen(id: TScreenTypes);
// показываем указанный экран
var
    pair: TPair<TScreenTypes, TFMXObject>;
begin
    for pair in ScreenSet do
    begin
        if pair.Key = id then pair.Value.Parent := screen;
        if pair.Key <> id then pair.Value.Parent := nil;
    end;
end;

initialization
   SM := TScreenManager.Create;
   SM.ScreenSet := TDictionary<TScreenTypes, TFMXObject>.Create();

finalization
   SM.ScreenSet.Free;
   SM.Free;

end.
