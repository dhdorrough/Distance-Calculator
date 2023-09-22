object frmDistanceCalculator: TfrmDistanceCalculator
  Left = 837
  Top = 380
  Width = 522
  Height = 393
  Caption = 'Distance Calculation'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 120
    Width = 24
    Height = 13
    Caption = 'Units'
  end
  object lblUnits: TLabel
    Left = 120
    Top = 188
    Width = 34
    Height = 13
    Caption = 'lblUnits'
  end
  object lePoint1: TLabeledEdit
    Left = 16
    Top = 40
    Width = 313
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Point 1'
    TabOrder = 0
  end
  object lePoint2: TLabeledEdit
    Left = 16
    Top = 80
    Width = 313
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Point 2'
    TabOrder = 1
  end
  object leDistance: TLabeledEdit
    Left = 16
    Top = 184
    Width = 89
    Height = 21
    EditLabel.Width = 42
    EditLabel.Height = 13
    EditLabel.Caption = 'Distance'
    ReadOnly = True
    TabOrder = 2
  end
  object cbUnits: TComboBox
    Left = 16
    Top = 136
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    OnChange = cbUnitsChange
    Items.Strings = (
      'Inches'
      'Feet'
      'Yards'
      'Miles'
      'Millimeters'
      'Centimeters'
      'Meters'
      'Kilometers')
  end
  object btnCalc: TButton
    Left = 408
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Calc'
    TabOrder = 4
    OnClick = btnCalcClick
  end
end
