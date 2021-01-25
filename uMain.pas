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

uses uScreenManager, uConst;

procedure TfMain.FormCreate(Sender: TObject);
begin
    // показываем главное меню
    SM.SetMainScreen(layScreen);
end;

procedure TfMain.FormShow(Sender: TObject);
begin
    SM.ShowScreen(sMenu);
end;

end.
