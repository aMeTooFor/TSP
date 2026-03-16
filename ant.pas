unit ant;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,TSPmain;

type
  TDARRAY = array of array of double;
  TIARRAY = array of array of integer;
  TSARRAY = array of array of string;

  TAnt = class(Tcomponent)
  private
  private
     vdelta: TDARRAY; // 信息数变化矩阵   // 信息素增量矩阵(detatao_ij)
    // private vdistance: TDARRAY; //距离矩阵//事前根据坐标已一次性计算好的，不用再计算。//实际上是个全局表，传来传去无意义
    vdistance: TDARRAY; // 距离矩阵//事前根据坐标已一次性计算好的，不用再计算。//实际上是个全局表，传来传去无意义  private
  private
    alpha: double; // 信息启发式因子，表示轨迹的相对重要性
  private
    beta: double; // 期望式启发因子，表示能见度的相对重要性
  private
    tabu: Tstringlist; // 禁忌表//已搜过的城市
  private
    cityNum: integer; // // 城市数量
  private
    tourLength: double; // 路径长度//相加耳。
  private
    vfirstCity: integer; // 起始城市//实际上为第二城市，因为大家有一个公共的起始城市乎。
  private
    // currentCity: integer; // 当前城市
    function GetFirstCity: integer;
    procedure SetFirstCity(const Value: integer);
    function GetCityNum: integer;
    procedure SetCityNum(const Value: integer);

    function GetDelta: TDARRAY;
    procedure SetDelta(const Value: TDARRAY);
  public
    delta0: double;

	taco0:Tcomponent;//TACO
    allowedCities: Tstringlist; //  允许搜索的城市//未搜过的城市
    currentCity: integer; // 当前城市
    constructor Create(num: integer;vfff: TMain; delta00:double;taco00:Tcomponent);
    destructor Destroy; override;
    property FirstCity: integer read GetFirstCity write SetFirstCity;
    property Delta: TDARRAY read GetDelta write SetDelta;
    function calculateTourLength(): double;
    // function init(vdistance:TDARRAY;  a:double;  b:double):integer;
    function init(a: double; b: double): integer;
    procedure selectNextCity(pheromone: TDARRAY);
    function getTabu: Tstringlist;
    function GetTourLength: double;
    procedure SetTourLength(const Value: double);
  end;

implementation

uses
  Math, aco;

{ Painter0 }

constructor TAnt.Create(num: integer;vfff: TMain; delta00:double;taco00:Tcomponent);
begin
  inherited Create(vfff);
  // vfff:=fff;
  cityNum := num;
  tourLength := 0;
  allowedCities := Tstringlist.Create;
  tabu := Tstringlist.Create;
  delta0:=delta00;
  taco0:=taco00;
end;

destructor TAnt.Destroy;
begin
  inherited;
  allowedCities.free;
  tabu.free;

end;

function TAnt.GetFirstCity: integer;
begin
  result := vfirstCity;
end;

procedure TAnt.SetFirstCity(const Value: integer);
begin
  vfirstCity := Value;

end;

function TAnt.GetCityNum: integer;
begin
  result := cityNum;
end;

procedure TAnt.SetCityNum(const Value: integer);
begin
  cityNum := Value;

end;

function TAnt.GetTourLength: double;
begin
  result := calculateTourLength();
end;

procedure TAnt.SetTourLength(const Value: double);
begin
  tourLength := Value;

end;

function TAnt.calculateTourLength: double;
var
  i: integer;
  len: double;
begin
  len := 0;
  for i := 0 to cityNum - 1 do
  begin
    len := len + aco.distance[strtoint(tabu.Strings[i])
      ][strtoint(tabu.Strings[i + 1])];
  end;

  // len :=len+ distance[strtoint(tabu.Strings[i+1])][strtoint(tabu.Strings[0])];
  result := len;
end;

// function TAnt.init(vdistance:TDARRAY;  a:double;  b:double):integer;
function TAnt.init(a: double; b: double): integer;
var
  i, j: integer;
begin
  alpha := a;
  beta := b;
  allowedCities.Clear;
  tabu.Clear;
  // distance := vdistance;
  setlength(vdelta, cityNum, cityNum);
  for i := 0 to cityNum - 1 do
  begin
    allowedCities.add(inttostr(i));
    for j := 0 to cityNum - 1 do
      Delta[i][j] := delta0;
      //Delta[i][j] := TACO(taco0).pheromone0;
      //Delta[i][j] :=   TMainForm( fff).
  end;

  Randomize;

  FirstCity := Random(cityNum);
  for i := 0 to allowedCities.Count - 1 do
  begin
    if strtoint(allowedCities.Strings[i]) = FirstCity then
    begin
      allowedCities.Delete(i);
      break;
    end;
  end;

  tabu.add(inttostr(FirstCity));
  currentCity := FirstCity;

end;

procedure TAnt.selectNextCity(pheromone: TDARRAY);
var
  p: array of double;
  sum, sleectP, sum1: double;
  i, j, selectCity: integer;
  flag: boolean;
begin
  setlength(p, cityNum);
  sum := 0.0;
  // 计算分母部分
  for i := 0 to allowedCities.Count - 1 do
  begin
    sum := sum + power(pheromone[currentCity][strtoint(allowedCities.Strings[i])
      ], alpha) *
      power(1.0 / max(distance[currentCity][strtoint(allowedCities.Strings[i])],
      0.0001), beta);
  end;
   // 计算概率矩阵
  for i := 0 to cityNum - 1 do
  begin
    flag := false;
    for j := 0 to allowedCities.Count - 1 do
    begin

      if (i = strtoint(allowedCities.Strings[j])) then
      begin
        p[i] := (power(pheromone[currentCity][i], alpha) *
          power(1.0 / max(distance[currentCity][i], 0.0001), beta)) / sum;
        flag := true;
        break;
      end;
    end;

    if (flag = false) then
      p[i] := 0.0;
    //sum1 := sum1 + p[i];
  end;

   // 轮盘选择下一个城市
  Randomize;

  sleectP := Random; // *sum1;//(trunc(sum1));// random;
  // sleectP :=random(trunc(sum1));// random;
  selectCity := -1;
  sum1 := 0.0;
  j := 1;
  while (1 = 1) do
  begin
    sum1 := 0.0;
    for i := 0 to cityNum - 1 do
    begin
      sum1 := sum1 + j * p[i];
      if (sum1 >= sleectP) then
      begin
        selectCity := i; // strtoint(allowedCities.Strings[i]);
        break;
      end;
    end;
    if selectCity = -1 then
      j := j + 1
    else
      break;
  end;
  // 从允许选择的城市中去除select city
  for i := 0 to allowedCities.Count - 1 do
  begin
    if strtoint(allowedCities.Strings[i]) = selectCity then
    begin
      allowedCities.Delete(i);
      break;
    end;
  end;
  // 在禁忌表中添加select city
  tabu.add(inttostr(selectCity));
  // 将当前城市改为选择的城市
  currentCity := selectCity;

end;

function TAnt.GetDelta: TDARRAY;
begin
  result := vdelta;
end;

procedure TAnt.SetDelta(const Value: TDARRAY);
begin
  vdelta := Value;
end;

function TAnt.getTabu: Tstringlist;
begin
  result := tabu;
end;

end.

