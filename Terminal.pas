unit Terminal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, StrUtils, RouterOSAPI;

type
  TfrmTerminal = class(TForm)
    mem: TMemo;
    GroupBox2: TGroupBox;
    memCmd: TMemo;
    btn_exec: TBitBtn;
    btn_consult: TBitBtn;
    btn_cancel: TBitBtn;
    btn_limpar: TBitBtn;
    procedure btn_execClick(Sender: TObject);
    procedure btn_consultClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
  private
    function Replace(const AText, AFrom, ATo: String): String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTerminal: TfrmTerminal;
  Res: TRosApiResult;

implementation

{$R *.dfm}

uses APIClient;

function TfrmTerminal.Replace(const AText, AFrom, ATo: String): String;
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

procedure TfrmTerminal.btn_consultClick(Sender: TObject);
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
    ShowMessage('Informe um comando');
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

procedure TfrmTerminal.btn_execClick(Sender: TObject);
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

procedure TfrmTerminal.btn_limparClick(Sender: TObject);
begin
  mem.Clear;
end;

end.
