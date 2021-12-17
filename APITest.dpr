program APITest;

uses
  Forms,
  MainForm in 'MainForm.pas' {frmMain},
  RouterOSAPI in '..\Common\RouterOSAPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'RouterOS API Demo';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
