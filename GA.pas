unit GA;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  TSPmain, TSP_EA, TSP_EA_I;
  ////,TSPPaint,TSPshow;       //TSP_EA,TSP_EA_I,TSP_I,TSPPaint,TSPshow
type
  TNode = record
    inPath: boolean;
    nextIndex: integer;
  end;

type
  TCity = record
    x, y: integer;
  end;


function GArun: integer;

function GAinit: integer;
function GAReRun: integer;
//const
//  CITY_COUNT = 10;  // 城市数量
//  POP_SIZE = 100;   // 种群规模
//  MAX_GEN = 500;    // 最大迭代次数
//  PCROSS = 0.85;    // 交叉概率
//  PMUTATE = 0.02;   // 变异概率
//  ELITISM = True;   // 是否启用精英保留

//type
//  TPath = array[0..CITY_COUNT - 1] of integer;
//  TTPopulation = array[0..POP_SIZE - 1] of TPath;
//var
//Cities: array[0..CITY_COUNT - 1] of TCity;
//  Fitness: array[0..POP_SIZE - 1] of double;
type
  TPath = array of integer;         //CITY_COUNT
  // TTPopulation =array of TPath;     //POP_SIZ
  TTPopulation = array of array of integer;       //POP_SIZ

var
  CITY_COUNT: integer;  // 城市数量
  POP_SIZE: integer;    // 种群规模
  MAX_GEN: integer;    // 最大迭代次数
  PCROSS: double;    // 交叉概率
  PMUTATE: double;    // 变异概率
  ELITISM: boolean;   // 是否启用精英保留

  Cities: array of TCity;   //   CITY_COUNT
  Fitness: array of double;   //POP_SIZE
  oldPopulation, NewPopulation: TTPopulation;
  BestPath: TPath;
  BestFitness: double;
  x: array of integer;
  y: array of integer;
  z: array of double;

  fff: TMain;
  fGenerations: integer;
  //Display: TshowTSP;
  Controller: ITSPController;
  BreederCrossover: IBreeder;
  Examiner: ITSPExaminer;
  Creator: ITSPCreator;
  KillerPercentage: IKillerPercentage;
  Mutator: ITSPMutator;
  Population: IPopulation;
  ParentSelectorTournament: IParentSelector;

  ArrFit: array of double;
  ArrFitLen: integer;
  ArrFitPos: integer;

implementation

uses
  Math;//,TSPPaint,TSPshow;       //TSP_EA,TSP_EA_I,TSP_I,TSPPaint,TSPshow

// 计算两个城市间距离
function Distance(c1, c2: integer): double;
begin
  Result := Sqrt(Sqr(Cities[c1].x - Cities[c2].x) + Sqr(Cities[c1].y - Cities[c2].y));
end;

// 评估路径长度（适应度函数）
function EvaluatePath(const path: TPath): double;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to CITY_COUNT - 2 do
    Result := Result + Distance(path[i], path[i + 1]);
  Result := Result + Distance(path[CITY_COUNT - 1], path[0]); // 回到起点
  Result := 1 / Result; // 转换为适应度（路径越短适应度越高）
end;



// 初始化种群
procedure IniTTPopulation;
var
  i, j, k: integer;
  temp: integer;
begin
  for i := 0 to POP_SIZE - 1 do
  begin
    // 创建初始路径（0..CITY_COUNT-1的排列）
    for j := 0 to CITY_COUNT - 1 do
      oldPopulation[i][j] := j;

    // Fisher-Yates洗牌算法打乱顺序
    for j := CITY_COUNT - 1 downto 1 do
    begin
      k := Random(j + 1);
      temp := oldPopulation[i][j];
      oldPopulation[i][j] := oldPopulation[i][k];
      oldPopulation[i][k] := temp;
    end;

    Fitness[i] := EvaluatePath(oldPopulation[i]);
  end;
end;

// 锦标赛选择
function TournamentSelection: integer;
const
  TOURNAMENT_SIZE = 3;
var
  i, candidate: integer;
  best: integer;
begin
  best := Random(POP_SIZE);
  for i := 1 to TOURNAMENT_SIZE - 1 do
  begin
    candidate := Random(POP_SIZE);
    if Fitness[candidate] > Fitness[best] then
      best := candidate;
  end;
  Result := best;
end;

// 顺序交叉（OX）
procedure OX_Crossover(const parent1, parent2: TPath; var child: TPath);
var
  i, j, k: integer;
  startPos, endPos: integer;
  remaining: array of boolean;
begin
  // 随机选择交叉段
  startPos := Random(CITY_COUNT);
  endPos := Random(CITY_COUNT);
  if startPos > endPos then
  begin
    i := startPos;
    startPos := endPos;
    endPos := i;
  end;

  SetLength(remaining, CITY_COUNT);
  for i := 0 to CITY_COUNT - 1 do
    remaining[i] := True;

  // 保留父代1的交叉段
  for i := startPos to endPos do
  begin
    child[i] := parent1[i];
    remaining[child[i]] := False;
  end;

  // 填充父代2的剩余城市
  k := (endPos + 1) mod CITY_COUNT;
  for i := 0 to CITY_COUNT - 1 do
  begin
    j := (i + endPos + 1) mod CITY_COUNT;
    if remaining[parent2[j]] then
    begin
      child[k] := parent2[j];
      k := ((k + 1) mod CITY_COUNT);
      remaining[parent2[j]] := False;
    end;
  end;
end;

// 交换变异
procedure SwapMutate(var path: TPath);
var
  i, j, temp: integer;
begin
  if Random < PMUTATE then
  begin
    i := Random(CITY_COUNT);
    j := Random(CITY_COUNT);
    temp := path[i];
    path[i] := path[j];
    path[j] := temp;
  end;
end;

// 进化一代
procedure Evolve;
var
  i, parent1, parent2: integer;
begin
  // 精英保留
  if ELITISM then
    NewPopulation[0] := BestPath;

  // 生成新一代
  for i := Ord(ELITISM) to POP_SIZE - 1 do
  begin
    // 选择
    parent1 := TournamentSelection;
    parent2 := TournamentSelection;

    // 交叉
    if Random < PCROSS then
      OX_Crossover(oldPopulation[parent1], oldPopulation[parent2], NewPopulation[i])
    else
      NewPopulation[i] := oldPopulation[parent1];

    // 变异
    SwapMutate(NewPopulation[i]);
  end;

  // 更新种群
  oldPopulation := NewPopulation;

  // 重新计算适应度
  for i := 0 to POP_SIZE - 1 do
    Fitness[i] := EvaluatePath(oldPopulation[i]);
end;

// 找到当前最优解
procedure FindBestSolution;
var
  i: integer;
  currentFitness: double;
begin
  for i := 0 to POP_SIZE - 1 do
  begin
    currentFitness := EvaluatePath(oldPopulation[i]);
    if currentFitness > BestFitness then
    begin
      BestFitness := currentFitness;
      BestPath := oldPopulation[i];
    end;
  end;
end;
// 初始化随机城市坐标
procedure InitCities;
var
  i: Integer;
begin
  Randomize;
  for i := 0 to CITY_COUNT-1 do
  begin
    Cities[i].x := Random(1000);
    Cities[i].y := Random(1000);
  end;
end;
// 输出结果
procedure PrintSolution;
var
  i: integer;
  totalDistance: double;
begin
  totalDistance := 1 / BestFitness;
  //Writeln('最优路径长度: ', totalDistance:0:2);
  //Write('路径顺序: ');
  fff.mem_GA.Lines.Add('最优路径长度: ' + floattostr(totalDistance));
  fff.mem_GA.Lines.Add('路径顺序: ');
  for i := 0 to CITY_COUNT - 1 do
  begin
    //Write(BestPath[i], ' ');
    // GAA.fff.mem_GA.Lines.Add(IntToStr(BestPath[i]));
    fff.mem_GA.Lines.Add(fff.pcodes[BestPath[i]]);
  end;
  setlength(fff.bestTour, length(BestPath));
  for i := 0 to length(BestPath) - 1 do
    fff.bestTour[i] := BestPath[i];
end;


function GArun: integer;
var
  gen: integer;
begin
  InitCities;
  IniTTPopulation;
  FindBestSolution;

  for gen := 1 to MAX_GEN do
  begin
    Evolve;
    FindBestSolution;
    if gen mod 50 = 0 then
    begin
      //Writeln('Generation ', gen, ': 当前最优 = ', (1/BestFitness):0:2);
    end;
  end;

  //Writeln('-- 最终结果 --');
  PrintSolution;

end;
//////////////////////////////
 //以上来自AI，结果不对，不知错在哪，
   //   ga.fff:=self;
  // ga.GArun;
   //drawTSPpath();
 //以下来自以前代码的简化
 //ga.GAinit;     //
 //   drawTSPpath();
   // self.mem_GA.Lines.Add('draw='+floattostr(drawTSPpathLong));
/////////////////////////////
function GAinit: integer;
var
  i, j: integer;
  rij: double;
begin

  CITY_COUNT := fff.CityCount;  // 城市数量
  POP_SIZE := fff.POP_SIZE.Value;    // 种群规模
  MAX_GEN := fff.MAX_GEN.Value;    // 最大迭代次数
  PCROSS := fff.PCROSS.Value / 100;     // 交叉概率
  PMUTATE := fff.PMUTATE.Value / 100;     // 变异概率
  ELITISM := True;   // 是否启用精英保留

  setlength(Cities, CITY_COUNT);
  setlength(Fitness, POP_SIZE);
  setlength(Cities, CITY_COUNT);

  setlength(oldPopulation, POP_SIZE, CITY_COUNT);
  setlength(NewPopulation, POP_SIZE, CITY_COUNT);
  setlength(BestPath, CITY_COUNT);

  setlength(x, CITY_COUNT);
  setlength(y, CITY_COUNT);
  for i := 0 to CITY_COUNT - 1 do
  begin
    x[i] := trunc(fff.Cities[i].x);
    y[i] := trunc(fff.Cities[i].y);
    //z[i] := 0;// (fff.WeightsPoint[i]);  //test
  end;


  setlength(fff.distance, CITY_COUNT, CITY_COUNT);
  for i := 0 to CITY_COUNT - 1 do
  begin
    fff.distance[i][i] := 0;  // 对角线为0
    for j := i + 1 to CITY_COUNT - 1 do
    begin

      fff.distance[i][j] := -1.0;
      //   rij := sqrt(((x[i] - x[j]) * (x[i] - x[j]) + (y[i] - y[j]) * (y[i] - y[j])
      //  ) / 1.0) * fff.WeightsEdge[i][j] ;
      rij := sqrt(((x[i] - x[j]) * (x[i] - x[j]) + (y[i] - y[j]) *
        (y[i] - y[j])) / 1.0);
      if fff.distance[i][j] = -1.0 then
      begin
        fff.distance[i][j] := rij;
        fff.distance[j][i] := fff.distance[i][j];
      end
      else
      begin

      end;
    end;
  end;
  fff.distance[CITY_COUNT - 1][CITY_COUNT - 1] := 0;



  Randomize;
  for i := 0 to CITY_COUNT - 1 do
  begin
    //Cities[i].x := Random(1000);
    //Cities[i].y := Random(1000);
    Cities[i].x := trunc(fff.Cities[i].x);
    Cities[i].y := trunc(fff.Cities[i].y);

  end;

  //Display := TshowTSP.Create(self, fff.Image1);
  //Display.SetRanges(0.0, 11.0, 0.0, 11.0, 1.0);
  //Display.BgColor := clWhite;
  //Display.Clear;

  Controller := TTSPController.Create;
  Controller.CityCount := fff.CityCount;  ///////////////////////////////
  //Controller.Xmin := Display.Xmin;
  //Controller.Xmax := Display.Xmax;
  //Controller.Ymin := Display.Ymin;
  //Controller.Ymax := Display.Ymax;

  //Display.Controller := Controller;

  Creator := TTSPCreator.Create;
  Creator.Controller := Controller;

  BreederCrossover := TTSPBreederCrossover.Create;

  Examiner := TTSPExaminer.Create;
  Examiner.Controller := Controller;

  KillerPercentage := TKillerPercentage.Create;

  Mutator := TTSPMutator.Create;

  ParentSelectorTournament := TParentSelectorTournament.Create;

  Population := TPopulation.Create;
  Population.Breeder := BreederCrossover;
  Population.Examiner := Examiner;
  Population.Creator := Creator;
  Population.Killer := KillerPercentage;
  Population.Mutator := Mutator;
  Population.ParentSelector := ParentSelectorTournament;



  Population.Initialise(POP_SIZE);



  KillerPercentage.Percentage := 50; // 50
  Mutator.Transposition := 55; // 50
  Mutator.Inversion := 55; // 50
  for i := 1 to POP_SIZE do
  begin
    Population.Generation;
    // R_SGA := (Population[0] as ITSPIndividual);
    // Display.DrawMapWithRoute(Population[0] as ITSPIndividual);

    Application.ProcessMessages;
  end;

  fff.mem_GA.Lines.Add('总路长：' + floattostr(Population.FitnessOf(0)));
 //fff.mem_GA.Lines.Add('总路长：' + floattostr((Population[0] as ITSPIndividual).Fitness));


  fff.mem_GA.Lines.Add('路径：');
  for i := 0 to (Population[0] as ITSPIndividual).Steps - 1 do
    fff.mem_GA.Lines.Add(fff.pcodes[(Population[0] as ITSPIndividual)
      .RouteArray[i]]);
  // fff.mem_GA.Perform(WM_VSCROLL, SB_BOTTOM, 0);   // 滚动到底部
  fff.mem_GA.SelStart := Length(fff.mem_GA.Text);

  setlength(fff.bestTour, CITY_COUNT);
  for i := 0 to CITY_COUNT - 1 do
    fff.bestTour[i] := (Population[0] as ITSPIndividual).RouteArray[i];
  Application.ProcessMessages;
end;


function GAReRun: integer;
var
  i:integer;
begin
for i := 1 to POP_SIZE do
begin
  Population.Generation;
  // R_SGA := (Population[0] as ITSPIndividual);
  // Display.DrawMapWithRoute(Population[0] as ITSPIndividual);

  Application.ProcessMessages;
end;
 fff.mem_GA.Lines.Add('总路长：' + floattostr(Population.FitnessOf(0)));
 //fff.mem_GA.Lines.Add('总路长2：' + floattostr((Population[0] as ITSPIndividual).Fitness));


  fff.mem_GA.Lines.Add('路径：');
  for i := 0 to (Population[0] as ITSPIndividual).Steps - 1 do
    fff.mem_GA.Lines.Add(fff.pcodes[(Population[0] as ITSPIndividual)
      .RouteArray[i]]);
  // fff.mem_GA.Perform(WM_VSCROLL, SB_BOTTOM, 0);   // 滚动到底部
  fff.mem_GA.SelStart := Length(fff.mem_GA.Text);

  setlength(fff.bestTour, CITY_COUNT);
  for i := 0 to CITY_COUNT - 1 do
    fff.bestTour[i] := (Population[0] as ITSPIndividual).RouteArray[i];
  Application.ProcessMessages;
end;
end.
