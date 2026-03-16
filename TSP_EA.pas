unit TSP_EA;

interface

uses
  TSP_EA_I, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,TSPmain;

type
 
  TIndividual = class(TInterfacedObject, IIndividual)
  private
    // The internally stored fitness value
    fFitness: Double;
    procedure SetFitness(const Value: Double);
    function GetFitness: Double;
  public
    property Fitness: Double read GetFitness write SetFitness;
  end;

  TTSPIndividual = class(TIndividual, ITSPIndividual)
  private
    // The route we travel
    fRouteArray: array of integer;
    function GetRouteArray(I: Integer): Integer;
    procedure SetRouteArray(I: Integer; const Value: Integer);
    procedure SetSteps(const Value: Integer);
    function GetSteps: Integer;
  public
    // Constructor, called with initial route size
    constructor Create(Size: integer); reintroduce;
    destructor Destroy; override;
    property RouteArray[I: Integer]: Integer read GetRouteArray
      write SetRouteArray;
    // The number of steps on the route
    property Steps: Integer read GetSteps write SetSteps;
    property Fitness: Double read GetFitness write SetFitness;
  end;

  TTSPCreator = class(TInterfacedObject, ITSPCreator)
  private
    // The Control component we are associated with
    fController: ITSPController;
    function GetController: ITSPController;
    procedure SetController(const Value: ITSPController);
  public
    // Function to create a random individual
    function CreateIndividual: IIndividual;
    property Controller: ITSPController read GetController write SetController;
  end;

  TKillerPercentage = class(TInterfacedObject, IKillerPercentage)
  private
    fPer: Double;
    procedure SetPercentage(const Value: Double);
    function GetPercentage: Double;
  public
    function Kill(Pop: IPopulation): Integer;
    // Percentage of population to be killed
    property Percentage: Double read GetPercentage write SetPercentage;
  end;

  TParentSelectorTournament = class(TInterfacedObject, IParentSelector)
  public
    function SelectParent(Population: IPopulation): IIndividual;
  end;

  TTSPBreederCrossover = class(TInterfacedObject, IBreeder)
  public
    function BreedOffspring(PSelector: IParentSelector; Pop: IPopulation)
      : IIndividual;
  end;

  TTSPMutator = class(TInterfacedObject, ITSPMutator)
  private
    fTrans: Double;
    fInv: Double;
    procedure SetInv(const Value: Double);
    procedure SetTrans(const Value: Double);
    function GetInv: Double;
    function GetTrans: Double;
  public
    procedure Mutate(Individual: IIndividual);
  published
    // Probability of doing a transposition
    property Transposition: Double read GetTrans write SetTrans;
    // Probability of doing an inversion
    property Inversion: Double read GetInv write SetInv;
  end;

  TTSPExaminer = class(TInterfacedObject, ITSPExaminer)
  private
    // The Control component we are associated with
    fController: ITSPController;
    function GetController: ITSPController;
    procedure SetController(const Value: ITSPController);
  public
    // Returns the fitness of an individual as a real number where 0 => best
    function GetFitness(Individual: IIndividual): Double;
    property Controller: ITSPController read GetController write SetController;
  end;

  TPopulation = class(TInterfacedObject, IPopulation)
  private
    // The population
    fPop: TInterfaceList;
    // Worker for breeding
    fBreeder: IBreeder;
    // Worker for killing
    fKiller: IKiller;
    // Worker for parent selection
    fParentSelector: IParentSelector;
    // Worker for mutation
    fMutator: IMutator;
    // Worker for initial creation
    fCreator: ICreator;
    // Worker for fitness calculation
    fExaminer: IExaminer;
    // On Change event
    FOnChange: TNotifyEvent;
    procedure Change;
    // Getters and Setters
    function GetIndividual(I: Integer): IIndividual;
    function GetCount: Integer;
    function GetBreeder: IBreeder;
    function GetCreator: ICreator;
    function GetExaminer: IExaminer;
    function GetKiller: IKiller;
    function GetMutator: IMutator;
    function GetOnChange: TNotifyEvent;
    function GetParentSelector: IParentSelector;
    procedure SetBreeder(const Value: IBreeder);
    procedure SetCreator(const Value: ICreator);
    procedure SetExaminer(const Value: IExaminer);
    procedure SetKiller(const Value: IKiller);
    procedure SetMutator(const Value: IMutator);
    procedure SetOnChange(const Value: TNotifyEvent);
    procedure SetParentSelector(const Value: IParentSelector);
    // not interfaced
    procedure DanQuickSort(SortList: TInterfaceList; L, R: Integer;
      SCompare: TInterfaceCompare);
    procedure Sort(Compare: TInterfaceCompare);
  protected
    // Comparison function for Sort()
    function CompareIndividuals(I1, I2: IIndividual): Integer;
    // Sort the population
    procedure SortPopulation;
  public
    // The constructor
    constructor Create;
    // The destructor
    destructor Destroy; override;
    // Adds an individual to the population
    procedure Add(New: IIndividual);
    // Deletes an individual from the population
    procedure Delete(I: Integer);
    // Runs a single generation
    procedure Generation;
    // Initialise the population
    procedure Initialise(Size: Integer);
    // Clear ourselves out
    procedure Clear;
    // Get the fitness of an individual
    function FitnessOf(I: Integer): Double;
    // Access to the population members
    property Pop[I: Integer]: IIndividual read GetIndividual; default;
    // The size of the population
    property Count: Integer read GetCount;
    property ParentSelector: IParentSelector read GetParentSelector
      write SetParentSelector;
    property Breeder: IBreeder read GetBreeder write SetBreeder;
    property Killer: IKiller read GetKiller write SetKiller;
    property Mutator: IMutator read GetMutator write SetMutator;
    property Creator: ICreator read GetCreator write SetCreator;
    property Examiner: IExaminer read GetExaminer write SetExaminer;
    // An event
    property OnChange: TNotifyEvent read GetOnChange write SetOnChange;
  end;

  TTSPController = class(TInterfacedObject, ITSPController)
  private
    fXmin, fXmax, fYmin, fYmax: Double;
    { The array of 'cities' }
    fCities: array of TPoint3D;
    fDistance: TDARRAY333;
    fcurDistance: TDARRAY333;
    fEdgeWeight: TDARRAY333;
    { The number of 'cities' }
    fCityCount: Integer;
    { Getters... }
    function GetXmax: Double;
    function GetXmin: Double;
    function GetYmax: Double;
    function GetYmin: Double;
    function GetDistance: TDARRAY333;
    function GetcurDistance: TDARRAY333;
    function GetEdgeWeight: TDARRAY333;
    procedure SetXmax(const Value: Double);
    procedure SetXmin(const Value: Double);
    procedure SetYmax(const Value: Double);
    procedure SetYmin(const Value: Double);
    procedure SetDistance(const Value: TDARRAY333);
    procedure SetcurDistance(const Value: TDARRAY333);
    procedure SetEdgeWeight(const Value: TDARRAY333);
    function GetCity(I: Integer): TPoint3D;
    procedure SetCityCount(const Value: Integer);
    procedure SetCity(I: Integer; const Value: TPoint3D);
    function GetCityCount: Integer;
    { Get the distance between two cities }
    function DistanceBetween(C1, C2: Integer): Double;
    { Places the cities at random points }
    procedure RandomCities;
    { Area limits }
    property Xmin: Double read GetXmin write SetXmin;
    property Xmax: Double read GetXmax write SetXmax;
    property Ymin: Double read GetYmin write SetYmin;
    property Ymax: Double read GetYmax write SetYmax;
    { Access to the cities array }
    property Cities[I: Integer]: TPoint3D read GetCity write SetCity;
    property Distance: TDARRAY333 read GetDistance write SetDistance; // 距离矩阵
    property curDistance: TDARRAY333 read GetcurDistance write SetcurDistance;
    // 距离矩阵
    property EdgeWeight: TDARRAY333 read GetEdgeWeight write SetEdgeWeight;
    // 距离矩阵

    { Properties... }
    property CityCount: Integer read GetCityCount write SetCityCount;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  Math;

{ TIndividual }

function TIndividual.GetFitness: Double;
begin
  result := fFitness;
end;

procedure TIndividual.SetFitness(const Value: Double);
begin
  fFitness := Value;
end;

{ TTSPIndividual }

constructor TTSPIndividual.Create(Size: integer);
begin
  Inherited Create;
  SetLength(fRouteArray, Size);
  // fSteps := Size;
end;

destructor TTSPIndividual.Destroy;
begin
  SetLength(fRouteArray, 0);
  inherited;
end;

function TTSPIndividual.GetRouteArray(I: Integer): Integer;
begin
  result := fRouteArray[I];
end;

function TTSPIndividual.GetSteps: Integer;
begin
  result := Length(fRouteArray);
end;

procedure TTSPIndividual.SetSteps(const Value: Integer);
begin
  SetLength(fRouteArray, Value);
end;

procedure TTSPIndividual.SetRouteArray(I: Integer; const Value: Integer);
begin
  fRouteArray[I] := Value;
end;

{ TTSPCreator }

function TTSPCreator.CreateIndividual: IIndividual;
var
  New: ITSPIndividual;
  I, j, Top, Temp: Integer;
begin
  // Get the number of cities
  Top := fController.CityCount;
  // Create the new individual
  New := TTSPIndividual.Create(Top);
  // Initialise it with a sequential route
  for I := 0 to Top - 1 do
    New.RouteArray[I] := I;
  // Shuffle the route
  for I := Top - 1 downto 1 do
  begin
    j := Random(I);
    Temp := New.RouteArray[j];
    New.RouteArray[j] := New.RouteArray[I];
    New.RouteArray[I] := Temp;
  end;
  result := New;
end;

function TTSPCreator.GetController: ITSPController;
begin
  result := fController;
end;

procedure TTSPCreator.SetController(const Value: ITSPController);
begin
  fController := Value;
end;

{ TKillerPercentage }

function TKillerPercentage.GetPercentage: Double;
begin
  result := fPer;
end;

function TKillerPercentage.Kill(Pop: IPopulation): Integer;
var
  KillCount, I: Integer;
begin
  // Work out the number we have to kill
  KillCount := Floor(Pop.Count * (fPer / 100));
  // Delete the worst individuals - assuming the population is sorted
  for I := 1 to KillCount do
    Pop.Delete(Pop.Count - 1);
  // Return the number killed
  result := KillCount;
end;

procedure TKillerPercentage.SetPercentage(const Value: Double);
begin
  fPer := Value;
end;

{ TParentSelectorTournament }

function TParentSelectorTournament.SelectParent(Population: IPopulation)
  : IIndividual;
var
  I1, I2: Integer;
begin
  // Select a random individual
  I1 := Random(Population.Count);
  // Select a *different* random individual
  repeat
    I2 := Random(Population.Count);
  until I1 <> I2;
  // Hold the tournament and return the fittest of the two
  if Population.FitnessOf(I1) < Population.FitnessOf(I2) then
    result := Population[I1]
  else
    result := Population[I2];
end;

{ TTSPBreederCrossover }

function TTSPBreederCrossover.BreedOffspring(PSelector: IParentSelector;
  Pop: IPopulation): IIndividual;
var
  Child, Mom, Dad, Parent1, Parent2: ITSPIndividual;
  I, j, p: Integer;

  function AlreadyAssigned(City, x: Integer): Boolean;
  var
    y: Integer;
    Found: Boolean;
  begin
    Found := False;
    for y := 0 to x - 1 do
    begin
      if Child.RouteArray[y] = City then
      begin
        Found := True;
        Break;
      end;
    end;
    result := Found;
  end;

begin
  // Select a some parents...
  Mom := PSelector.SelectParent(Pop) as ITSPIndividual;
  Dad := PSelector.SelectParent(Pop) as ITSPIndividual;
  // Create a child
  Child := TTSPIndividual.Create(Mom.Steps);
  // Copy the route from parents to child
  for I := 0 to Child.Steps - 1 do
  begin
    // Choose a parent at random
    p := Random(2);
    if p = 0 then
    begin
      Parent1 := Mom;
      Parent2 := Dad;
    end
    else
    begin
      Parent1 := Dad;
      Parent2 := Mom;
    end;
    if not AlreadyAssigned(Parent1.RouteArray[I], I) then
    begin
      // Use city from Parent 1 unless used already
      Child.RouteArray[I] := Parent1.RouteArray[I];
    end
    else if not AlreadyAssigned(Parent2.RouteArray[I], I) then
    begin
      // Otherwise use city from Parent 2 unless used already
      Child.RouteArray[I] := Parent2.RouteArray[I];
    end
    else
    begin
      // If both assigned already then use a random city
      repeat
        j := Random(Child.Steps);
      until not AlreadyAssigned(j, I);
      Child.RouteArray[I] := j;
    end;
  end;
  // Return the child
  result := Child;
end;

{ TTSPMutator }

function TTSPMutator.GetInv: Double;
begin
  result := fInv;
end;

function TTSPMutator.GetTrans: Double;
begin
  result := fTrans;
end;

procedure TTSPMutator.Mutate(Individual: IIndividual);
var
  p: Double;
  I, j, t: Integer;
  Start, Finish: Integer;
begin
  with Individual as ITSPIndividual do
  begin
    // Should we do an inversion?
    p := Random * 100;
    if p < fTrans then
    begin
      // Do an inversion (i.e. swap two cities at random)
      // Choose first city
      I := Random(Steps);
      // Choose a second city
      repeat
        j := Random(Steps);
      until I <> j;
      // Swap them over
      t := RouteArray[I];
      RouteArray[I] := RouteArray[j];
      RouteArray[j] := t;
    end;
    // Should we do a transposition?
    p := Random * 100;
    if p < fInv then
    begin
      // Do a transposition (i.e. reverse a sub-route)
      // Choose random start and finish points
      Start := Random(Steps - 1);
      Finish := Start + Random(Steps - Start);
      // Reverse the sub-route
      for I := 0 to Floor((Finish - Start) / 2) do
      begin
        t := RouteArray[Start + I];
        RouteArray[Start + I] := RouteArray[Finish - I];
        RouteArray[Finish - I] := t;
      end;
    end;
  end;
end;

procedure TTSPMutator.SetInv(const Value: Double);
begin
  fInv := Value;
end;

procedure TTSPMutator.SetTrans(const Value: Double);
begin
  fTrans := Value;
end;

{ TTSPExaminer }

function TTSPExaminer.GetController: ITSPController;
begin
  result := fController;
end;

function TTSPExaminer.GetFitness(Individual: IIndividual): Double;
var
  I: Integer;
  Distance: Double;
  Indi: ITSPIndividual;
begin
  Indi := Individual as ITSPIndividual;
  Distance := 0;
  for I := 0 to Indi.Steps - 2 do
  begin
    Distance := Distance + fController.DistanceBetween(Indi.RouteArray[I],
      Indi.RouteArray[I + 1]);
    //Distance := Distance + TSPmain.Main.WeightsPoint[i];
  end;
  Distance := Distance + fController.DistanceBetween
    (Indi.RouteArray[Indi.Steps - 1], Indi.RouteArray[0]);
 // Distance := Distance + TSPmain.Main.WeightsPoint[0];
  result := Distance;
end;

procedure TTSPExaminer.SetController(const Value: ITSPController);
begin
  fController := Value;
end;

{ TPopulation }

constructor TPopulation.Create;
begin
  inherited;
  fPop := TInterfaceList.Create;
end;

destructor TPopulation.Destroy;
begin
  fPop.Free;
  inherited;
end;

procedure TPopulation.Add(New: IIndividual);
begin
  fPop.Add(New);
end;

procedure TPopulation.Clear;
begin
  fPop.Clear;
end;

function TPopulation.CompareIndividuals(I1, I2: IIndividual): Integer;
var
  A, B, D: Double;
begin
  // Get the difference between the two individuals (real number)
  A := I1.Fitness;
  B := I2.Fitness;

  D := A - B;

  // Quickest way to convert that to an integer is...
  if D > 0 then
    result := 1
  else if D < 0 then
    result := -1
  else
    result := 0;
end;

procedure TPopulation.Delete(I: Integer);
begin
  fPop.Delete(I);
end;

function TPopulation.FitnessOf(I: Integer): Double;
begin
  result := Pop[I].Fitness;
end;

procedure TPopulation.Change;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TPopulation.Generation;
var
  Replace, I: Integer;
  New: IIndividual;
begin
  // Kill some of the population
  Replace := fKiller.Kill(Self);

  for I := 1 to Replace do
  begin
    // Breed a new individual
    New := fBreeder.BreedOffspring(fParentSelector, Self);
    // Perform some mutation on the individual
    fMutator.Mutate(New);
    // Get the fitness of the new individual
    New.Fitness := fExaminer.GetFitness(New);
    // Add it to the population
    Add(New);
  end;
  // Sort the population into fitness order where first <==> best
  SortPopulation;

  Change;
end;

function TPopulation.GetBreeder: IBreeder;
begin
  result := fBreeder;
end;

function TPopulation.GetCount: Integer;
begin
  result := fPop.Count;
end;

function TPopulation.GetCreator: ICreator;
begin
  result := fCreator;
end;

function TPopulation.GetExaminer: IExaminer;
begin
  result := fExaminer;
end;

function TPopulation.GetIndividual(I: Integer): IIndividual;
begin
  result := (fPop[I] as IIndividual);
end;

function TPopulation.GetKiller: IKiller;
begin
  result := fKiller;
end;

function TPopulation.GetMutator: IMutator;
begin
  result := fMutator;
end;

function TPopulation.GetOnChange: TNotifyEvent;
begin
  result := FOnChange;
end;

function TPopulation.GetParentSelector: IParentSelector;
begin
  result := fParentSelector;
end;

procedure TPopulation.Initialise(Size: Integer);
var
  I: Integer;
  New: IIndividual;
begin
  // Clear out the old stuff
  Clear;
  // Set the capacity first to save about 12 nanoseconds ;o)
  fPop.Capacity := Size;
  // Create the appropriate number of individuals
  for I := 1 to Size do
  begin
    // Create the individual
    New := fCreator.CreateIndividual;
    // Get the fitness of the new individual
    New.Fitness := fExaminer.GetFitness(New);
    // Add to the population
    Add(New);
  end;
  SortPopulation;
  Change;
end;

procedure TPopulation.SetBreeder(const Value: IBreeder);
begin
  fBreeder := Value;
end;

procedure TPopulation.SetCreator(const Value: ICreator);
begin
  fCreator := Value;
end;

procedure TPopulation.SetExaminer(const Value: IExaminer);
begin
  fExaminer := Value;
end;

procedure TPopulation.SetKiller(const Value: IKiller);
begin
  fKiller := Value;
end;

procedure TPopulation.SetMutator(const Value: IMutator);
begin
  fMutator := Value;
end;

procedure TPopulation.SetOnChange(const Value: TNotifyEvent);
begin
  FOnChange := Value;
end;

procedure TPopulation.SetParentSelector(const Value: IParentSelector);
begin
  fParentSelector := Value;
end;

procedure TPopulation.DanQuickSort(SortList: TInterfaceList; L, R: Integer;
  SCompare: TInterfaceCompare);
var
  I, j: Integer;
  p: IIndividual;
begin
  repeat
    I := L;
    j := R;
    p := SortList.Items[(L + R) div 2] as IIndividual;
    repeat
      while SCompare(SortList.Items[I] as IIndividual, p) < 0 do
        Inc(I);
      while SCompare(SortList.Items[j] as IIndividual, p) > 0 do
        Dec(j);
      if I <= j then
      begin
        SortList.Exchange(I, j);
        Inc(I);
        Dec(j);
      end;
    until I > j;
    if L < j then
      DanQuickSort(SortList, L, j, SCompare);
    L := I;
  until I >= R;
end;

procedure TPopulation.Sort(Compare: TInterfaceCompare);
begin
  if Assigned(fPop) and (Count > 0) then
    DanQuickSort(fPop, 0, Count - 1, Compare);
end;

procedure TPopulation.SortPopulation;
begin
 Sort(@CompareIndividuals);

end;

{ TTSPController }

constructor TTSPController.Create;
begin
  inherited;
end;

destructor TTSPController.Destroy;
begin
  SetLength(fCities, 0);
  SetLength(fDistance, 0, 0);
  SetLength(fEdgeWeight, 0, 0);
  SetLength(fcurDistance, 0, 0);
  inherited;
end;

{ Standard euclidian distance between two 2D vectors... }
function TTSPController.DistanceBetween(C1, C2: Integer): Double;
begin
  // 这函数仅在同页pas中用到   function TTSPExaminer.GetFitness(Individual: IIndividual): Double;
  // result := Sqrt(sqr(Cities[C1].x - Cities[C2].x) +
  // sqr(Cities[C1].y - Cities[C2].y))*Cities[C1].z*Cities[C2].z*fEdgeWeight[C1][C2];
  if TSPmain.Main.Distance[C1][C2] = -1.0 then
    result := Sqrt(sqr(Cities[C1].x - Cities[C2].x) +
      sqr(Cities[C1].y - Cities[C2].y))
  else
    result := TSPmain.Main.Distance[C1][C2];
end;

function TTSPController.GetCity(I: Integer): TPoint3D;
begin
  try
    result := fCities[I];
  except
    //showmessage('请先在坐标标签页创建或导入坐标点');
    //exit;
  end;
end;

function TTSPController.GetCityCount: Integer;
begin
  result := fCityCount;
end;

function TTSPController.GetcurDistance: TDARRAY333;
begin
  result := fcurDistance;
end;

function TTSPController.GetDistance: TDARRAY333;
begin
  result := fDistance;
end;

function TTSPController.GetEdgeWeight: TDARRAY333;
begin
  result := fEdgeWeight;
end;

function TTSPController.GetXmax: Double;
begin
  result := fXmax;
end;

function TTSPController.GetXmin: Double;
begin
  result := fXmin;
end;

function TTSPController.GetYmax: Double;
begin
  result := fYmax;
end;

function TTSPController.GetYmin: Double;
begin
  result := fYmin;
end;

procedure TTSPController.RandomCities;
var
  I, j: Integer;
begin
  Xmin := 0;
  Ymin := 0;
  Xmax := TSPmain.Main.Width;
  Xmax := TSPmain.Main.ClientRect.Width;
  Xmax := TSPmain.Main.Width;
  Ymax := TSPmain.Main.Height;
  Ymax := TSPmain.Main.Height;
  // Xmax:=Xmax*0.8;
  // Ymax:=Ymax*0.8;

  SetLength(TSPmain.Main.PCodes, fCityCount);


end;

procedure TTSPController.SetCity(I: Integer; const Value: TPoint3D);
begin
  fCities[I] := Value;
end;

procedure TTSPController.SetCityCount(const Value: Integer);
begin
  SetLength(fCities, Value);
  fCityCount := Value;
  SetLength(fDistance, Value, Value);
  SetLength(fcurDistance, Value, Value);
  SetLength(fEdgeWeight, Value, Value);
  RandomCities;
end;

procedure TTSPController.SetcurDistance(const Value: TDARRAY333);
begin
  fcurDistance := Value;
end;

procedure TTSPController.SetDistance(const Value: TDARRAY333);
begin
  fDistance := Value;
end;

procedure TTSPController.SetEdgeWeight(const Value: TDARRAY333);
begin
  fEdgeWeight := Value;
end;

procedure TTSPController.SetXmax(const Value: Double);
begin
  fXmax := Value;
end;

procedure TTSPController.SetXmin(const Value: Double);
begin
  fXmin := Value;
end;

procedure TTSPController.SetYmax(const Value: Double);
begin
  fYmax := Value;
end;

procedure TTSPController.SetYmin(const Value: Double);
begin
  fYmin := Value;
end;

end.
