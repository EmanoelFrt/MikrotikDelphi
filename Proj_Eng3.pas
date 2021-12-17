unit Proj_Eng3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, RouterOSAPI;

type
  TfrmMenu = class(TForm)
    pnl_menu: TPanel;
    img_user: TImage;
    lbl_user: TLabel;
    TreeView: TTreeView;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_cpu: TLabel;
    lbl_tempo: TLabel;
    lbl_memoria: TLabel;
    lbl_disco: TLabel;
    tmp_info: TTimer;
    Shape5: TShape;
    lbl_ip: TLabel;
    Label6: TLabel;
    procedure TreeViewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmp_infoTimer(Sender: TObject);
  private
    procedure CarregaInfo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;
  Res: TRosApiResult;

implementation

{$R *.dfm}

uses ControleRedes, Ping, APIClient, Logs, Terminal, Usuario, Rede,
  UsuariosConectados;

procedure TfrmMenu.CarregaInfo;
var
  pa: array of AnsiString;
  I : Integer;
begin
  lbl_ip.Caption := IP;
  SetLength(pa, 1);
  pa[0] := '/system/resource/print';
  Res := ROS.Query(pa, True);
  while not Res.Eof do
  begin
    for i := 0 to High(Res.Values) do
    begin
      if Res.Values[i].Name = '=uptime' then
        lbl_tempo.Caption := Res.Values[i].Value
      else if Res.Values[i].Name = '=cpu-load' then
        lbl_cpu.Caption := Res.Values[i].Value + '%'
      else if Res.Values[i].Name = '=free-memory' then
        lbl_memoria.Caption := FloatToStr(Round(StrToFloat(Res.Values[i].Value)/8000000)) + ' MB'
      else if Res.Values[i].Name = '=free-hdd-space' then
        lbl_disco.Caption := FloatToStr(Round(StrToFloat(Res.Values[i].Value)/8000000)) + ' MB'
    end;
    Res.Next;
  end;
  Res.Free;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
  CarregaInfo;
 // lbl_cpu.Caption := '';
end;

procedure TfrmMenu.tmp_infoTimer(Sender: TObject);
begin
  CarregaInfo;
end;

procedure TfrmMenu.TreeViewClick(Sender: TObject);
begin
  if TreeView.Selected = TreeView.Items[1] then
  begin
    if not Assigned(fControleRedes) then
    begin
      fControleRedes          := TfControleRedes.Create(frmMenu);
      try
        fControleRedes.Top    := 20;
        fControleRedes.Left   := 275;
        fControleRedes.ShowModal;
      finally
        FreeAndNil(fControleRedes);
      end;
    end;
  end
  else if TreeView.Selected = TreeView.Items[2] then
  begin
    if not Assigned(fPing) then
    begin
      fPing          := TfPing.Create(frmMenu);
      try
        fPing.Top    := 20;
        fPing.Left   := 275;
        fPing.ShowModal;
      finally
        FreeAndNil(fPing);
      end;
    end;
  end
  else if TreeView.Selected = TreeView.Items[3] then
  begin
    if not Assigned(frmLogs) then
    begin
      frmLogs          := TfrmLogs.Create(frmMenu);
      try
        frmLogs.Top    := 20;
        frmLogs.Left   := 275;
        frmLogs.ShowModal;
      finally
        FreeAndNil(frmLogs);
      end;
    end;
  end
  else if TreeView.Selected = TreeView.Items[4] then
  begin
    if not Assigned(frmLogs) then
    begin
      frmUsuariosConectados := TfrmUsuariosConectados.Create(frmMenu);
      try
        frmUsuariosConectados.Top    := 20;
        frmUsuariosConectados.Left   := 275;
        frmUsuariosConectados.ShowModal;
      finally
        FreeAndNil(frmUsuariosConectados);
      end;
    end;
  end
  else if TreeView.Selected = TreeView.Items[6] then
  begin
    if not Assigned(frmLogs) then
    begin
      frmTerminal          := TfrmTerminal.Create(frmMenu);
      try
        frmTerminal.Top    := 20;
        frmTerminal.Left   := 275;
        frmTerminal.ShowModal;
      finally
        FreeAndNil(frmTerminal);
      end;
    end;
  end
  else if TreeView.Selected = TreeView.Items[7] then
  begin
    if not Assigned(frmLogs) then
    begin
      frmUsuario          := TfrmUsuario.Create(frmMenu);
      try
        frmUsuario.Top    := 20;
        frmUsuario.Left   := 275;
        frmUsuario.ShowModal;
      finally
        FreeAndNil(frmUsuario);
      end;
    end;
  end
  else if TreeView.Selected = TreeView.Items[8] then
  begin
    if not Assigned(frmLogs) then
    begin
      frmRede          := TfrmRede.Create(frmMenu);
      try
        frmRede.Top    := 20;
        frmRede.Left   := 275;
        frmRede.ShowModal;
      finally
        FreeAndNil(frmRede);
      end;
    end;
  end;
  TreeView.Select(TreeView.Items[0]);
end;

end.
