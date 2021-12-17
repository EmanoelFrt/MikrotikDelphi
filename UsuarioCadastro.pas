unit UsuarioCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RouterOSAPI;

type
  TfrmCadUsuario = class(TForm)
    Login: TLabel;
    edt_login: TEdit;
    label1: TLabel;
    Label3: TLabel;
    edt_senha: TEdit;
    btn_gravar: TButton;
    btn_cancelar: TButton;
    Label2: TLabel;
    edt_cod: TEdit;
    btn_sair: TButton;
    cbb_perfil: TComboBox;
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

{$R *.dfm}

uses APIClient;

procedure TfrmCadUsuario.btn_cancelarClick(Sender: TObject);
var
  pa: array of AnsiString;
  I : Integer;
  Res: TRosApiResult;
  bCodigo : Boolean;
begin
  bCodigo := False;
  SetLength(pa, 1);
  pa[0] := '/ip/hotspot/user/print';
  Res := ROS.Query(pa, True);
  while not Res.Eof do
  begin
    for I := 0 to High(Res.Values) do
      if Res.Values[i].Name = '=.id' then
        if Res.Values[i].Value = edt_cod.Text then
          bCodigo := True;

    if bCodigo then
    begin
      for i := 0 to High(Res.Values) do
      begin
        if Res.Values[i].Name = '=.id' then
          edt_cod.Text := Res.Values[i].Value
        else if Res.Values[i].Name = '=name' then
          edt_login.Text := Res.Values[i].Value
        else if Res.Values[i].Name = '=password' then
          edt_senha.Text := Res.Values[i].Value
      end;
    end;
    bCodigo := False;
    Res.Next;
  end;
  Res.Free;
end;

procedure TfrmCadUsuario.btn_gravarClick(Sender: TObject);
var
  pa: array of AnsiString;
  I : Integer;
  Res: TRosApiResult;
  bCodigo : Boolean;
begin
  bCodigo := False;
  SetLength(pa, 1);
  pa[0] := '/ip/hotspot/user/print';
  Res := ROS.Query(pa, True);
  while not Res.Eof do
  begin
    for I := 0 to High(Res.Values) do
      if Res.Values[i].Name = '=.id' then
        if Res.Values[i].Value = edt_cod.Text then
        begin
          bCodigo := True;
          Break;
        end;
    Res.Next;
  end;
  Res.Free;

  if bCodigo then
  begin
    SetLength(pa, 5);
    pa[0] := '/ip/hotspot/user/set';
    pa[1] := '=.id=' + edt_cod.Text;
    pa[2] := '=name=' + edt_login.Text;
    pa[3] := '=password=' + edt_senha.Text;
    pa[4] := '=profile=' + cbb_perfil.Text;
  end
  else
  begin
    SetLength(pa, 4);
    pa[0] := '/ip/hotspot/user/add';
    pa[1] := '=name=' + edt_login.Text;
    pa[2] := '=password=' + edt_senha.Text;
    pa[3] := '=profile=' + cbb_perfil.Text;
  end;


  ROS.Execute(pa);

  if ROS.LastError <> '' then
    ShowMessage('Erro ao Gravar Usuário : ' + ROS.LastError)
  else
    ShowMessage('Usuário Gravado com sucesso!');

  bCodigo := False;
  SetLength(pa, 1);
  pa[0] := '/ip/hotspot/user/print';
  Res := ROS.Query(pa, True);
  while not Res.Eof do
  begin
    for I := 0 to High(Res.Values) do
      if Res.Values[i].Name = '=name' then
        if Res.Values[i].Value = edt_login.Text then
          bCodigo := True;

    if bCodigo then
    begin
      for i := 0 to High(Res.Values) do
      begin
        if Res.Values[i].Name = '=.id' then
          edt_cod.Text := Res.Values[i].Value
        else if Res.Values[i].Name = '=name' then
          edt_login.Text := Res.Values[i].Value
        else if Res.Values[i].Name = '=password' then
          edt_senha.Text := Res.Values[i].Value;
      end;
    end;
    bCodigo := False;
    Res.Next;
  end;
  Res.Free;
end;

procedure TfrmCadUsuario.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
var
  pa: array of AnsiString;
  I : Integer;
  Res: TRosApiResult;
begin
  cbb_perfil.Clear;
  SetLength(pa, 1);
  pa[0] := '/ip/hotspot/user/profile/print';
  Res := ROS.Query(pa, True);
  while not Res.Eof do
  begin
    for i := 0 to High(Res.Values) do
    begin
      if Res.Values[i].Name = '=name' then
        cbb_perfil.Items.Add(Res.Values[i].Value);
    end;
    Res.Next;
  end;
  Res.Free;
end;

end.
