object Form5: TForm5
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1055#1086#1096#1072#1075#1086#1074#1099#1081' '#1087#1077#1088#1077#1074#1086#1076
  ClientHeight = 301
  ClientWidth = 531
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = -4
    Top = 0
    Width = 549
    Height = 325
    TabOrder = 0
    ControlData = {
      4C000000BE380000972100000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object MainMenu1: TMainMenu
    Left = 256
    Top = 160
    object N1: TMenuItem
      Caption = #1053#1072' '#1075#1083#1072#1074#1085#1091#1102
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ShortCut = 16465
      OnClick = N2Click
    end
  end
end
