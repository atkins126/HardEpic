unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts;

type
  TfMain = class(TForm)
    layScreen: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    initWidth, initHeight: integer;
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.iPhone55in.fmx IOS}

uses uScreenManager, uConst, uGameManager;

procedure TfMain.FormCreate(Sender: TObject);
begin

{$IFDEF MSWINDOWS}
    fMain.FullScreen := false;
{$ENDIF}
{$IFDEF ANDROID}
    fMain.FullScreen := true;
{$ENDIF}

    // ��������� ������-�����, � ������� ����� ������������ ������� ����
    SM.SetMainScreen(layScreen);

    // ��� ������ ��������� ���������� �������� ������� ������, ��� ������� ������� ���������
    initHeight := ClientHeight;
    initWidth := ClientWidth;
end;

procedure TfMain.FormShow(Sender: TObject);
begin
    // ��� ������ ����� ��� ����������� �� ���� �����.
    // ������� ���������������, ����� ��� ���� ������������.
    // �������� ��� �� �������� �� Align = Scale, �� �� �� ����� �������������� �����
    layScreen.Scale.X := ClientWidth / initWidth;
    layScreen.Scale.Y := ClientHeight / initHeight;

    // ���������� ������� ����
    GM.UpdateInterface([sMenu]);
    SM.ShowScreen(sMenu);
end;

end.
