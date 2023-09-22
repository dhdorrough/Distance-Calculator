unit DistanceCalcForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, LocationUtils;

type
  TfrmDistanceCalculator = class(TForm)
    lePoint1: TLabeledEdit;
    lePoint2: TLabeledEdit;
    leDistance: TLabeledEdit;
    cbUnits: TComboBox;
    Label1: TLabel;
    btnCalc: TButton;
    lblUnits: TLabel;
    procedure btnCalcClick(Sender: TObject);
    procedure cbUnitsChange(Sender: TObject);
  private
    { Private declarations }
    fUnits: TMeasurementUnits;
  public
    { Public declarations }
    Constructor Create(aOwner: TComponent); override;
  end;

var
  frmDistanceCalculator: TfrmDistanceCalculator;

implementation

uses MyUtils, Math;

{$R *.dfm}

procedure TfrmDistanceCalculator.btnCalcClick(Sender: TObject);
var
  Point1, Point2: TLocation;
  OK: boolean;
  TheDistance: double;
begin
  OK := ParseLatitudeLongitude(lePoint1.Text, Point1.Lat, Point1.Lon);
  if not OK then
    begin
      AlertFmt('Point1: Invalid Lat Lon: %s', [lePoint1.Text]);
      Exit;
    end;

  OK := ParseLatitudeLongitude(lePoint2.Text, Point2.Lat, Point2.Lon);
  if not OK then
    begin
      AlertFmt('Point2: Invalid Lat Lon: %s', [lePoint1.Text]);
      Exit;
    end;

  TheDistance := RoundTo(Distance(Point1.Lat, Point1.Lon, Point2.Lat, Point2.Lon, fUnits), -2);
  leDistance.Text := FloatToStr(TheDistance);
end;

procedure TfrmDistanceCalculator.cbUnitsChange(Sender: TObject);
begin
  with cbUnits do
    begin
      if ItemIndex >= 0 then
        fUnits := TMeasurementUnits(ItemIndex)
      else
        begin
          AlertFmt('Invalid units index: %d', [ItemIndex]);
          Exit;
        end;
    end;

  lblUnits.Caption := MeasurementUnitsArray[fUnits];
end;

constructor TfrmDistanceCalculator.Create(aOwner: TComponent);
var
  mu: TMeasurementUnits;
begin
  inherited;
  with cbUnits do
    begin
      Clear;
      for mu := Low(TMeasurementUnits) to High(TMeasurementUnits) do
        cbUnits.Items.AddObject(MeasurementUnitsArray[mu], TObject(mu));
      fUnits := muMiles;
      cbUnits.ItemIndex := Items.IndexOfObject(TObject(fUnits));
      lblUnits.Caption := MeasurementUnitsArray[fUnits];
    end;
end;

end.
