object Form1: TForm1
  Left = 291
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = #1048#1075#1088#1072' '#1074' '#1095#1080#1089#1083#1072
  ClientHeight = 466
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 497
    Height = 137
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 152
      Top = 12
      Width = 194
      Height = 24
      Caption = #1055#1072#1085#1077#1083#1100' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 64
      Width = 88
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1094#1080#1092#1088
    end
    object K: TComboBox
      Left = 120
      Top = 60
      Width = 145
      Height = 21
      ItemHeight = 13
      MaxLength = 1
      TabOrder = 0
      Text = '3'
      OnChange = KChange
      Items.Strings = (
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9')
    end
    object Default: TCheckBox
      Left = 272
      Top = 62
      Width = 97
      Height = 17
      Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      TabOrder = 1
      OnClick = DefaultClick
    end
    object Go: TButton
      Left = 376
      Top = 58
      Width = 75
      Height = 25
      Caption = #1055#1091#1089#1082
      Default = True
      TabOrder = 2
      OnClick = GoClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 137
    Width = 497
    Height = 329
    Align = alClient
    Enabled = False
    TabOrder = 1
    object Label2: TLabel
      Left = 169
      Top = 20
      Width = 159
      Height = 24
      Caption = #1048#1075#1088#1086#1074#1072#1103' '#1087#1072#1085#1077#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 296
      Top = 77
      Width = 67
      Height = 16
      Caption = #1042#1072#1096' '#1086#1090#1074#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object YourPurpose: TLabeledEdit
      Left = 48
      Top = 96
      Width = 145
      Height = 24
      EditLabel.Width = 142
      EditLabel.Height = 16
      EditLabel.Caption = #1042#1072#1096#1077' '#1087#1088#1077#1076#1087#1086#1083#1086#1078#1077#1085#1080#1077
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = YourPurposeKeyPress
    end
    object Edit1: TEdit
      Left = 288
      Top = 96
      Width = 33
      Height = 21
      MaxLength = 1
      TabOrder = 1
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 336
      Top = 96
      Width = 33
      Height = 21
      MaxLength = 1
      TabOrder = 2
      OnKeyPress = Edit2KeyPress
    end
    object Protokol: TMemo
      Left = 48
      Top = 160
      Width = 325
      Height = 89
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 3
    end
    object Quit: TButton
      Left = 400
      Top = 224
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 4
      OnClick = QuitClick
    end
  end
end
