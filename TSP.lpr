program TSP;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols, TSPmain, msgshow, U_points, msgshow2, U_edges,
  showPathTree, DP, Branch, TFire, aco, ant, PSO, U_LKH_ini, GA, TSP_EA,
  TSP_EA_I;

  {$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(Tfrmpoints, frmpoints);
  Application.CreateForm(TshowMSG, showMSG);
  Application.CreateForm(TshowMSG2, showMSG2);
  Application.CreateForm(Tfrmedges, frmedges);
  Application.CreateForm(TshowPathTree, PathTreeshow);
  Application.CreateForm(TfrmLKH_ini, frmLKH_ini);
  Application.Run;
end.
