unit ControleRedes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ipwcore, ipwtypes, ipwipmonitor;

type
  TfControleRedes = class(TForm)
    bStart: TButton;
    txtPacketData: TMemo;
    txtPayload: TMemo;
    lvwPackets: TListView;
    IPMonitor1: TipwIPMonitor;
    Label2: TLabel;
    Label3: TLabel;
    procedure bStartClick(Sender: TObject);
    procedure lvwPacketsClick(Sender: TObject);
    procedure IPMonitor1IPPacket(Sender: TObject; const SourceAddress: string;
      SourcePort: Integer; const DestinationAddress: string;
      DestinationPort, IPVersion, TOS, Id, Flags, Offset, TTL, Checksum,
      IPProtocol: Integer; Payload: string; PayloadB: TArray<System.Byte>;
      Timestamp: Int64);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  Packet_INFO = record
    SourceAddress: String;
    SourcePort: longint;
    DestinationAddress: String;
    DestinationPort: longint;
    IPVersion: longint;
    TOS: longint;
    Id: longint;
    Flags: longint;
    Offset: longint;
    TTL: longint;
    Checksum: longint;
    IPProtocol: longint;
    Payload: String;
  end;

var
  fControleRedes: TfControleRedes;
  packets: Array of Packet_INFO;
  packetcount: Integer;

implementation

{$R *.dfm}

procedure TfControleRedes.bStartClick(Sender: TObject);
begin
  If IPMonitor1.Active = False Then
  begin
    lvwPackets.Items.Clear();
    IPMonitor1.Active := true;
    IPMonitor1.AcceptData := true;
    bStart.Caption := 'Parar';
  end
  else
  begin
    IPMonitor1.Active := False;
    bStart.Caption := 'Iniciar';
  end;
end;

procedure TfControleRedes.IPMonitor1IPPacket(Sender: TObject;
  const SourceAddress: string; SourcePort: Integer;
  const DestinationAddress: string; DestinationPort, IPVersion, TOS, Id, Flags,
  Offset, TTL, Checksum, IPProtocol: Integer; Payload: string;
  PayloadB: TArray<System.Byte>; Timestamp: Int64);
var
  pi: Packet_INFO;
begin
  pi.Checksum := Checksum;
  pi.DestinationAddress := DestinationAddress;
  pi.DestinationPort := DestinationPort;
  pi.Flags := Flags;
  pi.Id := Id;
  pi.IPProtocol := IPProtocol;
  pi.IPVersion := IPVersion;
  pi.Offset := Offset;
  pi.Payload := Payload;
  pi.SourceAddress := SourceAddress;
  pi.SourcePort := SourcePort;
  SetLength(packets, Length(packets) + 1);
  packets[packetcount] := pi;
  packetcount := packetcount + 1;
  lvwPackets.Items.Add();
  lvwPackets.Items.Item[lvwPackets.Items.Count - 1].Caption := IntToStr(pi.Id);
  lvwPackets.Items.Item[lvwPackets.Items.Count - 1].SubItems.Add
    (IntToStr(pi.IPProtocol));
  lvwPackets.Items.Item[lvwPackets.Items.Count - 1].SubItems.Add
    (pi.SourceAddress);
  lvwPackets.Items.Item[lvwPackets.Items.Count - 1].SubItems.Add
    (IntToStr(pi.SourcePort));
  lvwPackets.Items.Item[lvwPackets.Items.Count - 1].SubItems.Add
    (pi.DestinationAddress);
  lvwPackets.Items.Item[lvwPackets.Items.Count - 1].SubItems.Add
    (IntToStr(pi.DestinationPort));
  lvwPackets.Items.Item[lvwPackets.Items.Count - 1].SubItems.Add
    (IntToStr(pi.IPVersion));
end;

procedure TfControleRedes.lvwPacketsClick(Sender: TObject);
var
  i, j, ascvalue: Integer;
  ch: char;
begin
  if lvwPackets.Selected <> nil then
  begin
    txtPacketData.Clear();
    txtPacketData.Text := txtPacketData.Text + 'FONTE' + Chr(9) + Chr(9) + ': '
      + packets[lvwPackets.Selected.Index].SourceAddress + ', port ' +
      IntToStr(packets[lvwPackets.Selected.Index].SourcePort) + #13#10;
    txtPacketData.Text := txtPacketData.Text + 'DESTINO' + #9#9 + ': ' +
      packets[lvwPackets.Selected.Index].DestinationAddress + ', port ' +
      IntToStr(packets[lvwPackets.Selected.Index].DestinationPort) + #13#10;
    txtPacketData.Text := txtPacketData.Text + 'ID' + #9#9 + ': ' +
      IntToStr(packets[lvwPackets.Selected.Index].Id) + #13#10;
    txtPacketData.Text := txtPacketData.Text + 'Tempo do Pacote' + #9 + ': ' +
      IntToStr(packets[lvwPackets.Selected.Index].TTL) + #13#10;

    txtPayload.Clear();
    // txtPayLoad.Text := Packets[lvwPackets.Selected.Index].PayLoad;

    // txtPayLoad.Text : '';
    For j := 1 To Length(packets[lvwPackets.Selected.Index].Payload) do
    begin
      ch := packets[lvwPackets.Selected.Index].Payload[j];
      ascvalue := ORD(ch);
      If (ascvalue >= 32) And (ascvalue <= 126) Then
      begin
        txtPayload.Text := txtPayload.Text + ch;
      end;
    end;
  end;
end;

end.
