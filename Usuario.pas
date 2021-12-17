unit Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, RouterOSAPI;

type
  TfrmUsuario = class(TForm)
    cds_usuario: TClientDataSet;
    cds_usuarioUSR_ID: TStringField;
    cds_usuarioUSR_LOGIN: TStringField;
    cds_usuarioUSR_SENHA: TStringField;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    edt_login: TEdit;
    btn_pesquisar: TButton;
    src_usuario: TDataSource;
    btn_adicionar: TButton;
    cds_usuarioUSR_IP: TStringField;
    btn_editar: TButton;
    btn_remover: TButton;
    cds_usuarioUSR_PERFIL: TStringField;
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_removerClick(Sender: TObject);
    procedure src_usuarioDataChange(Sender: TObject; Field: TField);
    procedure btn_adicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

{$R *.dfm}

uses APIClient, UsuarioCadastro;

procedure TfrmUsuario.btn_adicionarClick(Sender: TObject);
begin
  frmCadUsuario             := TfrmCadUsuario.Create(Application);
  try
    frmCadUsuario.ShowModal;
  finally
    FreeAndNil(frmCadUsuario);
  end;
  btn_pesquisarClick(Sender);
end;

procedure TfrmUsuario.btn_editarClick(Sender: TObject);
var
  I : Integer;
begin
  frmCadUsuario             := TfrmCadUsuario.Create(Application);
  try
    frmCadUsuario.edt_cod.Text   := cds_usuarioUSR_ID.AsString;
    frmCadUsuario.edt_login.Text := cds_usuarioUSR_LOGIN.AsString;
    frmCadUsuario.edt_senha.Text := cds_usuarioUSR_SENHA.AsString;
    for I := 0 to frmCadUsuario.cbb_perfil.Items.Count - 1 do
    begin
      if frmCadUsuario.cbb_perfil.Items[i] = cds_usuarioUSR_PERFIL.AsString then
      begin
        frmCadUsuario.cbb_perfil.ItemIndex := i;
        Break;
      end;
    end;
    frmCadUsuario.ShowModal;
  finally
    FreeAndNil(frmCadUsuario);
  end;
  btn_pesquisarClick(Sender);
end;

procedure TfrmUsuario.btn_pesquisarClick(Sender: TObject);
var
  pa: array of AnsiString;
  I : Integer;
  Res: TRosApiResult;
begin
  cds_usuario.EmptyDataSet;
  SetLength(pa, 1);
  pa[0] := '/ip/hotspot/user/print';
  Res := ROS.Query(pa, True);
  while not Res.Eof do
  begin
    cds_usuario.Append;
    for i := 0 to High(Res.Values) do
    begin
      if Res.Values[i].Name = '=.id' then
        cds_usuarioUSR_ID.AsString := Res.Values[i].Value
      else if Res.Values[i].Name = '=name' then
        cds_usuarioUSR_LOGIN.AsString := Res.Values[i].Value
      else if Res.Values[i].Name = '=password' then
        cds_usuarioUSR_SENHA.AsString := Res.Values[i].Value
      else if Res.Values[i].Name = '=ip-address' then
        cds_usuarioUSR_IP.AsString := Res.Values[i].Value
      else if Res.Values[i].Name = '=profile' then
        cds_usuarioUSR_PERFIL.AsString := Res.Values[i].Value
    end;
    cds_usuario.Post;
    Res.Next;
  end;
  cds_usuario.Filtered := False;
  if edt_login.Text <> '' then
  begin
    cds_usuario.Filter := 'USR_LOGIN = ' + QuotedStr(edt_login.Text);
    cds_usuario.Filtered := True;
  end;
  Res.Free;
end;

procedure TfrmUsuario.btn_removerClick(Sender: TObject);
var
  pa: array of AnsiString;
begin
  if MessageDlg('Confirma ?',mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    SetLength(pa, 2);
    pa[0] := '/ip/hotspot/user/remove';
    pa[1] := '=.id=' + cds_usuarioUSR_ID.AsString;

    ROS.Execute(pa);

    if ROS.LastError <> '' then
      ShowMessage('Erro ao remover Usuário : ' + ROS.LastError)
    else
      ShowMessage('Usuário removido com sucesso!');

    btn_pesquisarClick(Sender);
  end;
end;

procedure TfrmUsuario.src_usuarioDataChange(Sender: TObject; Field: TField);
begin
  btn_editar.Enabled  := not cds_usuario.IsEmpty;
  btn_remover.Enabled := not cds_usuario.IsEmpty;
end;

end.
