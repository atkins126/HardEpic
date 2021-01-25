unit uGameManager;

interface

uses XSuperObject, uConst, SysUtils;

type
    TScrSet = set of TScreenTypes;

    TGameManager = class
        DB: ISuperObject;
      public
        procedure NewGame;
        procedure ContinueGame;
        procedure LoadGame;
        procedure SaveGame;
        procedure UpdateInterface(scr: TScrSet);
        procedure IncDay(delta: integer = 0);
    end;

var
   GM: TGameManager;

implementation

{ TGameManager }

uses uDataBase, System.IOUtils, uMap;

procedure TGameManager.ContinueGame;
begin
    GM.DB := SO(DBjson);
    LoadGame;
    UpdateInterface([sMap]);
end;

procedure TGameManager.NewGame;
begin
    GM.DB := SO(DBjson);
    UpdateInterface([sMap]);
end;

procedure TGameManager.IncDay(delta: integer = 0);
begin
    DB.O['state'].I['day'] := DB.O['state'].I['day'] + delta;
end;

procedure TGameManager.LoadGame;
begin
   // подгружаем раздел состояния из файла. пути берутся исходя из платформы
   DB.O['state'] := TSuperObject.ParseFile(TPath.GetHomePath + TPath.DirectorySeparatorChar + 'game.dat', false);
end;

procedure TGameManager.SaveGame;
begin
   // сохраняем раздел состояния в файл. пути берутся исходя из платформы
   GM.DB['state'].AsObject.SaveTo(TPath.GetHomePath + TPath.DirectorySeparatorChar + 'game.dat');
end;

procedure TGameManager.UpdateInterface(scr: TScrSet);
var
   buf: IsuperObject;
begin
    if sMap in scr then
    begin
        buf := SO();
        buf.S['day'] := IntToStr(DB.O['state'].I['day']);
        buf.S['res'] := IntToStr(DB.O['state'].I['res']);
        fMap.Update(buf);
    end;
end;

initialization
   GM := TGameManager.Create;

finalization
   GM.SaveGame;
   GM.Free;

end.
