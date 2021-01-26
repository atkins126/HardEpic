unit uMap;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, XSuperObject,
  System.Math.Vectors, FMX.Controls3D, FMX.Layers3D;

type
  TfMap = class(TForm)
    layForm: TLayout;
    lDay: TLabel;
    rBG: TRectangle;
    lRes: TLabel;
    bTurn: TRectangle;
    lTurn: TLabel;
    lMP: TLabel;
    lIQ: TLabel;
    FlowLayout1: TFlowLayout;
    lMap: TLabel;
    VertScrollBox1: TVertScrollBox;
    flayMapItem: TFlowLayout;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Rectangle1: TRectangle;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bTurnClick(Sender: TObject);
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

procedure TfMap.bTurnClick(Sender: TObject);
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

   // обновляем текст интерфейса текущим языком
   if Assigned(data[lbl_map]) then lMap.Text := data.S[lbl_map];

   if Assigned(data[btn_turn]) then lTurn.Text := data.S[btn_turn];
   if Assigned(data[lbl_day]) then lDay.Text := data.S[lbl_day];
   if Assigned(data[lbl_res]) then lRes.Text := data.S[lbl_res];
   if Assigned(data[lbl_mp]) then lMP.Text := data.S[lbl_mp];
   if Assigned(data[lbl_iq]) then lIQ.Text := data.S[lbl_iq];

   // добавляем текущее количество
   if (data.S['day'] <> '')
   then lDay.Text := lDay.Text + ': ' + data.S['day']
   else lDay.Text := lDay.Text + ': 0';

   if data.S['res'] <> ''
   then lRes.Text := lRes.Text + ': ' + data.S['res']
   else lRes.Text := lRes.Text + ': 0';

   if data.S['mp'] <> ''
   then lMP.Text := lMP.Text + ': ' + data.S['mp']
   else lMP.Text := lMP.Text + ': 0';

   if data.S['iq'] <> ''
   then lIQ.Text := lIQ.Text + ': ' + data.S['iq']
   else lIQ.Text := lIQ.Text + ': 0';

   // добавляем текущий прирост
   if (data.S['res_inc'] <> '') and (data.S['res_inc'] <> '0')
   then lRes.Text := lRes.Text + ' (' + data.S['res_inc'] + ')';

   if (data.S['mp_inc'] <> '') and (data.S['mp_inc'] <> '0')
   then lMP.Text := lMP.Text + ' (' + data.S['mp_inc'] + ')';

   if (data.S['iq_inc'] <> '') and (data.S['iq_inc'] <> '0')
   then lIQ.Text := lIQ.Text + ' (' + data.S['iq_inc'] + ')';
end;

end.
