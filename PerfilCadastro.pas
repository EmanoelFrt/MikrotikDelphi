unit PerfilCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RouterOSAPI, APIClient;

type
  TfrmCadastroPerfil = class(TForm)
    Login: TLabel;
    Label2: TLabel;
    edt_nome: TEdit;
    btn_gravar: TButton;
    btn_cancelar: TButton;
    edt_cod: TEdit;
    btn_sair: TButton;
    label1: TLabel;
    edt_upload: TEdit;
    Label3: TLabel;
    edt_download: TEdit;
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPerfil: TfrmCadastroPerfil;

implementation

{$R *.dfm}

procedure TfrmCadastroPerfil.btn_cancelarClick(Sender: TObject);
var
  pa: array of AnsiString;
  I : Integer;
  Res: TRosApiResult;
begin
  SetLength(pa, 1);
  pa[0] := '/ip/hotspot/user/profile/print';
  Res := ROS.Query(pa, True);
  while not Res.Eof do
  begin
    for i := 0 to High(Res.Values) do
    begin
      if Res.Values[i].Name = '=.id' then
        edt_cod.Text := Res.Values[i].Value
      else if Res.Values[i].Name = '=name' then
        edt_nome.Text := Res.Values[i].Value
      else if Res.Values[i].Name = '=rate-limit' then
      begin
        edt_upload.Text   := Copy(Res.Values[i].Value,1,pos('k/',Res.Values[i].Value) - 1);
        edt_download.Text := Copy(Res.Values[i].Value,pos('k/',Res.Values[i].Value) + 2,Length(Res.Values[i].Value) - pos('k/',Res.Values[i].Value) - 2);
      end;
    end;
    Res.Next;
  end;
  Res.Free;
end;

procedure TfrmCadastroPerfil.btn_gravarClick(Sender: TObject);
var
  pa: array of AnsiString;
  I : Integer;
  Res: TRosApiResult;
  bCodigo : Boolean;
begin
  bCodigo := False;
  SetLength(pa, 1);
  pa[0] := '/ip/hotspot/user/profile/print';
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
    SetLength(pa, 4);
    pa[0] := '/ip/hotspot/user/profile/set';
    pa[1] := '=.id=' + edt_cod.Text;
    pa[2] := '=name=' + edt_nome.Text;
    pa[3] := '=rate-limit=' + edt_upload.Text + 'k/' + edt_download.Text + 'k';
  end
  else
  begin
    SetLength(pa, 3);
    pa[0] := '/ip/hotspot/user/profile/add';
    pa[1] := '=name=' + edt_nome.Text;
    pa[2] := '=rate-limit=' + edt_upload.Text + 'k/' + edt_download.Text + 'k';
  end;

  ROS.Execute(pa);

  if ROS.LastError <> '' then
    ShowMessage('Erro ao Gravar Perfil : ' + ROS.LastError)
  else
    ShowMessage('Perfil Gravado com sucesso!');

  bCodigo := False;
  SetLength(pa, 1);
  pa[0] := '/ip/hotspot/user/profile/print';
  Res := ROS.Query(pa, True);
  while not Res.Eof do
  begin
    for I := 0 to High(Res.Values) do
      if Res.Values[i].Name = '=name' then
        if Res.Values[i].Value = edt_nome.Text then
          bCodigo := True;

    if bCodigo then
    begin
      for i := 0 to High(Res.Values) do
      begin
        if Res.Values[i].Name = '=.id' then
          edt_cod.Text := Res.Values[i].Value
        else if Res.Values[i].Name = '=name' then
          edt_nome.Text := Res.Values[i].Value
        else if Res.Values[i].Name = '=rate-limit' then
        begin
          edt_upload.Text   := Copy(Res.Values[i].Value,1,pos('k/',Res.Values[i].Value) - 1);
          edt_download.Text := Copy(Res.Values[i].Value,pos('k/',Res.Values[i].Value) + 2,Length(Res.Values[i].Value) - pos('k/',Res.Values[i].Value) - 2);
        end;
      end;
    end;
    bCodigo := False;
    Res.Next;
  end;
  Res.Free;
end;

procedure TfrmCadastroPerfil.btn_sairClick(Sender: TObject);
begin
  Close;
end;

end.
