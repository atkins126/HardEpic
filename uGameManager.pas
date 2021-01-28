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
        procedure RemoveGame;
        procedure UpdateInterface(scr: TScrSet);
        procedure IncDay(delta: integer = 0);
        function GetText(text_id: string): string;
        function GetLang: string;
        procedure DecLanguage;
        procedure IncLanguage;
    end;

var
   GM: TGameManager;

implementation

{ TGameManager }

uses uDataBase, System.IOUtils, uMap, uMenu;

procedure TGameManager.ContinueGame;
begin
    GM.DB := SO(DBjson);
    LoadGame;
end;

procedure TGameManager.NewGame;
var
    lang: integer;
begin
    lang := DB.O['state'].I['lang'];
    DB := SO(DBjson);
    DB.O['state'].I['lang'] := lang;
end;

procedure TGameManager.RemoveGame;
begin
    DeleteFile(TPath.GetHomePath + TPath.DirectorySeparatorChar + 'game.dat');
end;

function TGameManager.GetText(text_id: string): string;
begin
    result := DB.O['text'].O[GetLang].S[text_id];
end;

procedure TGameManager.DecLanguage;
// ���������� ���� � ������ ������� ���������
begin
    DB.O['state'].I['lang'] := DB.O['state'].I['lang'] - 1;
    if DB.O['state'].I['lang'] < Low(Lang)
    then DB.O['state'].I['lang'] := High(Lang);
end;

function TGameManager.GetLang: string;
begin
    result := Lang[DB.O['state'].I['lang']];
end;

procedure TGameManager.IncDay(delta: integer = 0);
begin
    DB.O['state'].I['day'] := DB.O['state'].I['day'] + delta;
end;

procedure TGameManager.IncLanguage;
// ���������� ���� � ����� ������� ���������
begin
    DB.O['state'].I['lang'] := DB.O['state'].I['lang'] + 1;
    if DB.O['state'].I['lang'] > High(Lang)
    then DB.O['state'].I['lang'] := Low(Lang);
end;

procedure TGameManager.LoadGame;
begin
   // ���������� ������ ��������� �� �����. ���� ������� ������ �� ���������
   DB.O['state'] := TSuperObject.ParseFile(TPath.GetHomePath + TPath.DirectorySeparatorChar + 'game.dat', false);

   // ������������� ������ ������
   DB.O['state'].I['lang'] := StrToIntDef(DB.O['state'].V['lang'], 0);
end;

procedure TGameManager.SaveGame;
begin
   // ��������� ������ ��������� � ����. ���� ������� ������ �� ���������
   GM.DB['state'].AsObject.SaveTo(TPath.GetHomePath + TPath.DirectorySeparatorChar + 'game.dat');
end;

procedure TGameManager.UpdateInterface(scr: TScrSet);
/// ���������� �������. � ����� �����������
var
   buf: IsuperObject;
begin
    if sMenu in scr then
    begin
        buf := SO();
        buf.S[menu_newgame]  := GetText(menu_newgame);
        buf.S[menu_continue] := GetText(menu_continue);
        buf.S[menu_language] := GetText(menu_language);
        buf.S[menu_exit]     := GetText(menu_exit);
        fMenu.Update(buf);
    end;

    if sMap in scr then
    begin
        buf := SO();
        buf.S[lbl_map] := GetText(lbl_map);

        buf.S[btn_turn] := GetText(btn_turn);
        buf.S[lbl_day]  := GetText(lbl_day);
        buf.S[lbl_res]  := GetText(lbl_res);
        buf.S[lbl_mp]   := GetText(lbl_mp);
        buf.S[lbl_iq]   := GetText(lbl_iq);

        buf.S['day'] := IntToStr(DB.O['state'].I['day']);
        buf.S['res'] := IntToStr(DB.O['state'].I['res']);
        buf.S['mp'] := IntToStr(DB.O['state'].I['mp']);
        buf.S['iq'] := IntToStr(DB.O['state'].I['iq']);

        buf.S['res_inc'] := IntToStr(DB.O['state'].I['res_inc']);
        buf.S['mp_inc'] := IntToStr(DB.O['state'].I['mp_inc']);
        buf.S['iq_inc'] := IntToStr(DB.O['state'].I['iq_inc']);

        fMap.Update(buf);
    end;
end;

initialization
   GM := TGameManager.Create;
   GM.DB := SO(DBjson);
   GM.LoadGame;

finalization
   GM.SaveGame;
   GM.Free;

end.
