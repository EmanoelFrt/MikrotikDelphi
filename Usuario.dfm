object frmUsuario: TfrmUsuario
  Left = 0
  Top = 0
  Caption = 'Usu'#225'rio'
  ClientHeight = 380
  ClientWidth = 616
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
    Width = 32
    Height = 13
    Caption = 'Login :'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 35
    Width = 600
    Height = 310
    DataSource = src_usuario
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
        FieldName = 'USR_ID'
        Title.Caption = 'C'#243'digo'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USR_LOGIN'
        Title.Caption = 'Login'
        Width = 278
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USR_SENHA'
        Title.Caption = 'Senha'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USR_PERFIL'
        Title.Caption = 'Perfil'
        Width = 108
        Visible = True
      end>
  end
  object edt_login: TEdit
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
    Caption = 'Adicionar Usu'#225'rio'
    TabOrder = 3
    OnClick = btn_adicionarClick
  end
  object btn_editar: TButton
    Left = 394
    Top = 351
    Width = 104
    Height = 25
    Caption = 'Editar Usu'#225'rio'
    TabOrder = 4
    OnClick = btn_editarClick
  end
  object btn_remover: TButton
    Left = 504
    Top = 351
    Width = 104
    Height = 25
    Caption = 'Remover Usu'#225'rio'
    TabOrder = 5
    OnClick = btn_removerClick
  end
  object cds_usuario: TClientDataSet
    PersistDataPacket.Data = {
      AB0000009619E0BD010000001800000005000000000003000000AB0006555352
      5F4944010049000000010005574944544802000200C800095553525F4C4F4749
      4E010049000000010005574944544802000200C800095553525F53454E484101
      0049000000010005574944544802000200C800065553525F4950010049000000
      010005574944544802000200C8000A5553525F50455246494C01004900000001
      0005574944544802000200C8000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'USR_ID'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'USR_LOGIN'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'USR_SENHA'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'USR_IP'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'USR_PERFIL'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 400
    Top = 192
    object cds_usuarioUSR_ID: TStringField
      FieldName = 'USR_ID'
      Size = 200
    end
    object cds_usuarioUSR_LOGIN: TStringField
      FieldName = 'USR_LOGIN'
      Size = 200
    end
    object cds_usuarioUSR_SENHA: TStringField
      FieldName = 'USR_SENHA'
      Size = 200
    end
    object cds_usuarioUSR_IP: TStringField
      FieldName = 'USR_IP'
      Size = 200
    end
    object cds_usuarioUSR_PERFIL: TStringField
      FieldName = 'USR_PERFIL'
      Size = 200
    end
  end
  object src_usuario: TDataSource
    DataSet = cds_usuario
    OnDataChange = src_usuarioDataChange
    Left = 472
    Top = 184
  end
end
