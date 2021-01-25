unit uMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfMenu = class(TForm)
    layForm: TLayout;
    Label1: TLabel;
    Rectangle1: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    Rectangle2: TRectangle;
    Label4: TLabel;
    Rectangle3: TRectangle;
    Label5: TLabel;
    Rectangle4: TRectangle;
    Label6: TLabel;
    Rectangle5: TRectangle;
    Label7: TLabel;
    procedure Rectangle5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Rectangle2Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
   SM.ShowScreen(sMap);
end;

procedure TfMenu.Rectangle3Click(Sender: TObject);
begin
   GM.ContinueGame;
   SM.ShowScreen(sMap);
end;

procedure TfMenu.Rectangle5Click(Sender: TObject);
begin
   Application.Terminate;
end;

end.
