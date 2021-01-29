unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Platform;

type
  TfMain = class(TForm)
    layScreen: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    initWidth, initHeight: integer;
    scale: real;
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

    // указываем объект-экран, в котором будут отображаться игровые окна
    SM.SetMainScreen(layScreen);

    // при старте программы запоминаем исходные размеры экрана, под который делался интерфейс
    initHeight := ClientHeight;
    initWidth := ClientWidth;
end;

procedure TfMain.FormShow(Sender: TObject);
var
 ScreenSvc: IFMXScreenService;
begin
    Scale := 1;
//    if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenSvc))
//    then Scale := ScreenSvc.GetScreenScale;

    // при показе форма уже растянулась на весь экран.
    // врубаем масштабирование, чтобы под него подстроиться.
    // примерно так же сработал бы Align = Scale, но он не умеет масштабировать текст
    layScreen.Scale.X := ClientWidth / initWidth / Scale;
    layScreen.Scale.Y := ClientHeight / initHeight / Scale;

{
    lStat.Text := Format('W:%d|%d|%f H:%d|%d|%f S:%f',[
        initWidth, ClientWidth, layScreen.Scale.X,
        initHeight, ClientHeight, layScreen.Scale.Y,
        Scale
    ]);
}

    // отображаем главное меню
    GM.UpdateInterface([sMenu]);
    SM.ShowScreen(sMenu);
end;

end.
