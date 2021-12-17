object frmUsuariosConectados: TfrmUsuariosConectados
  Left = 0
  Top = 0
  Caption = 'Conex'#245'es'
  ClientHeight = 599
  ClientWidth = 874
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 54
    Width = 858
    Height = 491
    DataSource = src_conexao
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CON_USER'
        Title.Caption = 'Usu'#225'rio'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CON_ENDERECO'
        Title.Caption = 'Endere'#231'o'
        Width = 317
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CON_MAC'
        Title.Caption = 'MAC'
        Width = 301
        Visible = True
      end>
  end
  object btn_encerrar_con: TButton
    Left = 616
    Top = 551
    Width = 122
    Height = 40
    Caption = 'Encerrar Conex'#227'o'
    TabOrder = 1
    OnClick = btn_encerrar_conClick
  end
  object btn_sair: TButton
    Left = 744
    Top = 551
    Width = 122
    Height = 42
    Caption = 'Sair'
    TabOrder = 2
    OnClick = btn_sairClick
  end
  object btn_pesquisar: TButton
    Left = 744
    Top = 7
    Width = 122
    Height = 40
    Caption = 'Pesquisar'
    TabOrder = 3
    OnClick = btn_pesquisarClick
  end
  object cds_conexao: TClientDataSet
    PersistDataPacket.Data = {
      8F0000009619E0BD0100000018000000040000000000030000008F0008434F4E
      5F55534552010049000000010005574944544802000200C8000C434F4E5F454E
      44455245434F010049000000010005574944544802000200C80007434F4E5F4D
      4143010049000000010005574944544802000200C80006434F4E5F4944010049
      000000010005574944544802000200C8000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CON_USER'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'CON_ENDERECO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'CON_MAC'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'CON_ID'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 496
    Top = 552
    object cds_conexaoCON_USER: TStringField
      FieldName = 'CON_USER'
      Size = 200
    end
    object cds_conexaoCON_ENDERECO: TStringField
      FieldName = 'CON_ENDERECO'
      Size = 200
    end
    object cds_conexaoCON_MAC: TStringField
      FieldName = 'CON_MAC'
      Size = 200
    end
    object cds_conexaoCON_ID: TStringField
      FieldName = 'CON_ID'
      Size = 200
    end
  end
  object src_conexao: TDataSource
    DataSet = cds_conexao
    OnDataChange = src_conexaoDataChange
    Left = 440
    Top = 552
  end
end
