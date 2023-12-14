object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = #1047#1072#1089#1090#1072#1074#1082#1072
  ClientHeight = 281
  ClientWidth = 488
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object MediaPlayer1: TMediaPlayer
    Left = 128
    Top = 128
    Width = 253
    Height = 30
    AutoOpen = True
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 448
    Top = 248
  end
end
