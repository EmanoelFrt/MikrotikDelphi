object frmTerminal: TfrmTerminal
  Left = 0
  Top = 0
  Caption = 'Console'
  ClientHeight = 638
  ClientWidth = 719
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    719
    638)
  PixelsPerInch = 96
  TextHeight = 13
  object mem: TMemo
    Left = 8
    Top = 159
    Width = 703
    Height = 482
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 703
    Height = 145
    TabOrder = 1
    object memCmd: TMemo
      Left = 8
      Top = 16
      Width = 475
      Height = 126
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object btn_exec: TBitBtn
      Left = 592
      Top = 14
      Width = 97
      Height = 25
      Caption = 'Executar'
      TabOrder = 1
      OnClick = btn_execClick
    end
    object btn_consult: TBitBtn
      Left = 489
      Top = 14
      Width = 97
      Height = 25
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = btn_consultClick
    end
    object btn_cancel: TBitBtn
      Left = 592
      Top = 45
      Width = 97
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
    end
    object btn_limpar: TBitBtn
      Left = 504
      Top = 117
      Width = 185
      Height = 25
      Caption = 'Limpar janela de retorno'
      TabOrder = 4
      OnClick = btn_limparClick
    end
  end
end
