object frmRede: TfrmRede
  Left = 0
  Top = 0
  Caption = 'Perfil'
  ClientHeight = 385
  ClientWidth = 617
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
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 31
    Height = 13
    Caption = 'Perfil :'
  end
  object dbg_rede: TDBGrid
    Left = 8
    Top = 35
    Width = 600
    Height = 310
    DataSource = src_rede
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
        FieldName = 'RDE_ID'
        Title.Caption = 'C'#242'digo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RDE_NOME'
        Title.Caption = 'Perfil'
        Width = 308
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RDE_LIMITE'
        Title.Caption = 'Limite Upload/Download'
        Width = 153
        Visible = True
      end>
  end
  object edt_ip: TEdit
    Left = 46
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btn_pesquisar: TButton
    Left = 533
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = btn_pesquisarClick
  end
  object btn_adicionar: TButton
    Left = 284
    Top = 351
    Width = 104
    Height = 25
    Caption = 'Adicionar Perfil'
    TabOrder = 3
    OnClick = btn_adicionarClick
  end
  object btn_editar: TButton
    Left = 394
    Top = 351
    Width = 104
    Height = 25
    Caption = 'Editar Perfil'
    TabOrder = 4
    OnClick = btn_editarClick
  end
  object btn_remover: TButton
    Left = 505
    Top = 351
    Width = 104
    Height = 25
    Caption = 'Remover Perfil'
    TabOrder = 5
    OnClick = btn_removerClick
  end
  object cds_rede: TClientDataSet
    PersistDataPacket.Data = {
      710000009619E0BD010000001800000003000000000003000000710006524445
      5F4944010049000000010005574944544802000200C800085244455F4E4F4D45
      010049000000010005574944544802000200C8000A5244455F4C494D49544501
      0049000000010005574944544802000200C8000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'RDE_ID'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'RDE_NOME'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'RDE_LIMITE'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 400
    Top = 192
    object cds_redeRDE_ID: TStringField
      FieldName = 'RDE_ID'
      Size = 200
    end
    object cds_redeRDE_NOME: TStringField
      FieldName = 'RDE_NOME'
      Size = 200
    end
    object cds_redeRDE_LIMITE: TStringField
      FieldName = 'RDE_LIMITE'
      Size = 200
    end
  end
  object src_rede: TDataSource
    DataSet = cds_rede
    OnDataChange = src_redeDataChange
    Left = 472
    Top = 184
  end
end
