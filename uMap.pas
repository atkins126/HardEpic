unit uMap;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, XSuperObject;

type
  TfMap = class(TForm)
    layForm: TLayout;
    lDayCaption: TLabel;
    lDayValue: TLabel;
    Rectangle1: TRectangle;
    lResCaption: TLabel;
    lResValue: TLabel;
    Rectangle2: TRectangle;
    Label4: TLabel;
    Rectangle3: TRectangle;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Rectangle2Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Update(data: ISuperObject);
  end;

var
  fMap: TfMap;

implementation

{$R *.fmx}

uses uScreenManager, uConst, uGameManager;

procedure TfMap.FormCreate(Sender: TObject);
begin
   SM.AddScreen(sMap, layForm);
end;

procedure TfMap.Rectangle2Click(Sender: TObject);
begin
   SM.ShowScreen(sMenu);
end;

procedure TfMap.Rectangle3Click(Sender: TObject);
begin
   GM.IncDay(1);
   GM.UpdateInterface([sMap]);
end;

procedure TfMap.Update(data: ISuperObject);
// обновляем интерфейс
begin
   if not Assigned(data) then exit;

   if Assigned(data['day']) then lDayValue.Text := data.S['day'];
   if Assigned(data['res']) then lResValue.Text := data.S['res'];
end;

end.
