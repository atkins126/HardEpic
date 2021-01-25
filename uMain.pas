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
    // указываем объект-экран, в котором будут отображаться игровые окна
    SM.SetMainScreen(layScreen);
end;

procedure TfMain.FormShow(Sender: TObject);
begin
    GM.UpdateInterface([sMenu]);
    SM.ShowScreen(sMenu);
end;

end.
