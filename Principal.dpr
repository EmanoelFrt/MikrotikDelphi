program Principal;

uses
  Vcl.Forms,
  Proj_Eng3 in 'Proj_Eng3.pas' {frmMenu},
  fLogin in 'fLogin.pas' {frmLogin},
  ControleRedes in 'ControleRedes.pas' {fControleRedes},
  Ping in 'Ping.pas' {fPing},
  MainForm in 'MainForm.pas' {frmMain},
  APIClient in 'APIClient.pas',
  Logs in 'Logs.pas' {frmLogs},
  Terminal in 'Terminal.pas' {frmTerminal},
  Usuario in 'Usuario.pas' {frmUsuario},
  UsuarioCadastro in 'UsuarioCadastro.pas' {frmCadUsuario},
  Rede in 'Rede.pas' {frmRede},
  PerfilCadastro in 'PerfilCadastro.pas' {frmCadastroPerfil},
  UsuariosConectados in 'UsuariosConectados.pas' {frmUsuariosConectados};

{$R *.res}

begin
  TAPIClient.Create;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmCadastroPerfil, frmCadastroPerfil);
  Application.CreateForm(TfrmUsuariosConectados, frmUsuariosConectados);
  Application.Run;
end.
