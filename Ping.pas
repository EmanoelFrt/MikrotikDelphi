unit Ping;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ipwcore, ipwtypes, ipwping, Vcl.StdCtrls;

type
  TfPing = class(TForm)
    Label1: TLabel;
    lTrack: TListBox;
    PingButton: TButton;
    tHostName: TEdit;
    ClearButton: TButton;
    ipwPing1: TipwPing;
    procedure PingButtonClick(Sender: TObject);
    procedure tHostNameKeyPress(Sender: TObject; var Key: Char);
    procedure ClearButtonClick(Sender: TObject);
    procedure lTrackMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    procedure DisplayError(ErrorMessage: string);
    procedure DisplayInfo;
  public
    { Public declarations }
  end;

var
  fPing: TfPing;

implementation

{$R *.dfm}

procedure TfPing.ClearButtonClick(Sender: TObject);
begin
   lTrack.Clear;
end;

procedure TfPing.DisplayError(ErrorMessage: string);

begin
   if ipwPing1.RemoteHost <> '' then
      lTrack.Items.Add('Error accessing ' + ipwPing1.RemoteHost +
                       ': ' + ErrorMessage)
   else
      lTrack.Items.Add('Error accessing ' + tHostName.Text +
                       ': ' + ErrorMessage);
end;

procedure TfPing.DisplayInfo;
begin
   lTrack.Items.Add('Remote Host: ' + ipwPing1.RemoteHost);
   lTrack.Items.Add('Source: ' + ipwPing1.ResponseSource);
   lTrack.Items.Add('Response Time: ' + IntToStr(ipwPing1.ResponseTime));
end;


procedure TfPing.lTrackMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if Button = mbRight then
      lTrack.Clear;
end;

procedure TfPing.PingButtonClick(Sender: TObject);
begin
   try
      ipwPing1.PacketSize := 32;
      ipwPing1.Timeout := 1; // Abandon ping attempt after one second
      lTrack.Items.Add ('sending 32 bytes to ' +
            tHostName.text + '...');
      ipwPing1.PingHost(tHostName.Text);
      DisplayInfo;
   except on E: EipwPing do
      DisplayError(e.Message);
   end;
end;

procedure TfPing.tHostNameKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
     begin
    	Key := #0;
    	PingButton.OnClick(Sender);
     end;
end;

end.
