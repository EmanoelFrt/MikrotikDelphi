unit UsuariosConectados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Vcl.StdCtrls,RouterOSAPI, APIClient;

type
  TfrmUsuariosConectados = class(TForm)
    DBGrid1: TDBGrid;
    btn_encerrar_con: TButton;
    btn_sair: TButton;
    cds_conexao: TClientDataSet;
    cds_conexaoCON_USER: TStringField;
    cds_conexaoCON_ENDERECO: TStringField;
    cds_conexaoCON_MAC: TStringField;
    cds_conexaoCON_ID: TStringField;
    src_conexao: TDataSource;
    btn_pesquisar: TButton;
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_encerrar_conClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure src_conexaoDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuariosConectados: TfrmUsuariosConectados;

implementation

{$R *.dfm}

procedure TfrmUsuariosConectados.btn_encerrar_conClick(Sender: TObject);
var
  pa: array of AnsiString;
begin
  if MessageDlg('Confirma ?',mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    SetLength(pa, 2);
    pa[0] := '/ip/hotspot/active/remove';
    pa[1] := '=.id=' + cds_conexaoCON_ID.AsString;

    ROS.Execute(pa);

    if ROS.LastError <> '' then
      ShowMessage('Erro ao encerrar Conexão : ' + ROS.LastError)
    else
      ShowMessage('Conexão encerrada com sucesso!');

    btn_pesquisarClick(Sender);
  end;
end;

procedure TfrmUsuariosConectados.btn_pesquisarClick(Sender: TObject);
var
  pa: array of AnsiString;
  I : Integer;
  Res: TRosApiResult;
begin
  cds_conexao.EmptyDataSet;
  SetLength(pa, 1);
  pa[0] := '/ip/hotspot/active/print';
  Res := ROS.Query(pa, True);
  while not Res.Eof do
  begin
    cds_conexao.Append;
    for i := 0 to High(Res.Values) do
    begin
      if Res.Values[i].Name = '=.id' then
        cds_conexaoCON_ID.AsString := Res.Values[i].Value
      else if Res.Values[i].Name = '=user' then
        cds_conexaoCON_USER.AsString := Res.Values[i].Value
      else if Res.Values[i].Name = '=address' then
        cds_conexaoCON_ENDERECO.AsString := Res.Values[i].Value
      else if Res.Values[i].Name = '=mac-address' then
        cds_conexaoCON_MAC.AsString := Res.Values[i].Value
    end;
    cds_conexao.Post;
    Res.Next;
  end;
  Res.Free;
end;

procedure TfrmUsuariosConectados.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUsuariosConectados.src_conexaoDataChange(Sender: TObject;
  Field: TField);
begin
  btn_encerrar_con.Enabled := not cds_conexao.IsEmpty;
end;

end.
