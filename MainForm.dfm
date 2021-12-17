object frmMain: TfrmMain
  Left = 190
  Top = 111
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Demonstration of MikroTik RouterOS API Delphi Client'
  ClientHeight = 657
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    481
    657)
  PixelsPerInch = 96
  TextHeight = 13
  object mem: TMemo
    Left = 8
    Top = 248
    Width = 465
    Height = 385
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 465
    Height = 81
    TabOrder = 0
    object Label1: TLabel
      Left = 248
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Router IP:'
    end
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Username:'
    end
    object Label3: TLabel
      Left = 24
      Top = 48
      Width = 49
      Height = 13
      Caption = 'Password:'
    end
    object cmdConnect: TButton
      Left = 336
      Top = 42
      Width = 89
      Height = 25
      Caption = 'Connect'
      TabOrder = 3
      OnClick = cmdConnectClick
    end
    object txtRouterIP: TEdit
      Left = 304
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object txtUsername: TEdit
      Left = 80
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'admin'
    end
    object txtPassword: TEdit
      Left = 80
      Top = 44
      Width = 121
      Height = 21
      PasswordChar = #7
      TabOrder = 2
    end
    object chkTLS: TCheckBox
      Left = 248
      Top = 48
      Width = 41
      Height = 17
      Caption = 'TLS'
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 97
    Width = 465
    Height = 145
    TabOrder = 1
    object memCmd: TMemo
      Left = 8
      Top = 16
      Width = 241
      Height = 89
      Lines.Strings = (
        '/ip/address/print'
        '=.proplist=.id,address,interface'
        '?disabled=false')
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object GroupBox3: TGroupBox
      Left = 256
      Top = 56
      Width = 201
      Height = 49
      TabOrder = 1
      object cmdQueryAndListen: TBitBtn
        Left = 8
        Top = 16
        Width = 97
        Height = 25
        Caption = 'Query && Listen'
        Enabled = False
        TabOrder = 0
        OnClick = cmdQueryAndListenClick
      end
      object cmdCancel: TBitBtn
        Left = 128
        Top = 16
        Width = 65
        Height = 25
        Caption = 'Cancel'
        Enabled = False
        TabOrder = 1
        OnClick = cmdCancelClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 376
      Top = 8
      Width = 81
      Height = 49
      TabOrder = 2
      object cmdExec: TBitBtn
        Left = 8
        Top = 16
        Width = 65
        Height = 25
        Caption = 'Exec'
        Enabled = False
        TabOrder = 0
        OnClick = cmdExecClick
      end
    end
    object GroupBox5: TGroupBox
      Left = 256
      Top = 8
      Width = 113
      Height = 49
      TabOrder = 3
      object cmdQueryAndGetAll: TBitBtn
        Left = 8
        Top = 16
        Width = 97
        Height = 25
        Caption = 'Query && GetAll'
        Enabled = False
        TabOrder = 0
        OnClick = cmdQueryAndGetAllClick
      end
    end
    object cmdClear: TBitBtn
      Left = 264
      Top = 112
      Width = 185
      Height = 25
      Caption = 'Clear output window'
      TabOrder = 4
      OnClick = cmdClearClick
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 640
    Width = 481
    Height = 17
    Panels = <
      item
        Text = 
          'Copyright '#169' 2009, 2013, 2018 by Pavel Skuratovich (aka Chupaka),' +
          ' Minsk, Belarus'
        Width = 50
      end>
  end
  object XPManifest: TXPManifest
    Left = 464
    Top = 80
  end
  object tmrListen: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrListenTimer
    Left = 208
    Top = 152
  end
end
