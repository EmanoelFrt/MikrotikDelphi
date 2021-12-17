unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RouterOSAPI, StdCtrls, Buttons, XPMan, ExtCtrls, ComCtrls, ssl_openssl;

type
  TfrmMain = class(TForm)
    cmdConnect: TButton;
    mem: TMemo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtRouterIP: TEdit;
    Label2: TLabel;
    txtUsername: TEdit;
    txtPassword: TEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    XPManifest: TXPManifest;
    memCmd: TMemo;
    GroupBox3: TGroupBox;
    cmdQueryAndListen: TBitBtn;
    cmdCancel: TBitBtn;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    cmdQueryAndGetAll: TBitBtn;
    cmdExec: TBitBtn;
    tmrListen: TTimer;
    cmdClear: TBitBtn;
    StatusBar: TStatusBar;
    chkTLS: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmdConnectClick(Sender: TObject);
    procedure cmdQueryAndGetAllClick(Sender: TObject);
    procedure cmdQueryAndListenClick(Sender: TObject);
    procedure tmrListenTimer(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure cmdClearClick(Sender: TObject);
    procedure cmdExecClick(Sender: TObject);
  private
    ROS: TRosApiClient;
    ResListen: TRosApiResult;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses StrUtils;

type
  TSample = record
    Name,
    Cmd: String;
  end;

const
  Samples: array [1..3] of TSample = (
    (Name: 'IP -> Addresses'; Cmd: '/ip/address/print'),
    (Name: '/ip/dhcp-server/lease/print'; Cmd: '/ip/dhcp-server/lease/print'),
    (Name: '/interface/print'; Cmd: '/interface/print')
  );

{$R *.dfm}

function Replace(const AText, AFrom, ATo: String): String;
var
  p: Integer;
begin
  Result := AText;
  repeat
    p := Pos(#0, Result);
    if p = 0 then Exit;
    Delete(Result, p, 1);
    Insert('#0', Result, p);
  until False;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ROS := TRosApiClient.Create;

  ResListen := nil;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  ROS.Free;
end;

procedure TfrmMain.cmdConnectClick(Sender: TObject);
var
  Res: TRosApiResult;
  f: Boolean;
begin
  if chkTLS.Checked then
    f := ROS.SSLConnect(txtRouterIP.Text, txtUsername.Text, txtPassword.Text)
  else
    f := ROS.Connect(txtRouterIP.Text, txtUsername.Text, txtPassword.Text);

  if f then
  begin
    mem.Lines.Add('Connected!');
    Res := ROS.Query(['/system/resource/print'], True);
    if Res.Trap then
      mem.Lines.Add('Trap: ' + ROS.LastError)
    else
    begin
      mem.Lines.Add('Version: ' + Res['version']);
    end;
    Res.Free;

    cmdQueryAndGetAll.Enabled := True;
    cmdExec.Enabled := True;
    cmdQueryAndListen.Enabled := True;
  end
  else
  begin
    ShowMessage('Connection error: ' + ROS.LastError);
    Exit;
  end;
end;

procedure TfrmMain.cmdQueryAndGetAllClick(Sender: TObject);
var
  Res: TRosApiResult;
  pa: array of AnsiString;
  i: Integer;
  s: String;
begin
  SetLength(pa, 0);
  for i := 0 to memCmd.Lines.Count - 1 do
  begin
    s := Trim(memCmd.Lines[i]);
    if s <> '' then
    begin
      SetLength(pa, High(pa) + 2);
      pa[High(pa)] := s;
    end;
  end;

  if High(pa) >= 0 then
    Res := ROS.Query(pa, True)
  else
  begin
    ShowMessage('Enter a command');
    memCmd.SetFocus;
    Exit;
  end;

  if ROS.LastError <> '' then
    mem.Lines.Add('ERROR: ' + ROS.LastError);

  s := '';
  while not Res.Eof do
  begin
    for i := 0 to High(Res.Values) do
      s := s + Res.Values[i].Name + '=' + Res.Values[i].Value + #13#10;
    s := s + '----------------'#13#10;
    Res.Next;
  end;

  s := s + '================'#13#10;
  s := Replace(s, #0, '#0');

  mem.Lines.Add(s);

  Res.Free;
end;

procedure TfrmMain.cmdQueryAndListenClick(Sender: TObject);
var
  pa: array of AnsiString;
  i: Integer;
  s: String;
begin
  if Assigned(ResListen) then
  begin
    ShowMessage('Already running a ''Listen'' command?');
    Exit;
  end;

  SetLength(pa, 0);
  for i := 0 to memCmd.Lines.Count - 1 do
  begin
    s := Trim(memCmd.Lines[i]);
    if s <> '' then
    begin
      SetLength(pa, High(pa) + 2);
      pa[High(pa)] := s;
    end;
  end;

  if High(pa) >= 0 then
    ResListen := ROS.Query(pa, False)
  else
  begin
    ShowMessage('Enter a command');
    memCmd.SetFocus;
    Exit;
  end;

  cmdQueryAndListen.Enabled := False;
  cmdCancel.Enabled := True;
  tmrListen.Enabled := True;
end;

procedure TfrmMain.tmrListenTimer(Sender: TObject);      
var
  i: Integer;
  s: String;
begin
  s := '';
  repeat
    if not ResListen.GetOne(False) then Break;
    if ResListen.Trap then
    begin
      s := s + 'Trap: ' + ROS.LastError + #13#10'================'#13#10;
      Break;
    end;
    if ResListen.Done then
    begin
      s := s + #13#10'Done'#13#10'================'#13#10;
      ResListen.Free;
      ResListen := nil;
      tmrListen.Enabled := False;
      cmdQueryAndListen.Enabled := True;
      cmdCancel.Enabled := False;
      Break;
    end;

    for i := 0 to High(ResListen.Values) do
      s := s + ResListen.Values[i].Name + '=' + ResListen.Values[i].Value + #13#10;
    s := s + '----------------'#13#10;
  until False;

  if s = '' then Exit;
  s := Replace(s, #0, '#0');
  mem.Lines.Add(s);
end;

procedure TfrmMain.cmdCancelClick(Sender: TObject);
begin
  ResListen.Cancel;
end;

procedure TfrmMain.cmdClearClick(Sender: TObject);
begin
  mem.Clear;
  mem.SetFocus;
end;

procedure TfrmMain.cmdExecClick(Sender: TObject);
var
  pa: array of AnsiString;
  i: Integer;
  s: String;
begin
  SetLength(pa, 0);
  for i := 0 to memCmd.Lines.Count - 1 do
  begin
    s := Trim(memCmd.Lines[i]);
    if s <> '' then
    begin
      SetLength(pa, High(pa) + 2);
      pa[High(pa)] := s;
    end;
  end;

  if High(pa) >= 0 then
    ROS.Execute(pa)
  else
  begin
    ShowMessage('Enter a command');
    memCmd.SetFocus;
    Exit;
  end;

  if ROS.LastError <> '' then
    mem.Lines.Add('ERROR: ' + ROS.LastError);

  s := 'Done';
  s := s + '================'#13#10;
  s := Replace(s, #0, '#0');

  mem.Lines.Add(s);
end;

end.
