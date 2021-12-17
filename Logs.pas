unit Logs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RouterOSAPI;

type
  TfrmLogs = class(TForm)
    mm_logs: TMemo;
    btn_consultar: TButton;
    procedure btn_consultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogs: TfrmLogs;

implementation

{$R *.dfm}

uses ControleRedes, Ping, APIClient;

procedure TfrmLogs.btn_consultarClick(Sender: TObject);
var
  Res: TRosApiResult;
  pa: array of AnsiString;
  Log : String;
  I : Integer;
begin
  mm_logs.Clear;
  SetLength(pa, 1);
  pa[0] := '/log/print';
  Res := ROS.Query(pa, True);
  while not Res.Eof do
  begin
    Log := '';
    for i := 0 to High(Res.Values) do
    begin
      if Res.Values[i].Name = '=time' then
        Log := Log + Res.Values[i].Value + ' - '
      else if Res.Values[i].Name = '=message' then
        Log := Log + Res.Values[i].Value;
    end;
    mm_logs.Lines.Add(Log);
    Res.Next;
  end;
  Res.Free;
end;

end.
