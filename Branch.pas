unit Branch;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, TSPmain;

type
  TNode = record
    inPath: boolean;
    nextIndex: integer;

  end;

  TBranch = class(TComponent)
  private

  private
    cityNum: integer; // 城市数量

  private
    distance: array of array of double;  // 距离矩阵
  private
    bestLength: double; // 最佳长度
    bestRoad: string;
  private
    p: array of TNode; // 最佳路径
  private
    DP: array of array of double;  // 距离矩阵
  public
    fff: TMain;
    showinter: integer;
    bestTour: array of integer; // 最佳路径
    ProgressBarMax: integer;
    ProgressBarPOS: integer;
    ProgressBarPOS10: integer;
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
    function dp_tsp(lastindex: integer; path1: string; pathLen: double;
      path2: string): double;
  end;

implementation

uses
  Math;

constructor TBranch.Create(n: integer; vfff: TMain);
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

end;

destructor TBranch.Destroy;
var
  i: integer;
begin
  inherited;

end;

function TBranch.init: integer;
var
  i, j, k, tij, ii, jj: integer;
  rij, mindis, minlen: double;
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

  for i := 0 to cityNum - 1 do
  begin
    distance[i][i] := 0; // 对角线为0
    fff.curdistance[i][i] := 0;
    for j := i + 1 to cityNum - 1 do
    begin
      // rij := sqrt(((x[i] - x[j]) * (x[i] - x[j]) + (y[i] - y[j]) *
      //  (y[i] - y[j])) / 1.0)* fff.WeightsEdge[i][j] ;
      rij := sqrt(((x[i] - x[j]) * (x[i] - x[j]) + (y[i] - y[j]) *
        (y[i] - y[j])) / 1.0);
      fff.distance[i][j] := -1.0;
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
  setlength(bestTour, cityNum + 1);
  // if trim(MainForm.RzEdit1.Text) = '' then
  begin
    s := ',0,';
    if trim(fff.branch_edit.Text) = '' then
      bestLength := 0;
    // else
    if trim(fff.branch_edit.Text) <> '' then
      bestLength := strtofloat(trim(fff.branch_edit.Text));
    // 初始值可以为一切方法所得，如退火法，蚁群法等近似法，
    // 都可以为初始值。或者中断所得，可以下次作为初始值重新开始。
    for i := 1 to cityNum - 1 do
    begin
      s := s + IntToStr(i) + ',';
      bestLength := bestLength + distance[i - 1][i] + z[i];
    end;
    bestLength := bestLength + distance[cityNum - 1][0];
    bestRoad := s;

    s := ',0,';
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
      j := ii;
      jj := jj + 1;

      minlen := minlen + mindis + z[j];
      if jj = cityNum - 1 then
        break;
      // 上面两句位置互换，结果产生BUG，现更正。
    end;
    minlen := minlen + distance[j][0];
    if minlen < bestLength then
    begin
      bestLength := minlen;
      bestRoad := s;

    end;
    // 初始值可以为一切方法所得，如退火法，蚁群法等近似法，
    // 都可以为初始值。或者中断所得，可以下次作为初始值重新开始。
  end;
  // else
  // bestLength := strtofloat(trim(MainForm.RzEdit1.Text));
  //   fff.mem_branch.Lines.Add('总路长: ' + floattostr(bestLength+z[0]));
  //printPath;
end;

function TBranch.main: integer;
var
  i: integer;
  s, ss: string;
  a: double;
begin
  ss := ',';
  s := ',0,';
  for i := 1 to cityNum - 1 do
    ss := ss + IntToStr(i) + ',';
  showinter := 0;
  a := dp_tsp(0, s, 0, ss);
  fff.mem_branch.Lines.Add('总路长: ' + floattostr(bestLength + z[0]));
  printPath;
  {
    保留且改名穷举算法，新增翻译C++的分支法？看其代码，似不难翻译？
    那C代码只求出值，还未求出路径乎？

    不必翻译了，因为我对分支法已毫无兴趣，不打算将来深入了解此法。
    我感兴趣的其实是我自创的燃线分支穷举法，由此不必再劳累去翻译C了。

    将边长从小到大排序，只取前N个之前段，由此可以早些预测，是个改良方案。估计不会有很大提升乎？？？
    由于最后回0点，必最后者不小于0点最小边！
    由此产生先起点不再为0点。
    只计倒数两位最小边。
    如此穷举法又有小改动！！！
    动态变动剩余点的最小边排序之前段，正是分支法？
    又剩余点与2^n一样，又与动规相似？
    真的？
    排序者，n！，组合者，2^n，不同！

    path，别人C代码不用字符串分隔表示，而用结构体。
    别人C不用Tstringlist，而用C队列。
    这个确是编程要思考的事。
    m为已经过点为排列，m！，
    (n-m)为未经过点为组合，2^(n-m)

    最小值前段为下界，最大值前段为上界？
    由全局最大最小值，变成剩余点集的最大最小值而已！
    燃线法也可有初值相结合！
    但始终看不明别人C++分支法。
    确实我的自创算法仍可优化，但估计不会有太大的优化，不修改劳累了。
    理解别人的分支限界法确不容易。
    我自创算法的优化smart也是很有限的。
    不想改代码，又怕日后自已也忘记了，草
    如此很多方案的历史代码都要尝试，烦！
    务必在代码注释中写明，防日后忘记难找
    例如弗洛伊德算法证明我又忘记了！！！
    且难方便找回重看！！！
  }
end;

procedure TBranch.printOptimal;
begin

end;

procedure TBranch.printPath;
var
  pre, Next, Count, L: integer;
  a, i: integer;
  s: string;
  sss: TStringList;
  path5: string;
  pathlong: double;
begin

  fff.mem_branch.Lines.Add('路径: ');
  sss := TStringList.Create;
  sss.Delimiter := ',';
  sss.DelimitedText := bestRoad;
  a := 0;
  for i := 0 to sss.Count - 1 do
  begin
    if trim(sss[i]) <> '' then
    begin
      fff.mem_branch.Lines.Add(fff.Pcodes[StrToInt(trim(sss[i]))]);
      bestTour[a] := StrToInt(trim(sss[i]));
      a := a + 1;
    end;
  end;
  sss.Free;

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
  fff.mem_branch.Lines.Add(path5);
  setlength(fff.bestTour, length(bestTour));
  for i := 0 to length(bestTour) - 1 do
    fff.bestTour[i] := bestTour[i];
end;

function TBranch.dp_tsp(lastindex: integer; path1: string; pathLen: double;
  path2: string): double;
var
  i, Value, L, subi, isexists, ismin, j, curi: integer;
  isLast: boolean;
  tmpsub, subs, NewPath2: string;
  subdp, iresult: double;
  ss: TStringList;
begin
  j := 0;
  // iresult := 1000000000;
  ss := TStringList.Create;
  ss.Delimiter := ',';
  ss.DelimitedText := path2;
  // NewPath2 := ',';
  showinter := showinter + 1;
  if (showinter mod 100) = 0 then
  begin
    fff.path1.Caption := stringreplace(path1, ',', '-', [rfReplaceAll]);
    fff.path2.Caption := stringreplace(path2, ',', '-', [rfReplaceAll]);
    application.ProcessMessages;
  end;

  for i := ss.Count - 1 downto 0 do
  begin
    if trim(ss[i]) = '' then
    begin
      ss.Delete(i);
      continue;
    end;
    curi := StrToInt(ss[i]);
    // if 1 = 2 then
    begin
      //if ProgressBarPOS = ProgressBarMax - 1 then
      //  ProgressBarPOS := 0;
      //ProgressBarPOS := ProgressBarPOS + 1;
      //// ProgressBarPOS10 := ProgressBarPOS10 + 1;
      //// if ProgressBarPOS10 = 10 then
      //// if (ProgressBarPOS shr $04)=ProgressBarPOS then
      //if ((ProgressBarPOS shr 4) shl 4) = ProgressBarPOS then
      //begin
      //  ProgressBar.Position := ProgressBarPOS;
      //  // ProgressBarPOS10 := 0;
      //end;

      // MainForm.Memo4.Lines.Add('pos='+inttostr(pr.Position));
      application.ProcessMessages;
      if BranchStop then
      begin
        j := 1;
        break;
      end;
    end;
    // if pos(',' + inttostr(i) + ',', path1) > 0 then
    // continue;
    j := j + 1;
    // if lastindex = 0 then
    // application.ProcessMessages;

    if (pathLen + distance[lastindex][curi] + z[curi]) >= bestLength then
    begin
      ss.Delete(i);
      continue;
    end;

    // NewPath2 := NewPath2 + ss[i] + ',';
    // ss[i] := rightstr('00000' + ss[i], 5);
    ss[i] := Format('%5d', [curi]);
    // ss[i] := rightstr('0000000000' + Format('%f',
    // [pathLen + distance[lastindex][curi]]), 10) + '_' + ss[i];
    ss[i] := Format('%10.2f', [pathLen + distance[lastindex][curi] + z[curi]]) +
      '_' + ss[i];
    // bestLength := iresult;
    // bestRoad := ss;
    // pathAll := ss;
    // lasti:=i;
  end;

  ss.Sort;
  for i := 0 to ss.Count - 1 do
  begin // 这里如不注意用downto，不是最快而是最慢了，草
    if BranchStop then
    begin
      j := 1;
      break;
    end;
    ss[i] := rightstr(ss[i], 5);
    curi := StrToInt(ss[i]);
    // iresult :=
    dp_tsp(curi, path1 + ',' + IntToStr(curi) + ',',
      pathLen + distance[lastindex][curi] + z[curi],
      stringreplace(path2, ',' + IntToStr(curi) + ',', ',', []));
    // 不可以用 NewPath2！！！
    // if iresult >= bestLength then
    /// continue;
  end;
  ss.Free;
  // result := iresult;
  Result := 1000000000;
  if j = 0 then // 这里中断时有小BUG，不理。
  begin
    Result := pathLen + distance[lastindex][0];
    if (Result - bestLength) <= 0.001 then
    begin
      bestLength := Result;
      bestRoad := path1;
    end;

  end;

end;

end.
