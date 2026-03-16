unit TFire;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, TSPmain;

type
  TNode = record
    inPath: boolean;
    nextIndex: integer;

  end;

  TIARRAY1 = array of integer;

  TTFire = class(TComponent)
  private

  private
    cityNum: integer; // 城市数量

  private
    distance: array of array of double;  // 距离矩阵
  private
    bestLength0: double; // 最佳长度
    bestLength1: double; // 最佳长度
    bestLength2: double; // 最佳长度
    bestLengthTemp: double; // 最佳长度
    bestRoad: string;
  private
    // bestTour0: array of integer; // 最佳路径
    // bestTour1: array of integer; // 最佳路径
    // bestTour2: array of integer; // 最佳路径
    // bestTourTemp: array of integer; // 最佳路径
    bestTour0: TIARRAY1; // 最佳路径
    bestTour1: TIARRAY1; // 最佳路径
    bestTour2: TIARRAY1; // 最佳路径
    bestTourTemp: TIARRAY1; // 最佳路径

  private
    p: array of TNode; // 最佳路径

  private
    DP: array of array of double;  // 距离矩阵
  public
    fff: TMain;

    bestTour: array of integer; // 最佳路径
    x: array of integer;
    y: array of integer;
    z: array of double;
    w: double;
    oneEdgeLong: array of double;  // 距离矩阵
    constructor Create(n: integer; vfff: TMain);
    destructor Destroy; override;
    procedure printPath;
    procedure printOptimal;
    function init: integer;
    function main: integer;
    function getPathLength(iar: TIARRAY1): double;
    procedure create_new();
    procedure bestTour1To2(iar1, iar2: TIARRAY1);
    function dp_tsp(lastindex: integer; path1: string; pathLen: double;
      path2: string): double;
  end;

implementation

uses
  Math;

procedure TTFire.bestTour1To2(iar1, iar2: TIARRAY1);
var
  i: integer;
begin
  for i := 0 to cityNum - 1 do
    iar2[i] := iar1[i];
end;

constructor TTFire.Create(n: integer; vfff: TMain);
var
  i: integer;
  s: string;
begin

  inherited Create(fff);
  // n:=6;
  cityNum := n;

  fff := vfff;
  setlength(distance, cityNum, cityNum);
  setlength(fff.curdistance, cityNum, cityNum); ///
  setlength(fff.distance, cityNum, cityNum);  /////
  setlength(p, cityNum);
  setlength(oneEdgeLong, cityNum);
  bestLength0 := 10000000;
  setlength(bestTour, cityNum);
  setlength(bestTour0, cityNum);
  setlength(bestTour1, cityNum);
  setlength(bestTour2, cityNum);
  setlength(bestTourTemp, cityNum);
end;

procedure TTFire.create_new;
var
  ii, jj, tempi: integer;
begin
  ii := trunc(Random(cityNum));
  jj := ii;
  while jj = ii do
    jj := trunc(Random(cityNum));

  tempi := bestTour2[ii];
  bestTour2[ii] := bestTour2[jj];
  bestTour2[jj] := tempi;

end;

destructor TTFire.Destroy;
var
  i: integer;
begin
  inherited;

end;

function TTFire.init: integer;
var
  i, j, k, tij, ii, jj: integer;
  rij, mindis, minlen: double;
  line: string;
  www, qq: TStringList;
  //  x: array of integer;
  //  y: array of integer;
  //  z: array of double;
  s, temps: string;
begin
  // 计算距离矩阵
  // ，针对具体问题，距离计算方法也不一样，此处用的是att48作为案例，它有48个城市，距离计算方法为伪欧氏距离，最优值为10628
  setlength(x, cityNum);
  setlength(y, cityNum);
  setlength(z, cityNum);
  // www:=tstringlist.Create;
  // qq:=tstringlist.Create;
  // www.LoadFromFile('c:\data.txt');
  for i := 0 to cityNum - 1 do
  begin
    x[i] := trunc(fff.Cities[i].x);
    y[i] := trunc(fff.Cities[i].y);
    z[i] := 0;// (fff.WeightsPoint[i]);  //test
    //z[i] :=  (fff.WeightsPoint[i]);  //test
    // qq.Delimiter:=' ';
    // qq.DelimitedText:=www.Strings[i];
    // x[i]:=strtoint(qq.Strings[1]);
    // y[i]:=strtoint(qq.Strings[2]);
  end;
  // qq.Free;

  for i := 0 to cityNum - 1 do
  begin
    distance[i][i] := 0; // 对角线为0
    fff.curdistance[i][i] := 0;
    for j := i + 1 to cityNum - 1 do
    begin
      fff.distance[i][j] := -1.0;
      //   rij := sqrt(((x[i] - x[j]) * (x[i] - x[j]) + (y[i] - y[j]) * (y[i] - y[j])
      //  ) / 1.0) * fff.WeightsEdge[i][j] ;
      rij := sqrt(((x[i] - x[j]) * (x[i] - x[j]) + (y[i] - y[j]) *
        (y[i] - y[j])) / 1.0);
      if fff.distance[i][j] = -1.0 then
      begin
        distance[i][j] := rij;
        distance[j][i] := distance[i][j];
        fff.curdistance[i][j] := distance[i][j];
        fff.curdistance[j][i] := distance[i][j];

      end
      else
      begin
        distance[i][j] := fff.distance[i][j];
        //不是 代替SQRT，否则仍然要乘以权数，自定义边长则不再乘权数乎
        distance[j][i] := distance[i][j];
        fff.curdistance[i][j] := distance[i][j];
        fff.curdistance[j][i] := distance[i][j];
      end;
    end;
  end;
  distance[cityNum - 1][cityNum - 1] := 0;
  fff.curdistance[cityNum - 1][cityNum - 1] := 0;

  // bestLength := 10000000;
  // setlength(bestTour, cityNum + 1);

  // s := ',0,';
  bestTour0[0] := 0;
  bestLength0 := 0;
  for i := 0 to cityNum - 2 do
  begin
    // s := s + inttostr(i) + ',';
    bestTour0[i] := i;
    bestLength0 := bestLength0 + distance[i][i + 1] + z[i];
  end;
  bestLength0 := bestLength0 + distance[cityNum - 1][0] + z[cityNum - 1];
  // bestRoad := s;

  s := ',0,';
  bestTourTemp[0] := 0;
  minlen := 0;
  jj := 0;
  j := 0;
  while 1 = 1 do
  begin
    mindis := 1000000000;
    for i := 0 to cityNum - 1 do
    begin
      if i = j then
        continue;
      if pos(',' + IntToStr(i) + ',', s) > 0 then
        continue;

      if mindis > distance[j][i] then
      begin
        mindis := distance[j][i];
        ii := i;
      end;
    end;
    s := s + IntToStr(ii) + ',';
    bestTourTemp[jj] := ii;
    j := ii;
    jj := jj + 1;

    minlen := minlen + mindis + z[j];
    if jj = cityNum - 1 then
      break;
    // 上面两句位置互换，结果产生BUG，现更正。
  end;
  minlen := minlen + distance[j][0] + z[0];
  if minlen < bestLength0 then
  begin
    bestLength0 := minlen;
    // bestRoad := s;
    for i := 0 to cityNum - 1 do
      bestTour0[i] := bestTourTemp[i];
  end;

end;

function TTFire.main: integer;
var
  i: integer;
  s, ss: string;
  T0, T1, T, q, f1, f2, df, r: double;
  L: integer;
begin
  //T0 := 5000.0;
  //T1 := 0.01;
  //q := 0.98;
  //L := 1000;
  T0 := fff.fireEdit1.Value;
  T1 := fff.fireEdit2.Value / 100;
  q := fff.fireEdit3.Value / 100;
  L := fff.fireEdit4.Value;



  T := T0;
  bestTour1To2(bestTour0, bestTour1);
  f1 := bestLength0;
  while T > T1 do
  begin
    for i := 0 to L - 1 do
    begin
      bestTour1To2(bestTour1, bestTour2);
      create_new();
      // f1:= getPathLength(bestTour1);
      f2 := getPathLength(bestTour2);
      if f2 < bestLength0 then
      begin
        bestLength0 := f2;
        bestTour1To2(bestTour2, bestTour0);

      end;
      df := f2 - f1;
      // 以下是Metropolis准则
      if df >= 0 then
      begin
        r := Random;
        if (exp(-df / T) <= r) then
          continue; // 保留原来的解
      end;
      bestTour1To2(bestTour2, bestTour1);
      f1 := f2;

    end;
    T := T * q;
    //if 1 = 2 then
    begin
      //if ProgressBarPOS = ProgressBarMax - 1 then
      //  ProgressBarPOS := 0;
      //ProgressBarPOS := ProgressBarPOS + 1;
      //ProgressBar.Position := ProgressBarPOS;
      // MainForm.Memo4.Lines.Add('pos='+inttostr(pr.Position));
      application.ProcessMessages;
    end;
  end;

  fff.mem_subfire.Lines.Add('总路长: ' + floattostr(bestLength0));
  printPath;
end;

procedure TTFire.printOptimal;
begin

end;

procedure TTFire.printPath;
var
  pre, Next, Count, L: integer;
  a, i: integer;
  s: string;
  sss: TStringList;
begin

  fff.mem_subfire.Lines.Add('路径: ');
  for i := 0 to cityNum - 1 do
  begin
    begin
      fff.mem_subfire.Lines.Add(fff.PCodes[bestTour0[i]]);
      bestTour[i] := bestTour0[i];
    end;
  end;
  setlength(fff.bestTour, length(bestTour));
  for i := 0 to length(bestTour) - 1 do
    fff.bestTour[i] := bestTour[i];
end;

function TTFire.dp_tsp(lastindex: integer; path1: string; pathLen: double;
  path2: string): double;
var
  i, Value, L, subi, isexists, ismin, j, curi: integer;
  isLast: boolean;
  tmpsub, subs: string;
  subdp, iresult: double;
  ss: TStringList;
begin

end;

function TTFire.getPathLength(iar: TIARRAY1): double;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to cityNum - 2 do
  begin
    Result := Result + distance[iar[i]][iar[i + 1]] + z[iar[i]];
  end;
  Result := Result + distance[iar[cityNum - 1]][iar[0]] + z[iar[cityNum - 1]];
end;

end.
