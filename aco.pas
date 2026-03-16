unit aco;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,ant,TSPmain;

type

  TACO = class(Tcomponent)
  private

  private
    ants: array of Tant; // 蚂蚁
  private
    antNum: integer; //蚂蚁数量
  private
    cityNum: integer; //城市数量
  private
    MAX_GEN: integer; // 运行代数


  private
    // bestLength: double; // 最佳长度
  private
     // bestTour: array of integer; // 最佳路径
  private
    pheromone: TDARRAY; // // 信息素矩阵信息素矩阵(tau_ij)
    // 三个参数
  private
    alpha: double; // 信息启发式因子，表示轨迹的相对重要性
  private
    beta: double; // 期望式启发因子，表示能见度的相对重要性
  private
    rho: double; // 表示信息挥发系数，（1-rho）表示信息残留因子，通常[0 <= rho <= 1]
  public
    pheromone0: double;
    fff: TMain;
    bestLength: double; // 最佳长度
    bestTour: array of integer; // 最佳路径
    constructor Create(n, m, gMAX_GEN: integer;
      alpha0, beta0, rho0, pheromone00: double; vfff: TMain);
    destructor Destroy; override;
    procedure updatePheromone;
    //procedure printOptimal;
    function init: integer;
    function solve: integer;
    function setg(m, gMAX_GEN: integer;
      alpha0, beta0, rho0, pheromone00: double): integer;
  end;

var
  distance: TDARRAY; // 距离矩阵
  // distance: TIARRAY; // 距离矩阵
  x: array of integer;
  y: array of integer;
  z: array of double;
    w: double;
    oneEdgeLong: array of double;  // 距离矩阵

    // 蚁群中蚂蚁数：200
    // 信息素重要程度alpha：16
    // 启发式因子重要程度beta：5
    // 信息素挥发(百分数)rho：38
    // 信息素初始值(百分数)：13
    // delta初始值(百分数)：11
    // 蚁群数量(迭代数)：200
implementation

uses
  Math;

constructor TACO.Create(n, m, gMAX_GEN: integer;
  alpha0, beta0, rho0, pheromone00: double; vfff: TMain);
var
  i: integer;
begin

  inherited Create(vfff);
  cityNum := n;
  // antNum := m;
  // setlength(ants, antNum);
  // setlength(pheromone,cityNum,cityNum);
  setlength(distance, 0, 0);
  setlength(distance, cityNum, cityNum);

  // for i:=0 to antNum-1 do
  // ants[i] := TAnt.create(cityNum);
  MAX_GEN := gMAX_GEN;
  alpha := alpha0;
  beta := beta0;
  rho := rho0;
  pheromone0 := pheromone00;

  antNum := m;
  setlength(ants, antNum);
  MAX_GEN := gMAX_GEN;
  alpha := alpha0;
  beta := beta0;
  rho := rho0;
  pheromone0 := pheromone00;


  fff := vfff;
  if bestLength = 0 then
    bestLength := 10000000;
   setlength(fff.curdistance, cityNum, cityNum); ///
  setlength(fff.distance, cityNum, cityNum);  /////
  bestLength := 10000000;
  setlength(oneEdgeLong, cityNum);
 setlength(bestTour, cityNum );


end;

destructor TACO.Destroy;
var
  i: integer;
begin
  inherited;

end;

procedure TACO.updatePheromone;
var
  i, j, k: integer;
begin
   // 信息素挥发
  for i := 0 to cityNum - 1 do
    for j := 0 to cityNum - 1 do
      pheromone[i][j] := pheromone[i][j] * (1 - rho);
  // 信息素更新
  for i := 0 to cityNum - 1 do
    for j := 0 to cityNum - 1 do
    begin
      for k := 0 to antNum - 1 do
        pheromone[i][j] := pheromone[i][j] + ants[k].Delta[i][j];
      if (pheromone[i, j] < 0.00001) then // 信息素下界，信息素过少不能较好的加深最佳解
        pheromone[i, j] := 0.00001;
      if (pheromone[i, j] > 20) then // 信息素上界，信息素过多会淹没启发信息
        pheromone[i, j] := 20;
    end;
end;

function TACO.init: integer;
var
  i, j, k, tij: integer;
  rij: double;
  line: string;
  www, qq: tstringlist;
  x: array of integer;
  y: array of integer;
  z: array of double;
begin
   // 计算距离矩阵
  // ，针对具体问题，距离计算方法也不一样，此处用的是att48作为案例，它有48个城市，距离计算方法为伪欧氏距离，最优值为10628  setlength(x, cityNum);
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
    distance[i][i] := 0;// 对角线为0
    fff.curdistance[i][i] := 0;
    for j := i + 1 to cityNum - 1 do
    begin
      // if (1 = 21) then
      // begin
      // rij := sqrt(((x[i] - x[j]) * (x[i] - x[j]) + (y[i] - y[j]) *
      // (y[i] - y[j])) / 1.0);
      //
      // distance[i][j] := rij;
      // distance[j][i] := rij;
      // MainForm.Display.Controller.curdistance[i][j] := distance[i][j];
      // MainForm.Display.Controller.curdistance[j][i] := distance[j][i];
      // end
      // else
      begin
     //   rij := sqrt(((x[i] - x[j]) * (x[i] - x[j]) + (y[i] - y[j]) *
      //    (y[i] - y[j])) / 1.0) * fff.WeightsEdge[i][j];
        rij := sqrt(((x[i] - x[j]) * (x[i] - x[j]) + (y[i] - y[j]) *
          (y[i] - y[j])) / 1.0) ;
        fff.distance[i][j] := -1.0;
        if fff.distance[i][j] = -1.0 then
        begin
          // distance[i][j] :=  rij;
          // distance[j][i] :=  rij;
          distance[i][j] := rij + z[i];
          distance[j][i] := rij + z[j];
          fff.curdistance[i][j] := distance[i][j];
          fff.curdistance[j][i] := distance[j][i];

        end
        else
        begin
          // distance[i][j] := MainForm.Display.Controller.distance[i][j];
          // distance[j][i] := MainForm.Display.Controller.distance[i][j];
          distance[i][j] := fff.distance[i][j] + z[i];
       // 不是 代替SQRT，否则仍然要乘以权数，自定义边长则不再乘权数乎
          distance[j][i] := fff.distance[i][j] + z[j];
          fff.curdistance[i][j] := distance[i][j];
          fff.curdistance[j][i] := distance[j][i];
        end;
      end;
    end;
  end;
  distance[cityNum - 1][cityNum - 1] := 0;
  fff.curdistance[cityNum - 1][cityNum - 1] := 0;
  // www.Clear;
  // for  i:=0 to  cityNum-1 do
  // begin
  // line:='';
  // for  j:=0 to  cityNum-1 do
  // line:=line+' '+ inttostr(distance[i][j]);
  // www.Add(line);
  // end;
  // www.SaveToFile('c:\qq.txt');
  // www.Free;
 // 初始化信息素矩阵
  setlength(pheromone, cityNum, cityNum);
  for i := 0 to cityNum - 1 do
  begin
    for j := 0 to cityNum - 1 do
      pheromone[i][j] := pheromone0; // 0.1; 信息素初始值，别人要计算的。
    // if i=26 then
    // beep;
  end;
  // bestLength := 10000000;
  setlength(bestTour, cityNum + 1);
  // 随机放置蚂蚁
  // antNum := m;
  // setlength(ants, antNum);
  for i := 0 to antNum - 1 do
  begin
    ants[i] := Tant.Create(cityNum, fff, TMain(fff).Delta.Value /
      100.0, self);
    // ants[i].init(distance, alpha, beta);
    ants[i].init(alpha, beta);
  end;
  // beep;

end;

function TACO.solve: integer;
var
  i, j, k, g: integer;
  rij: double;
begin
  // for (int g = 0; g < MAX_GEN; g++) {
  //fff.ProgressBar1.Visible := true;
  //fff.ProgressBar1.Max := MAX_GEN;
  //fff.ProgressBar1.Position := 0;
  for g := 0 to MAX_GEN do
  begin
    //fff.ProgressBar1.Position := MainForm.ProgressBar1.Position + 1;
    for i := 0 to antNum - 1 do
    begin
      application.ProcessMessages;
      for j := 1 to cityNum - 1 do // 这句翻译错了，不是从0，而是从1

        ants[i].selectNextCity(pheromone);

      ants[i].getTabu().add(inttostr(ants[i].FirstCity));
            // 此句使其成圆形路径。function TAnt.calculateTourLength: integer;之中用到。
      if ants[i].getTourLength > 0 then
        if (ants[i].getTourLength < bestLength) then
        begin

          bestLength := ants[i].getTourLength();

          for k := 0 to cityNum do
            bestTour[k] := strtoint(ants[i].getTabu().strings[k]);

        end;
      for j := 0 to cityNum - 1 do
      begin
        if ants[i].getTourLength() = 0 then
          // beep;
          continue;
        ants[i].Delta[strtoint(ants[i].getTabu().strings[j])
          ][strtoint(ants[i].getTabu().strings[j + 1])] :=
          (1. / ants[i].getTourLength());
        ants[i].Delta[strtoint(ants[i].getTabu().strings[j + 1])
          ][strtoint(ants[i].getTabu().strings[j])] :=
          (1. / ants[i].getTourLength());
      end;
      // beep;

    end;

    // 更新信息素
    updatePheromone();
    // System.out.println("g is: " + g);
     // 重新初始化蚂蚁
    // for  i:=0 to  antNum-1 do
    begin
      // TANT(ants[i]).Free;
      // ants[i]:=nil;
    end;

    // for  i:=0 to  antNum-1 do
    // ants[i].init(distance, alpha, beta);
    // beep;
    for i := 0 to antNum - 1 do
    begin
      // ants[i] := TAnt.create(cityNum,vfff);
      // ants[i].init(distance, alpha, beta);
      ants[i].init(alpha, beta);
    end;
  end;
  for i := 0 to antNum - 1 do
  begin
    Tant(ants[i]).Free;
    ants[i] := nil;
  end;

 // printOptimal;
   setlength(fff.bestTour, length(bestTour));
  for i := 0 to length(bestTour) - 1 do
    fff.bestTour[i] := bestTour[i];
end;
//
//procedure TACO.printOptimal;
//var
//  i: integer;
//  www: tstringlist;
//  Atom: TAtom;
//  S: ShortString;
//  New: TTSPIndividual;
//begin
//  MainForm.Memo2.Lines.add('================');
//  MainForm.Memo2.Lines.add('总路长: ' + floattostr(bestLength));
//  MainForm.Memo2.Lines.add('路径:');
//  for i := 0 to cityNum - 1 do
//    // MainForm.Memo2.Lines.add('P' + inttostr(bestTour[i]));
//    MainForm.Memo2.Lines.add(MainForm.PMemo[bestTour[i]]);
//  { www:=tstringlist.Create;
//    www.Add('The optimal length is: ' + inttostr(bestLength));
//    www.Add('The optimal tour is: ');
//    for  i:=0 to  cityNum do
//    www.Add(INTTOSTR(bestTour[i]));
//    TMainForm(vfff).setmemo2(www); }
//  { S:='The optimal length is: ' + inttostr(bestLength)+#0;
//    Atom:=GlobalAddAtom(@S[1]);
//    SendMessage(fff.Handle, WM_MyMessage, 0, Atom);
//    GlobalDeleteAtom(Atom);
//    for  i:=0 to  cityNum do
//    begin
//    S:=INTTOSTR(bestTour[i])+#0;
//    Atom:=GlobalAddAtom(@S[1]);
//    SendMessage(fff.Handle, WM_MyMessage, 0, Atom);
//    GlobalDeleteAtom(Atom);
//
//    end;
//  }
//  // www.SaveToFile('c:\www.txt');
//  New := TTSPIndividual.Create(cityNum);
//  // Initialise it with a sequential route
//  for i := 0 to cityNum - 1 do
//    New.RouteArray[i] := bestTour[i];
//  MainForm.R_ACO := New;
//  MainForm.Display.DrawMapWithRoute(New, 2);
//end;

function TACO.setg(m, gMAX_GEN: integer;
  alpha0, beta0, rho0, pheromone00: double): integer;
begin
  antNum := m;
  setlength(ants, antNum);
  MAX_GEN := gMAX_GEN;
  alpha := alpha0;
  beta := beta0;
  rho := rho0;
  pheromone0 := pheromone00;
end;

end.

