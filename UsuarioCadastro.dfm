object frmCadUsuario: TfrmCadUsuario
  Left = 0
  Top = 0
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 184
  ClientWidth = 413
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    413
    184)
  PixelsPerInch = 96
  TextHeight = 13
  object Login: TLabel
    Left = 8
    Top = 48
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object label1: TLabel
    Left = 135
    Top = 48
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 24
    Height = 13
    Caption = 'Perfil'
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object edt_login: TEdit
    Left = 8
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edt_senha: TEdit
    Left = 135
    Top = 67
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
  end
  object btn_gravar: TButton
    Left = 168
    Top = 151
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Gravar'
    TabOrder = 4
    OnClick = btn_gravarClick
  end
  object btn_cancelar: TButton
    Left = 249
    Top = 151
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btn_cancelarClick
  end
  object edt_cod: TEdit
    Left = 8
    Top = 25
    Width = 121
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 0
  end
  object btn_sair: TButton
    Left = 330
    Top = 151
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Sair'
    TabOrder = 6
    OnClick = btn_sairClick
  end
  object cbb_perfil: TComboBox
    Left = 8
    Top = 115
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'cbb_perfil'
  end
end
