unit uMap;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, XSuperObject,
  System.Math.Vectors, StrUtils;

type
  TFilterState = (fsNature, fsWar, fsEconomy, fsAll);

  TfMap = class(TForm)
    layForm: TLayout;
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
    Label3: TLabel;
    Label4: TLabel;
    rAll: TRectangle;
    lAll: TLabel;
    iGold: TImage;
    iMana: TImage;
    iBrain: TImage;
    lGoldChange: TLabel;
    lMPChange: TLabel;
    lIQChange: TLabel;
    rMenu: TRectangle;
    Image1: TImage;
    rEconomy: TRectangle;
    rWar: TRectangle;
    rEvents: TRectangle;
    lEventCount: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    rNature: TRectangle;
    Image7: TImage;
    FlowLayout2: TFlowLayout;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    FlowLayout3: TFlowLayout;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    FlowLayout4: TFlowLayout;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    FlowLayout5: TFlowLayout;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    FlowLayout6: TFlowLayout;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    FlowLayout7: TFlowLayout;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    FlowLayout8: TFlowLayout;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    FlowLayout9: TFlowLayout;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    FlowLayout10: TFlowLayout;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bTurnClick(Sender: TObject);
    procedure rMenuClick(Sender: TObject);
    procedure rNatureClick(Sender: TObject);
    procedure rWarClick(Sender: TObject);
    procedure rEconomyClick(Sender: TObject);
    procedure rAllClick(Sender: TObject);
  private
    { Private declarations }
    _filter: TFilterState;
    procedure SetFilter(const Value: TFilterState);
  public
    property Filter: TFilterState read _filter write SetFilter;
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
   Filter := fsAll;
end;

procedure TfMap.rAllClick(Sender: TObject);
begin
    Filter := fsAll;
end;

procedure TfMap.rEconomyClick(Sender: TObject);
begin
    Filter := fsEconomy;
end;

procedure TfMap.rMenuClick(Sender: TObject);
begin
    GM.SaveGame;
    SM.ShowScreen(sMenu);
end;

procedure TfMap.rNatureClick(Sender: TObject);
begin
    Filter := fsNature;
end;

procedure TfMap.rWarClick(Sender: TObject);
begin
    Filter := fsWar;
end;

procedure TfMap.SetFilter(const Value: TFilterState);
begin
    if Value = fsNature
    then rNature.Stroke.Kind := TBrushKind.Solid
    else rNature.Stroke.Kind := TBrushKind.None;

    if Value = fsWar
    then rWar.Stroke.Kind := TBrushKind.Solid
    else rWar.Stroke.Kind := TBrushKind.None;

    if Value = fsEconomy
    then rEconomy.Stroke.Kind := TBrushKind.Solid
    else rEconomy.Stroke.Kind := TBrushKind.None;

    if Value = fsAll
    then rAll.Stroke.Kind := TBrushKind.Solid
    else rAll.Stroke.Kind := TBrushKind.None;
end;

procedure TfMap.bTurnClick(Sender: TObject);
begin
    GM.IncDay;
    GM.UpdateGame;
    GM.UpdateInterface([sMap]);
end;

procedure TfMap.Update(data: ISuperObject);
// обновляем интерфейс
begin
   if not Assigned(data) then exit;

   // обновляем текст интерфейса текущим языком
   if Assigned(data[lbl_map])     then lMap.Text := data.S[lbl_map];
   if Assigned(data[btn_turn])    then lTurn.Text := data.S[btn_turn];
   if Assigned(data[lbl_all])     then lAll.Text := data.S[lbl_all];
   if Assigned(data['event_count']) then lEventCount.Text := data.S['event_count'];


   // отображаем текущее количество ресурсов
   if data.S['res'] <> ''
   then lRes.Text := data.S['res']
   else lRes.Text := '0';

   if data.S['mp'] <> ''
   then lMP.Text := data.S['mp']
   else lMP.Text := '0';

   if data.S['iq'] <> ''
   then lIQ.Text := data.S['iq']
   else lIQ.Text := '0';

   // добавляем текущий прирост
   if   data.S['res_inc'] <> '' then
   begin
       lGoldChange.Text := ifthen( data.V['res_inc'] < 0, '', '+') + data.S['res_inc'];

       if data.V['res_inc'] = 0 then lGoldChange.TextSettings.FontColor := TAlphaColorRec.Black;
       if data.V['res_inc'] > 0 then lGoldChange.TextSettings.FontColor := TAlphaColorRec.Darkgreen;
       if data.V['res_inc'] < 0 then lGoldChange.TextSettings.FontColor := TAlphaColorRec.Darkred;
   end;

   if   data.S['mp_inc'] <> '' then
   begin
       lMPChange.Text := ifthen( data.V['mp_inc'] < 0, '', '+') + data.S['mp_inc'];

       if data.V['mp_inc'] = 0 then lMPChange.TextSettings.FontColor := TAlphaColorRec.Black;
       if data.V['mp_inc'] > 0 then lMPChange.TextSettings.FontColor := TAlphaColorRec.Darkgreen;
       if data.V['mp_inc'] < 0 then lMPChange.TextSettings.FontColor := TAlphaColorRec.Darkred;
   end;

   if   data.S['iq_inc'] <> '' then
   begin
       lIQChange.Text := ifthen( data.V['iq_inc'] < 0, '', '+') + data.S['iq_inc'];

       if data.V['iq_inc'] = 0 then lIQChange.TextSettings.FontColor := TAlphaColorRec.Black;
       if data.V['iq_inc'] > 0 then lIQChange.TextSettings.FontColor := TAlphaColorRec.Darkgreen;
       if data.V['iq_inc'] < 0 then lIQChange.TextSettings.FontColor := TAlphaColorRec.Darkred;
   end;

end;

end.
