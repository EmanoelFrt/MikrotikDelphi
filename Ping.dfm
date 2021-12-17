object fPing: TfPing
  Left = 0
  Top = 0
  Caption = 'Ping'
  ClientHeight = 432
  ClientWidth = 682
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    682
    432)
  PixelsPerInch = 110
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 22
    Height = 13
    Caption = '&Host'
    FocusControl = tHostName
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lTrack: TListBox
    Left = 8
    Top = 47
    Width = 666
    Height = 385
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 0
    OnMouseDown = lTrackMouseDown
  end
  object PingButton: TButton
    Left = 180
    Top = 8
    Width = 104
    Height = 33
    Caption = 'Ping'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = PingButtonClick
  end
  object tHostName: TEdit
    Left = 38
    Top = 8
    Width = 136
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'localhost'
    OnKeyPress = tHostNameKeyPress
  end
  object ClearButton: TButton
    Left = 290
    Top = 8
    Width = 104
    Height = 33
    Caption = 'Limpar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = ClearButtonClick
  end
  object ipwPing1: TipwPing
    Left = 440
    Top = 16
  end
end
