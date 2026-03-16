unit DP;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, TSPmain;

type
  TNode = record
    inPath: boolean;
    nextIndex: integer;

  end;

  TDP = class(TComponent)
  private

  private
    cityNum: integer; // 城市数量

  private
    distance: array of array of double;  // 距离矩阵
  private
    bestLength: integer; // 最佳长度
  private

  private
    p: array of TNode; // 最佳路径

  private
    DP: array of array of double;  // 距离矩阵
  public
    fff: TMain;
    ProgressBarMax: integer;
    ProgressBarPos: integer;
    power2: array of integer; // 最佳路径
    bestTour: array of integer; // 最佳路径
    sub0: integer;
    x: array of integer;
    y: array of integer;
    z: array of double;
    w: double;
    oneEdgeLong: array of double;  // 距离矩阵
    constructor Create(n: integer; vfff: TMain);
    destructor Destroy; override;
    procedure printPath;
    //procedure printOptimal;
    function init: integer;
    function main: integer;
    function dp_tsp(beginindex: integer; sub: integer): double;
  end;

implementation

uses
  Math;

constructor TDP.Create(n: integer; vfff: TMain);
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
  bestLength := 10000000;
  setlength(p, cityNum);
  setlength(oneEdgeLong, cityNum);

  setlength(power2, cityNum + 1);
  for i := 0 to cityNum do
    power2[i] := trunc(power(2, i));
end;

destructor TDP.Destroy;
var
  i: integer;
begin
  inherited;

end;

function TDP.init: integer;
var
  i, j, k, tij: integer;
  rij: double;
  line: string;
  www, qq: TStringList;
  // x: array of integer;
  // y: array of integer;
  // z: array of double;
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
    distance[i][i] := 0;  // 对角线为0
    fff.curdistance[i][i] := 0;

    for j := i + 1 to cityNum - 1 do
    begin
      // fff.curdistance[i][j] := -1.0;
      // w:=fff.curdistance[i][j];
      fff.distance[i][j] := -1.0;
      //   rij := sqrt(((x[i] - x[j]) * (x[i] - x[j]) + (y[i] - y[j]) * (y[i] - y[j])
      //  ) / 1.0) * fff.WeightsEdge[i][j] ;
      rij := sqrt(((x[i] - x[j]) * (x[i] - x[j]) + (y[i] - y[j]) *
        (y[i] - y[j])) / 1.0);
      if fff.distance[i][j] = -1.0 then
        //if 1=1 then
        //if w=  -1.0 then
      begin
        distance[i][j] := rij;
        distance[j][i] := distance[i][j];
        fff.curdistance[i][j] := distance[i][j];
        fff.curdistance[j][i] := distance[i][j];

      end
      else
      begin
        distance[i][j] := fff.distance[i][j];
        // +z[i]+z[j];
        // 不是 代替SQRT，否则仍然要乘以权数，自定义边长则不再乘权数乎
        distance[j][i] := distance[i][j];
        fff.curdistance[i][j] := distance[i][j];
        fff.curdistance[j][i] := distance[i][j];
      end;
    end;
  end;
  distance[cityNum - 1][cityNum - 1] := 0;
  fff.curdistance[cityNum - 1][cityNum - 1] := 0;
  // bestLength := 10000000;
  setlength(bestTour, cityNum + 1);

  // setlength(DP, 1, cityNum + 1 + cityNum);
  setlength(DP, power2[cityNum], cityNum + 1 + cityNum);
  s := '';
  for i := 0 to cityNum - 1 do
    s := s + '0';
  // DP[0][0] := s;
  DP[0][0] := 0;
  for i := 0 to cityNum - 1 do
  begin
    temps := s;
    // temps[i+1]:='1';

    DP[0][i + 1] := (distance[0][i + 1]);
    DP[0][i + 1 + cityNum] := 0;
  end;
end;

function TDP.main: integer;
var
  i: integer;
  s: string;
  a: double;
  ss: integer;
begin

  s := '0';
  for i := 1 to cityNum - 1 do
    s := s + '1';

  ss := trunc(power(2, cityNum - 1)) - 1;
  sub0 := ss;
  a := dp_tsp(0, ss);
  a := a + z[0];
  fff.mem_dyp_path.Lines.Add('总路长: ' + floattostr(a));
  printPath;
end;

//procedure TDP.printOptimal;
//var
//  i: integer;
//  www: tstringlist;
//  Atom: TAtom;
//  s: ShortString;
//  New: ITSPIndividual;
//begin
//  fff.mem_dyp_path.Lines.Add('================');
//  fff.mem_dyp_path.Lines.Add('总路长: ' + inttostr(bestLength));
//  fff.mem_dyp_path.Lines.Add('路径: ');
//  for i := 0 to cityNum - 1 do
//    fff.mem_dyp_path.Lines.Add(inttostr(bestTour[i]));
//  New := TTSPIndividual.Create(cityNum);
//  for i := 0 to cityNum - 1 do
//    New.RouteArray[i] := bestTour[i];
//  MainForm.R_ACO := New;
//  MainForm.Display.DrawMapWithRoute(New, 1);
//end;

procedure TDP.printPath;
var
  pre, Next, Count, L: integer;
  a, i, ss: integer;
  s, path5: string;
  pathlong: double;
begin

  fff.mem_dyp_path.Lines.Add('路径: ');
  bestTour[0] := 0;
  s := '0';
  for i := 1 to cityNum - 1 do
    s := s + '1';
  L := length(DP);
  Next := 0;
  a := 0;
  pathlong := 0;
  ss := trunc(power(2, cityNum - 1)) - 1;
  while 1 = 1 do
  begin
    // if pos('1', s) = 0 then
    if ss = 0 then
    begin
      pathlong := pathlong + distance[Next][0];
      oneEdgeLong[a] := distance[Next][0];
      break;
    end;
    // for i := 0 to L - 1 do
    begin
      // if trunc(DP[i][0]) = (ss) then
      begin
        Next := trunc(DP[ss][cityNum + Next]);
        pathlong := pathlong + distance[bestTour[a]][Next];
        oneEdgeLong[a + 1] := distance[bestTour[a]][Next];
        //fff.mem_dyp_path.Lines.Add( inttostr(bestTour[a])+'--'+inttostr(next)+'='+floattostr(distance[bestTour[a]][next]));
        a := a + 1;
        bestTour[a] := Next;
        // s[next + 1] := '0';
        ss := ss - trunc(power(2, cityNum - (Next + 1)));
        // break;
      end;
    end;

  end;
  // pathlong  okok
  path5 := 'www';
  for i := 0 to cityNum - 1 do
  begin
    // fff.mem_dyp_path.Lines.Add(inttostr(bestTour[i])+'::'+fff.Pcodes[bestTour[i]]+'='+floattostr(pathlong));
    //fff.mem_dyp_path.Lines.Add(inttostr(bestTour[i])+'::'+fff.Pcodes[bestTour[i]]+'='+floattostr(oneEdgeLong[i]));
    // fff.mem_dyp_path.Lines.Add(inttostr(bestTour[i])+'=='+fff.Pcodes[bestTour[i]]);
    // if (i mod 6)= 5 then
    //    path5:=path5+#13#10;
    path5 := path5 + '-->' + fff.Pcodes[bestTour[i]];
  end;
  path5 := stringreplace(path5, 'www-->', '', []);
  fff.mem_dyp_path.Lines.Add(path5);
  setlength(fff.bestTour, length(bestTour));
  for i := 0 to length(bestTour) - 1 do
    fff.bestTour[i] := bestTour[i];
end;

function TDP.dp_tsp(beginindex: integer; sub: integer): double;
var
  i, Value, L, subi, isexists, ismin: integer;
  isLast: boolean;
  // tmpsub: string;
  // subs: string;
  tmpsub: integer;
  subs: integer;
  test: integer;
  subdp, iresult, L0: double;
  // pr:TProgressBar;
begin
  // pr:= TProgressBar(vfff.FindComponent('ProgressBar3'));
  iresult := 0;
  isLast := True;
  isexists := -1;
  // L := length(DP);
  // for i := 0 to L - 1 do
  begin
    // if trunc(DP[i][0]) = (sub) then
    begin
      // if DP[i][beginindex] <> '' then
      iresult := (DP[sub][beginindex]);
      // isexists := i;
      // break;
    end;
  end;
  if trunc(iresult) = 0 then
  begin
    tmpsub := sub;
    iresult := 1000000000;
    // while 1 = 1 do
    for subi := cityNum - 1 downto 0 do
    begin
      if ((tmpsub and power2[subi]) = power2[subi]) then
      begin
        subs := sub;

        // subi := pos('1', tmpsub);
        // subi:=pos('1',subs);

        // tmpsub:=stringreplace(tmpsub,'1','0',[]);
        // if pr.Position=pr.Max-1 then
        // pr.Position:=1;
        // application.ProcessMessages;
        // 真他妈的多怪事，有上面一句则无法显示
        // pr.Position:=pr.Position+1;
        if sub0 = sub then
          // if 1=2 then
        begin
          //if ProgressBarPos = ProgressBarMax - 1 then
          //  ProgressBarPos := 0;
          //ProgressBarPos := ProgressBarPos + 1;
          ////ProgressBar.Position := ProgressBarPos;
          //// MainForm.Memo4.Lines.Add('pos='+inttostr(pr.Position));
          //application.ProcessMessages;
        end;
        // tmpsub[subi] := '0';
        /// 因为这是在循环中，所以用到此的，不能删的。
        // subs[subi] := '0';
        // tmpsub := tmpsub - power2[subi];
        // 上面的不必要了
        // subs := subs - power2[subi];
        // 上面的不用减法，改用位运算可乎
        test := subs - power2[subi];
        subs := subs and not power2[subi];
        // subi := (cityNum - subi);
        subdp := (dp_tsp((cityNum - subi) - 1, subs));
        L0 := distance[beginindex][(cityNum - subi) - 1] + subdp;
        // z[i] := (MainForm.Display.Controller.Cities[i].z);
        L0 := L0 + z[(cityNum - subi) - 1];
        if L0 < iresult then
        begin
          iresult := L0;
          ismin := (cityNum - subi) - 1;
        end;
      end;
    end;
    // if isexists <> -1 then
    begin
      DP[sub][beginindex] := (iresult);
      DP[sub][beginindex + cityNum] := (ismin);
    end;

  end;

  Result := iresult;

end;

end.
