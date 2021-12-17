unit fLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    img_user: TImage;
    lbl_login: TLabel;
    edt_login: TEdit;
    lbl_senha: TLabel;
    edt_senha: TEdit;
    btn_login: TButton;
    btn_sair: TButton;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses Proj_Eng3, MainForm, APIClient;

procedure TfrmLogin.btn_loginClick(Sender: TObject);
begin
  if (Trim(edt_login.Text) = '') and (Trim(edt_senha.Text) = '') then
    raise Exception.Create('Informe o Login e a Senha !');

  Conectar('192.168.1.4',edt_login.Text, edt_senha.Text);

  frmMenu := TfrmMenu.Create(Application);
  try
    frmLogin.Visible := False;
    frmMenu.ShowModal;
    frmLogin.Close;
  finally
    frmMenu.Free;
  end;
end;

procedure TfrmLogin.btn_sairClick(Sender: TObject);
begin
  Close;
end;

end.
