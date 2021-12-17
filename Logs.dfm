object frmLogs: TfrmLogs
  Left = 0
  Top = 0
  Caption = 'Logs'
  ClientHeight = 435
  ClientWidth = 799
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mm_logs: TMemo
    Left = 8
    Top = 64
    Width = 783
    Height = 363
    TabOrder = 0
  end
  object btn_consultar: TButton
    Left = 648
    Top = 8
    Width = 143
    Height = 50
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = btn_consultarClick
  end
end
