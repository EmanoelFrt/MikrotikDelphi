object frmCadastroPerfil: TfrmCadastroPerfil
  Left = 0
  Top = 0
  Caption = 'Cadastro de Perfil'
  ClientHeight = 190
  ClientWidth = 275
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    275
    190)
  PixelsPerInch = 96
  TextHeight = 13
  object Login: TLabel
    Left = 8
    Top = 48
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
  object label1: TLabel
    Left = 8
    Top = 96
    Width = 33
    Height = 13
    Caption = 'Upload'
  end
  object Label3: TLabel
    Left = 135
    Top = 96
    Width = 47
    Height = 13
    Caption = 'Download'
  end
  object edt_nome: TEdit
    Left = 8
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btn_gravar: TButton
    Left = 30
    Top = 157
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Gravar'
    TabOrder = 4
    OnClick = btn_gravarClick
  end
  object btn_cancelar: TButton
    Left = 111
    Top = 157
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
    Left = 192
    Top = 157
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Sair'
    TabOrder = 6
    OnClick = btn_sairClick
  end
  object edt_upload: TEdit
    Left = 8
    Top = 115
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object edt_download: TEdit
    Left = 135
    Top = 115
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
end
