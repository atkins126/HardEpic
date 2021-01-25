unit uMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, XSuperObject;

type
  TfMenu = class(TForm)
    layForm: TLayout;
    Label1: TLabel;
    Rectangle1: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    Rectangle2: TRectangle;
    lNewBirth: TLabel;
    Rectangle3: TRectangle;
    lContinue: TLabel;
    Rectangle4: TRectangle;
    lLanguage: TLabel;
    Rectangle5: TRectangle;
    lExit: TLabel;
    RoundRect1: TRoundRect;
    Label5: TLabel;
    RoundRect2: TRoundRect;
    Label4: TLabel;
    procedure Rectangle5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Rectangle2Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
    procedure RoundRect2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Update(data: ISuperObject);
  end;

var
  fMenu: TfMenu;

implementation

{$R *.fmx}

uses uScreenManager, uGameManager, uConst;

procedure TfMenu.FormCreate(Sender: TObject);
begin
   SM.AddScreen(sMenu, layForm);
end;

procedure TfMenu.Rectangle2Click(Sender: TObject);
begin
   GM.NewGame;
   GM.UpdateInterface([sMap]);
   SM.ShowScreen(sMap);
end;

procedure TfMenu.Rectangle3Click(Sender: TObject);
begin
   GM.ContinueGame;
   GM.UpdateInterface([sMap]);
   SM.ShowScreen(sMap);
end;

procedure TfMenu.Rectangle5Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfMenu.RoundRect1Click(Sender: TObject);
begin
   GM.DecLanguage;              // меняем язык
   GM.SaveGame;                 // сохраняем состояние игры, чтобы язык изменился при продолжении игры
   GM.UpdateInterface([sMenu]);
end;

procedure TfMenu.RoundRect2Click(Sender: TObject);
begin
   GM.IncLanguage;              // меняем язык
   GM.SaveGame;                 // сохраняем состояние игры, чтобы язык изменился при продолжении игры
   GM.UpdateInterface([sMenu]);
end;

procedure TfMenu.Update(data: ISuperObject);
begin
    if not Assigned(data) then exit;

    if Assigned(data[menu_newgame])  then lNewBirth.text := data.S[menu_newgame];
    if Assigned(data[menu_continue]) then lContinue.text := data.S[menu_continue];
    if Assigned(data[menu_language]) then lLanguage.text := data.S[menu_language];
    if Assigned(data[menu_exit])     then lExit.text := data.S[menu_exit];
end;

end.
