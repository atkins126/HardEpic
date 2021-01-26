program HardEpic;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {fMain},
  uMenu in 'uMenu.pas' {fMenu},
  uScreenManager in 'uScreenManager.pas',
  uMap in 'uMap.pas' {fMap},
  uGameManager in 'uGameManager.pas',
  uDataBase in 'uDataBase.pas',
  XSuperJSON in 'x-superobject-master\XSuperJSON.pas',
  XSuperObject in 'x-superobject-master\XSuperObject.pas',
  uConst in 'uConst.pas',
  uAtlas in 'uAtlas.pas' {fAtlas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfMenu, fMenu);
  Application.CreateForm(TfMap, fMap);
  Application.CreateForm(TfAtlas, fAtlas);
  Application.Run;
end.
