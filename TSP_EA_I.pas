unit TSP_EA_I; 
 
interface 
 
uses 
   Classes;

type
 
  IPopulation = interface; 

  IIndividual = interface 
  ['{FB31D8CD-0F3B-464D-A352-880D40C5F348}']
    procedure SetFitness(const Value: Double); 
    function GetFitness: Double; 
    property Fitness: Double read GetFitness write SetFitness; 
  end; 
 
  TInterfaceCompare = function (Item1, Item2: IIndividual): Integer of object; 
 
  ICreator = interface 
  ['{B07EE6E3-D603-4701-A164-EA5B1DD51245}']
    // Function is used to create individuals to form the initial population 
    function CreateIndividual: IIndividual; 
  end; 
 
  IKiller = interface 
  ['{E4A1B4B8-10F3-4B1F-B1D6-3744213CBADF}']
    // Function to kill off some unfit population members 
    // should delete them from the list and return the number killed 
    function Kill(Pop: IPopulation) : Integer; 
  end; 
 
  IKillerPercentage = interface(IKiller) 
  ['{0B1DC3C8-FEEF-4EA3-A72B-DDAE96813D28}']
    procedure SetPercentage(const Value: Double);
    function GetPercentage: Double; 
    // function Kill(Pop : IPopulation) : Integer; 
    // Percentage of population to be killed 
    property Percentage : Double read GetPercentage write SetPercentage; 
  end; 
 
  IParentSelector = interface 
  ['{85B1CEDA-5B70-494D-A526-CD369A63540F}']
    // This function returns a reference to a single parent, selected from Pop 
    function SelectParent(Population: IPopulation): IIndividual; 
  end; 
 
  IBreeder = interface
  ['{B2DF4343-E246-4D4B-AED0-B039DFEF9025}']
    // This function should return a new population member based on parents 
    // selected using the ParentSelector object 
    function BreedOffspring(PSelector: IParentSelector; Pop: IPopulation): IIndividual; 
  end; 
 
  IMutator = interface 
  ['{AE84B2DA-351A-400E-808A-F50D2BE105BA}']
    // This function performs mutation(s) on the individual passed 
    procedure Mutate(Individual : IIndividual); 
  end; 
 
  IExaminer = interface
  ['{81EC0896-4802-4065-AE6A-6E315935F579}']
    // Returns the fitness of an individual, where lower <=> better
    function GetFitness(Individual : IIndividual) : Double; 
  end; 
 
  IPopulation = interface
  ['{684F6134-32F7-4BE1-98DB-B1CCD70D884A}']
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
    // Adds an individual to the population 
    procedure Add(New : IIndividual); 
    // Deletes an individual from the population 
    procedure Delete(I : Integer); 
    // Runs a single generation 
    procedure Generation; 
    // Initialise the population 
    procedure Initialise(Size : Integer); 
    // Clear ourselves out 
    procedure Clear; 
    // Get the fitness of an individual 
    function FitnessOf(I : Integer) : Double; 
    // Access to the population members 
    property Pop[I : Integer] : IIndividual read GetIndividual; default; 
    // The size of the population 
    property Count : Integer read GetCount; 
    property ParentSelector : IParentSelector read GetParentSelector write SetParentSelector; 
    property Breeder : IBreeder read GetBreeder write SetBreeder; 
    property Killer : IKiller read GetKiller write SetKiller; 
    property Mutator : IMutator read GetMutator write SetMutator; 
    property Creator : ICreator read GetCreator write SetCreator; 
    property Examiner : IExaminer read GetExaminer write SetExaminer; 
    // An event 
    property OnChange : TNotifyEvent read GetOnChange write SetOnChange; 
  end;

  ////////////////////////old    TSP_I.pas
type
  TPoint3D = record
   X: double;
   Y: double;
   Z: double;
 end;
  TDARRAY333= array of array of double;
  ITSPController = interface;

  ITSPIndividual = interface(IIndividual)
  ['{DC0D9AF1-CC20-4C20-8937-C644AE291419}']
    function GetRouteArray(I: Integer): Integer;
    procedure SetRouteArray(I: Integer; const Value: Integer);
    procedure SetSteps(const Value: Integer);
    function GetSteps: Integer;
    property RouteArray[I : Integer] : Integer read GetRouteArray write SetRouteArray;
    property Steps : Integer read GetSteps write SetSteps;
//    property Fitness : Double read GetFitness write SetFitness;
  end;

  ITSPController = interface
  ['{4849621E-20EA-420C-ADF5-B30B5382F67E}']
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
    procedure SetCity(I: Integer;const Value: TPoint3D);
    function GetCityCount: Integer;
    {  Get the distance between two cities }
    function DistanceBetween(C1, C2 : Integer) : Double;
    {  Places the cities at random points }
    procedure RandomCities;
    {  Area limits }
    property Xmin: Double read GetXmin write SetXmin;
    property Xmax: Double read GetXmax write SetXmax;
    property Ymin: Double read GetYmin write SetYmin;
    property Ymax: Double read GetYmax write SetYmax;
    {  Access to the cities array }
    property Cities[I: Integer] : TPoint3D read GetCity   write SetCity;
    property Distance: TDARRAY333  read GetDistance   write SetDistance; // 距离矩阵
    property curDistance: TDARRAY333  read GetcurDistance   write SetcurDistance; // 距离矩阵
    property EdgeWeight: TDARRAY333  read GetEdgeWeight   write SetEdgeWeight; // 距离矩阵
    {  Properties... }
    property CityCount: Integer read GetCityCount write SetCityCount;
  end;

  ITSPDisplay = interface
  ['{05C21C3E-DB07-45C5-8EE9-CD1FD645108E}']
    {  Call this to draw the map }
    procedure DrawMap;
    {  Draw the map with a route  }
    procedure DrawMapWithRoute(Individual : ITSPIndividual);
  end;

  ITSPCreator = interface(ICreator)
 ['{252A57D9-E9E4-4099-A231-C5728F8D5ED4}']
    function GetController: ITSPController;
    procedure SetController(const Value: ITSPController);
    function CreateIndividual : IIndividual;
    property Controller : ITSPController read GetController write SetController;
  end;

  ITSPMutator = interface(IMutator)
  ['{9B7BEAC6-90B6-442A-B704-BA93A36C45C9}']
    procedure SetInv(const Value: Double);
    procedure SetTrans(const Value: Double);
    function GetInv: Double;
    function GetTrans: Double;
    // Probability of doing a transposition
    property Transposition : Double read GetTrans write SetTrans;
    // Probability of doing an inversion
    property Inversion : Double read GetInv write SetInv;
  end;

  ITSPExaminer = interface(IExaminer)
  ['{733E0B89-8CF7-45AB-AA70-2A65F31277BB}']
    function GetController: ITSPController;
    procedure SetController(const Value: ITSPController);
    // Returns the fitness of an individual as a real number where 0 => best
    property Controller : ITSPController read GetController write SetController;
  end;
implementation 
 
end. 
