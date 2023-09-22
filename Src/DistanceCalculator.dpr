program DistanceCalculator;

uses
  Forms,
  DistanceCalcForm in 'DistanceCalcForm.pas' {frmDistanceCalculator},
  LocationUtils in '..\..\MyUtils\LocationUtils.pas',
  MyUtils in '..\..\MyUtils\MyUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmDistanceCalculator, frmDistanceCalculator);
  Application.Run;
end.
