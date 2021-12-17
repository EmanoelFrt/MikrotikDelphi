object fControleRedes: TfControleRedes
  Left = 0
  Top = 0
  Caption = 'Controle de Rede'
  ClientHeight = 586
  ClientWidth = 1094
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 110
  TextHeight = 14
  object Label2: TLabel
    Left = 8
    Top = 255
    Width = 97
    Height = 14
    Caption = 'Pacote de Dados:'
  end
  object Label3: TLabel
    Left = 8
    Top = 394
    Width = 75
    Height = 14
    Caption = 'Informa'#231#245'es :'
  end
  object bStart: TButton
    Left = 968
    Top = 8
    Width = 119
    Height = 42
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = bStartClick
  end
  object txtPacketData: TMemo
    Left = 8
    Top = 275
    Width = 1079
    Height = 113
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 1
    WantTabs = True
  end
  object txtPayload: TMemo
    Left = 8
    Top = 414
    Width = 1079
    Height = 164
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object lvwPackets: TListView
    Left = 8
    Top = 56
    Width = 1079
    Height = 193
    Columns = <
      item
        AutoSize = True
        Caption = 'Identifica'#231#227'o'
      end
      item
        AutoSize = True
        Caption = 'Protocolo'
      end
      item
        AutoSize = True
        Caption = 'Endere'#231'o'
      end
      item
        AutoSize = True
        Caption = 'Porta'
      end
      item
        AutoSize = True
        Caption = 'Endere'#231'o Destino'
      end
      item
        AutoSize = True
        Caption = 'Porta Destino'
      end
      item
        AutoSize = True
        Caption = 'Vers'#227'o IP'
      end>
    RowSelect = True
    TabOrder = 3
    ViewStyle = vsReport
    OnClick = lvwPacketsClick
  end
  object IPMonitor1: TipwIPMonitor
    OnIPPacket = IPMonitor1IPPacket
    Left = 784
    Top = 8
  end
end
