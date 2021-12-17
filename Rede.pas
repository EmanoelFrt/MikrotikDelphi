unit Rede;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, RouterOSAPI, APIClient;

type
  TfrmRede = class(TForm)
    Label1: TLabel;
    dbg_rede: TDBGrid;
    edt_ip: TEdit;
    btn_pesquisar: TButton;
    cds_rede: TClientDataSet;
    src_rede: TDataSource;
    cds_redeRDE_ID: TStringField;
    cds_redeRDE_NOME: TStringField;
    cds_redeRDE_LIMITE: TStringField;
    btn_adicionar: TButton;
    btn_editar: TButton;
    btn_remover: TButton;
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_removerClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_adicionarClick(Sender: TObject);
    procedure src_redeDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRede: TfrmRede;

implementation

{$R *.dfm}

uses PerfilCadastro;

procedure TfrmRede.btn_adicionarClick(Sender: TObject);
begin
  frmCadastroPerfil                     := TfrmCadastroPerfil.Create(Application);
  try
    frmCadastroPerfil.ShowModal;
  finally
    FreeAndNil(frmCadastroPerfil);
  end;
  btn_pesquisarClick(Sender);
end;

procedure TfrmRede.btn_editarClick(Sender: TObject);
begin
  frmCadastroPerfil                     := TfrmCadastroPerfil.Create(Application);
  try
    frmCadastroPerfil.edt_cod.Text      := cds_redeRDE_ID.AsString;
    frmCadastroPerfil.edt_nome.Text     := cds_redeRDE_NOME.AsString;
    frmCadastroPerfil.edt_upload.Text   := Copy(cds_redeRDE_LIMITE.AsString,1,pos('k/',cds_redeRDE_LIMITE.AsString) - 1);
    frmCadastroPerfil.edt_download.Text := Copy(cds_redeRDE_LIMITE.AsString,pos('k/',cds_redeRDE_LIMITE.AsString) + 2,Length(cds_redeRDE_LIMITE.AsString) - pos('k/',cds_redeRDE_LIMITE.AsString) - 2);
    frmCadastroPerfil.ShowModal;
  finally
    FreeAndNil(frmCadastroPerfil);
  end;
  btn_pesquisarClick(Sender);
end;

procedure TfrmRede.btn_pesquisarClick(Sender: TObject);
var
  pa: array of AnsiString;
  I : Integer;
  Res: TRosApiResult;
begin
  cds_rede.EmptyDataSet;
  SetLength(pa, 1);
  pa[0] := '/ip/hotspot/user/profile/print';
  Res := ROS.Query(pa, True);
  while not Res.Eof do
  begin
    cds_rede.Append;
    for i := 0 to High(Res.Values) do
    begin
      if Res.Values[i].Name = '=.id' then
        cds_redeRDE_ID.AsString := Res.Values[i].Value
      else if Res.Values[i].Name = '=name' then
        cds_redeRDE_NOME.AsString := Res.Values[i].Value
      else if Res.Values[i].Name = '=rate-limit' then
        cds_redeRDE_LIMITE.AsString := Res.Values[i].Value
    end;
    cds_rede.Post;
    Res.Next;
  end;
  cds_rede.Filtered := False;
  if edt_ip.Text <> '' then
  begin
    cds_rede.Filter := 'RDE_NOME = ' + QuotedStr(edt_ip.Text);
    cds_rede.Filtered := True;
  end;
  Res.Free;
end;

procedure TfrmRede.btn_removerClick(Sender: TObject);
var
  pa: array of AnsiString;
begin
  if MessageDlg('Confirma ?',mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    SetLength(pa, 2);
    pa[0] := '/ip/hotspot/user/profile/remove';
    pa[1] := '=.id=' + cds_redeRDE_ID.AsString;

    ROS.Execute(pa);

    if ROS.LastError <> '' then
      ShowMessage('Erro ao remover Perfil : ' + ROS.LastError)
    else
      ShowMessage('Perfil removido com sucesso!');

    btn_pesquisarClick(Sender);
  end;
end;

procedure TfrmRede.src_redeDataChange(Sender: TObject; Field: TField);
begin
  btn_editar.Enabled  := not cds_rede.IsEmpty;
  btn_remover.Enabled := not cds_rede.IsEmpty;
end;

end.
