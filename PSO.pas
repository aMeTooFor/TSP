unit PSO;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, TSPmain;

type
  TNode = record
    inPath: boolean;
    nextIndex: integer;
  end;

  TP3 = record
    x: Longint;
    y: Longint;
    z: Longint;
  end;

  TP3ARRAY = array of TP3;
  TPIARRAY = array of integer;
  TDARRAY = array of array of double;
  TIARRAY = array of TPIARRAY;
  TSARRAY = array of array of string;

  TPSO = class(Tcomponent)
  private
    distance: TDARRAY; // ¾àÀë¾ØÕó
  private
    cityNum: integer; // ³ÇÊÐÊýÁ¿
  private
    bestLength: double; // ×î¼Ñ³¤¶È
  private
    bestTour: array of integer; // ×î¼ÑÂ·¾¶
  private
    p: array of TNode; // ×î¼ÑÂ·¾¶
  private
    PSO_distance: TDARRAY; // ¾àÀë¾ØÕó
  public
    MaxLengthInteger: double;
    PSONum: integer; // Á£×Ó¸öÊý£¬ÕâÀïÎªÁË·½±ãÑÝÊ¾£¬ÎÒÃÇÖ»È¡Á½¸ö£¬¹Û²ìÆäÔË¶¯·½Ïò
    n: integer; // ³ÇÊÐÊýÁ¿
    allowedCities: Tstringlist;
    c1: double; // #define c1 2       //¸öÌåÑ§Ï°Òò×Óc1£º
    c2: double; // #define c2 2       //Éç»áÑ§Ï°Òò×Óc2£º
    gbest: double; // #define T  5000
    vmax: double; // ËÙ¶È×î´óÖµ//ÊÊÓ¦¶È¼ÆËãº¯Êý£¬Ã¿¸öÁ£×Ó¶¼ÓÐËüµÄÊÊÓ¦¶È
    M: integer; // Á£×Ó¸öÊý£¬ÕâÀïÎªÁË·½±ãÑÝÊ¾£¬ÎÒÃÇÖ»È¡Á½¸ö£¬¹Û²ìÆäÔË¶¯·½Ïò
    T: integer; // µü´ú´ÎÊýiter£º  #define RM RAND_MAX
    UP: double; // #define UP 0.45
    LOW: double; // #define LOW 0.35
    ws: double; // ¹ßÐÔÒò×Ó×î´óÖµws:
    w: double; // ¹ßÐÔÏµÊýw£º #define w 0.9
    we: double; // ¹ßÐÔÒò×Ó×îÐ¡Öµwe:
    AC: double; // ÈÏÖªÏµÊý£º   #define AC 0.5
    RM: double; // ²»ÊÇµü´ú´ÎÊýiter£º  #define RM RAND_MAX  Ëæ»úÊýµÄ×î´óÖµ £¬³ýÖ®ÎªÁËÈ¡Ð¡Êý
    Vv: double;
    iter: integer; // µü´ú´ÎÊýiter£º  #define RM RAND_MAX
    fff: TMAIN;

    ProgressBarMax: integer;
    ProgressBarPos: integer;
    power2: array of integer; // ×î¼ÑÂ·¾¶

    x: array of integer;
    y: array of integer;
    z: array of double;
    v: array of double;
    //w: double;
    oneEdgeLong: array of double;  // 距离矩阵
    pbest: array of double;
    fit: array of double;
    fcopy: array of double;
    popu: TIARRAY;
    popu_copy: TIARRAY;
    citysxyz: TP3ARRAY;
    Pbest_popu: TIARRAY;
    // Gbest_popu:array of double;
    Gbest_popu: TPIARRAY;
    constructor Create(PSONum0: integer; vfff: TMAIN; vlst: Tstringlist);
    destructor Destroy; override;
    procedure printOptimal;
    function init: integer;
    function _init: integer;
    function main: integer;
    function PSO: integer;
    procedure random_shuffle(PSONum0: integer; allowedCities0: Tstringlist);
    procedure Rand_popu;
    function fitness_alllength(cc: string; i: integer): double;
    function fitness_alllength000(cc: string; i: integer): double;
    function dis(ax, ay, bx, by: integer): double;

    procedure btupdate(); // ¸üÐÂ×îÓÅ½â
    procedure ppupdate(); // ¸üÐÂÎ»ÖÃ
    procedure CroPb(); // ×ÔÎÒÑ§Ï°
    procedure CroGb(); // Éç»áÑ§Ï°
    procedure mutation(); // ±äÒì
    procedure Cross(fat, mot: TPIARRAY; TT: integer; ffff: string); // ½»²æ
    function getpathlength(pathlist: Tstringlist): double;
    function remove_1(vvv: integer): integer;

  end;

  // var
  // distance: TDARRAY; // ¾àÀë¾ØÕó

implementation

uses
  Math;

constructor TPSO.Create(PSONum0: integer; vfff: TMAIN; vlst: Tstringlist);
var
  i, k, mm: integer;
  s: string;
begin
  inherited Create(vfff);
  // MaxLengthInteger := 2147483647;  //delphiÖÐDoubleËù±íÊ¾µÄÊýÖµ·¶Î§£¿
  MaxLengthInteger := 987654321098765; // delphiÖÐDoubleËù±íÊ¾µÄÊýÖµ·¶Î§£¿
  cityNum := PSONum0;
  fff := vfff;
  setlength(distance, cityNum, cityNum);
  setlength(fff.curdistance, cityNum, cityNum); ///
  setlength(fff.distance, cityNum, cityNum);  /////
  bestLength := 10000000;
  setlength(p, cityNum);
  setlength(oneEdgeLong, cityNum);
 setlength(bestTour, cityNum);
 setlength(fff.bestTour, cityNum);
  // bestLength := 10000000;
  bestLength := MaxLengthInteger;

  allowedCities := Tstringlist.Create;
  setlength(power2, cityNum + 1);
  for i := 0 to cityNum do
    power2[i] := trunc(power(2, i));
  // n:= strtoint(trim(vlst[0].Replace('citys=', '', [])));
  PSONum := strtoint(trim(vlst[0].Replace('PSOnum=', '', [])));
  n := cityNum;

  ws := strtoint(trim(vlst[1].Replace('PSOws=', '', []))) / 100.0; // ¹ßÐÔÒò×Ó×î´óÖµws:
  w := strtoint(trim(vlst[2].Replace('PSOw=', '', []))) / 100.0; // ¹ßÐÔÏµÊýw£º
  we := strtoint(trim(vlst[3].Replace('PSOwe=', '', []))) / 100.0; // ¹ßÐÔÒò×Ó×îÐ¡Öµwe:
  Vv := strtoint(trim(vlst[4].Replace('PSOVv=', '', []))) / 100.0; // ÈÏÖªÏµÊý£º
  c1 := strtoint(trim(vlst[5].Replace('PSOc1=', '', []))) / 100.0; // ¸öÌåÑ§Ï°Òò×Óc1£º
  c2 := strtoint(trim(vlst[6].Replace('PSOc2=', '', []))) / 100.0; // Éç»áÑ§Ï°Òò×Óc2£º
  iter := strtoint(trim(vlst[7].Replace('PSOiter=', '', []))); // µü´ú´ÎÊýiter£º
  AC := Vv;

  UP := ws;
  LOW := we;

  // gbest := 2147483647;
  mm := max(max(cityNum, n), iter); // Î´¸ãÇå£¬ÒÔ×î´óÖµÏÈÊÔÏÂ
  RM := mm; // Ëæ»úÊýµÄ×î´óÖµ £¬³ýÖ®ÎªÁËÈ¡Ð¡Êý
  T := iter;
  M := PSONum;
  // M:=1;//²âÊÔÓÃ
  // T:=1;//²âÊÔÓÃ

  setlength(fit, cityNum);
  setlength(pbest, cityNum);
  setlength(fcopy, cityNum);
  setlength(popu, M, cityNum);
  setlength(popu_copy, M, cityNum);
  setlength(Pbest_popu, M, cityNum);
  setlength(Gbest_popu, cityNum);


  // MaxLengthInteger:=2147483647;

  for k := 0 to cityNum - 1 do
    pbest[k] := MaxLengthInteger;
  gbest := MaxLengthInteger;

end;

destructor TPSO.Destroy;
var
  i: integer;
begin
  inherited;
end;

function TPSO.init: integer;
var
  i, j, k, tij: integer;
  rij: double;
  line: string;
  www, qq: Tstringlist;
  s, temps: string;
begin
  // ¼ÆËã¾àÀë¾ØÕó
  // £¬Õë¶Ô¾ßÌåÎÊÌâ£¬¾àÀë¼ÆËã·½·¨Ò²²»Ò»Ñù£¬´Ë´¦ÓÃµÄÊÇatt48×÷Îª°¸Àý£¬ËüÓÐ48¸ö³ÇÊÐ£¬¾àÀë¼ÆËã·½·¨ÎªÎ±Å·ÊÏ¾àÀë£¬×îÓÅÖµÎª10628
  setlength(x, cityNum);
  setlength(y, cityNum);
  setlength(z, cityNum);

  setlength(distance, cityNum, cityNum);

  for i := 0 to cityNum - 1 do
  begin
    x[i] := trunc(fff.Cities[i].x);
    y[i] := trunc(fff.Cities[i].y);
    z[i] := 0;// (fff.WeightsPoint[i]);  //test
    //z[i] :=  (fff.WeightsPoint[i]);  //test
  end;

  for i := 0 to cityNum - 1 do
  begin
    distance[i][i] := 0; // ¶Ô½ÇÏßÎª0
    fff.curdistance[i][i] := 0;
    for j := i + 1 to cityNum - 1 do
    begin
     // rij := sqrt(((x[i] - x[j]) * (x[i] - x[j]) + (y[i] - y[j]) * (y[i] - y[j])
     //   ) / 1.0) * fff.WeightEdge[i][j];
      rij := sqrt(((x[i] - x[j]) * (x[i] - x[j]) + (y[i] - y[j]) * (y[i] - y[j])
        ) / 1.0) ;
       fff.distance[i][j] := -1.0;
      if fff.distance[i][j] = -1.0 then
      begin
        distance[i][j] := rij + z[i];
        distance[j][i] := rij + z[j];
        fff.curdistance[i][j] := distance[i][j];
        fff.curdistance[j][i] := distance[i][j];

      end
      else
      begin
        distance[i][j] := fff.distance[i][j] + z[i];
        // ²»ÊÇ ´úÌæSQRT£¬·ñÔòÈÔÈ»Òª³ËÒÔÈ¨Êý£¬×Ô¶¨Òå±ß³¤Ôò²»ÔÙ³ËÈ¨Êýºõ
        distance[j][i] := fff.distance[i][j] + z[j];
        fff.curdistance[i][j] := distance[i][j];
        fff.curdistance[j][i] := distance[i][j];
      end;
    end;
  end;
  distance[cityNum - 1][cityNum - 1] := 0;
  fff.curdistance[cityNum - 1][cityNum - 1] := 0;
  // bestLength := 10000000;
  setlength(bestTour, cityNum);
  // setlength(PSO, 1, cityNum + 1 + cityNum);
  // setlength(PSO_distance, power2[cityNum], cityNum + 1 + cityNum);
  // s := '';
  // for i := 0 to cityNum - 1 do
  // s := s + '0';
  // // PSO[0][0] := s;
  // PSO_distance[0][0] := 0;
  // for i := 0 to cityNum - 1 do
  // begin
  // temps := s;
  // // temps[i+1]:='1';
  // PSO_distance[0][i + 1] := (distance[0][i + 1]);
  // PSO_distance[0][i + 1 + cityNum] := 0;
  // end;

end;

function TPSO._init: integer;
var
  k: integer;
begin
  // memset(Pbest,0x7f,sizeof(Pbest));
  // Gbest=2147483647;n=10;
  // for k := 0 to cityNum - 1 do
  // pbest[k] := 2147483647;
  // gbest := 2147483647;

  Rand_popu();
end;

function TPSO.PSO: integer;
var
  g, i, k: integer;
  rt: double;
  www: TP3;
begin
  for g := 1 to T do
  begin
    btupdate(); // ¸üÐÂ×îÓÅ½â

    for i := 0 to M - 1 do
      for k := 0 to cityNum - 1 do
        popu_copy[i][k] := popu[i][k];
    // ¸³¸øÖÐ¼ä±äÁ¿È¡½»²æ±äÒì
    ppupdate();
    // ½»²æ±äÒì
    for i := 0 to M - 1 do
    begin
      // www.x := popu_copy[i][0];
      // www.y := popu_copy[i][1];
      // www.z := 0;
      fcopy[i] := fitness_alllength('popu_copy', i);
      // fcopy[i]=fitness(popu_copy[i]);
    end;
    // ¼ÆËã½»²æ±äÒìºóµÄÊÊÓ¦¶È
    // ±È½Ï²¢¸üÐÂÎ»ÖÃ
    for i := 0 to M - 1 do
      if (fcopy[i] < fit[i]) then
      begin
        for k := 0 to cityNum - 1 do
          popu[i][k] := popu_copy[i][k];
        fit[i] := fcopy[i];
      end
      else
      begin
        rt := Random() / RM;
        if (rt <= AC) then
        begin
          for k := 0 to cityNum - 1 do
            popu[i][k] := popu_copy[i][k];
          fit[i] := fcopy[i];
        end;
      end;

  end;
end;

function TPSO.main: integer;
var
  i: integer;
begin
  _init();
  PSO();
  // for i := 0 to cityNum - 1 do
  // Gbest_popu[i]:=bestTour[i];
  printOptimal;
  // printPath;
end;

procedure TPSO.printOptimal;
var
  i: integer;
  www: Tstringlist;
  bestLengthwww: double;
  s: ShortString;
begin

  for i := 0 to cityNum - 1 do
    bestTour[i] := Gbest_popu[i];
  // www := Tstringlist.Create;
  // for i := 0 to cityNum - 1 do
  // www.Add(inttostr(bestTour[i]));
  // bestLengthwww := getpathlength(www);
  // bestLengthwww := gbest;
  // www.Free;

  // MainForm.PSOLine.Lines.Add('================');
  // MainForm.PSOLine.Lines.Add('×ÜÂ·³¤: ' + floattostr(bestLengthwww));
  fff.PSOLine.Lines.Add('总路长:: ' + floattostr(gbest));
  fff.PSOLine.Lines.Add('路径: ');
  for i := 0 to cityNum - 1 do
  begin
    if Gbest_popu[i] <> -1 then
      fff.PSOLine.Lines.Add(fff.pcodes[(Gbest_popu[i])]);
    if Gbest_popu[i] = -1 then
      fff.PSOLine.Lines.Add('P0');

  end;

  for i := 0 to cityNum - 1 do
  begin
    if bestTour[i] <> -1 then
      fff.bestTour[i] := bestTour[i];
    if bestTour[i] = -1 then
      fff.bestTour[i] := 0;

  end;
    fff.PSOLine.Lines.Add('总路长:: ' + floattostr(gbest));
end;

procedure TPSO.Rand_popu;
var
  i, j, k: integer;
begin
  for i := 0 to cityNum - 1 do
    allowedCities.Add(inttostr(i));
  for i := 0 to M - 1 do
  begin
    random_shuffle(cityNum - 1, allowedCities); // Ëæ»úÉú³ÉÈ«ÅÅÁÐ
    for k := 0 to cityNum - 1 do
      popu[i][k] := strtoint(allowedCities[k]);
    fit[i] := fitness_alllength('popu', i); // ¼ÆËãÉú³É½âµÄÊÊÓ¦Öµ
  end;
end;

function TPSO.dis(ax, ay, bx, by: integer): double;
begin
  result := sqrt(power(ax - bx, 2) + power(ay - by, 2));
end;

function TPSO.remove_1(vvv: integer): integer;
begin
  if vvv = -1 then
    vvv := 0;
  result := vvv;

end;

function TPSO.fitness_alllength(cc: string; i: integer): double;
// function TPSO.fitness_alllength000(cc: string; i: integer): double;
var
  len: double;
  sum: double;
  j: integer;
begin
  sum := 0;
  len := 0;
  for j := 0 to cityNum - 1 do
  begin
    // len := len + aco.distance[strtoint(tabu.Strings[i])][strtoint(tabu.Strings[i + 1])];
  end;
  if (cc = 'popu') then
  begin
    for j := 0 to cityNum - 2 do
      sum := sum + distance[remove_1(popu[i][j])][remove_1(popu[i][j + 1])];
    sum := sum + distance[remove_1(popu[i][cityNum - 1])][remove_1(popu[i][0])];
  end;
  if (cc = 'popu_copy') then
  begin
    for j := 0 to cityNum - 2 do
      sum := sum + distance[remove_1(popu_copy[i][j])
        ][remove_1(popu_copy[i][j + 1])];
    sum := sum + distance[remove_1(popu_copy[i][cityNum - 1])
      ][remove_1(popu_copy[i][0])];
  end;
  // result := len;
  // if sum>MaxLengthInteger then
  // application.ProcessMessages;
  // if sum<MaxLengthInteger then
  result := sum;

end;

// function TPSO.fitness_alllength(cc: string; i: integer): double;
function TPSO.fitness_alllength000(cc: string; i: integer): double;
var
  sum: double;
  j: integer;
begin
  sum := 0;
  if (cc = 'popu') then
  begin
    for j := 0 to cityNum - 2 do
      sum := sum + dis(x[(popu[i][j])], y[(popu[i][j])], x[(popu[i][j + 1])],
        y[(popu[i][j + 1])]);
    sum := sum + dis(x[(popu[i][0])], y[(popu[i][0])], x[(popu[i][cityNum - 1])
      ], y[(popu[i][cityNum - 1])]);

  end;
  if (cc = 'popu_copy') then
  begin
    for j := 0 to cityNum - 2 do
      sum := sum + dis(x[(popu_copy[i][j])], y[(popu_copy[i][j])],
        x[(popu_copy[i][j + 1])], y[(popu_copy[i][j + 1])]);
    sum := sum + dis(x[(popu_copy[i][0])], y[(popu_copy[i][0])],
      x[(popu_copy[i][cityNum - 1])], y[(popu_copy[i][cityNum - 1])]);
  end;
  result := sum;
end;

procedure TPSO.random_shuffle(PSONum0: integer; allowedCities0: Tstringlist);
var
  i, j: integer;
  k: string;
begin
  i := Random(PSONum0);
  j := i;
  while i = j do
    j := Random(PSONum0);
  k := allowedCities0[i];
  allowedCities0[i] := allowedCities0[j];
  allowedCities0[j] := k;

end;

procedure TPSO.ppupdate;
begin
  if (c1 <> 0.0) then
    CroPb();
  if (c2 <> 0.0) then
    CroGb();
  // ÕâÀïÊÇÒòÎªÈôÓÐÒ»¸öµÈÓÚÁãÔò±íÊ¾²»Ñ§Ï°
  mutation();
end;

procedure TPSO.btupdate;
var
  i, j, k: integer;
begin
  for i := 0 to M - 1 do
    if (fit[i] < pbest[i]) then
    begin
      pbest[i] := fit[i];
      for k := 0 to cityNum - 1 do
        Pbest_popu[i][k] := popu[i][k];
      if (pbest[i] < gbest) then
      begin
        gbest := pbest[i];
        for k := 0 to cityNum - 1 do
          Gbest_popu[k] := popu[i][k];
      end;
    end;
end;

procedure TPSO.CroPb;
var
  i, j, k: integer;
  r1, CroRate, rt: double;
begin
  for i := 0 to M - 1 do
  begin
    r1 := Random() / RM * (UP - LOW) + LOW;
    CroRate := c1 * r1;
    rt := Random() / RM;
    if (CroRate >= rt) then
      Cross(popu_copy[i], Pbest_popu[i], i, 'Pbest_popu');
  end;
end;

procedure TPSO.CroGb;
var
  i, j, k: integer;
  r2, CroRate, rt: double;
begin
  for i := 0 to M - 1 do
  begin
    r2 := Random() / RM * (UP - LOW) + LOW;
    CroRate := c2 * r2;
    rt := Random() / RM;
    if (CroRate >= rt) then
      Cross(popu_copy[i], Gbest_popu, i, 'Gbest_popu');
  end;
end;

procedure TPSO.Cross(fat, mot: TPIARRAY; TT: integer; ffff: string); // ½»²æ
var
  i, j, k: integer;
  cut_p1, cut_p2, idx: integer;
  flag: boolean;
  son: TPIARRAY;
begin
  // int son[M]={0};
  setlength(son, cityNum);
  for i := 0 to n - 1 do
    son[i] := -1;
  cut_p1 := Random(cityNum - 2) mod (cityNum - 2);
  // cut_p1:=cut_p1;
  cut_p2 := cut_p1 + Random(cityNum - cut_p1 - 1) mod (cityNum - cut_p1 - 1);
  // cut_p2:=cut_p2-1;
  // ÕÒÒ»¶ÎÐòÁÐ³öÀ´½»²æ
  // while (cut_p1 >= cut_p2) do
  begin
    // cut_p2 := Random(cityNum-1) mod (cityNum - 1);
    // cut_p2:=cut_p2-1;
  end;

  for i := cut_p1 to cut_p2 do
  begin
    // if fff='Gbest_popu' then //Pbest_popu
    son[i] := popu_copy[TT][i]; // son[i]=fat[i];

  end;

  if ffff = 'Pbest_popu' then
  begin
    // ½«Ã»ÓÐ½»²æ²¿·ÖÌæ»»»ØÀ´
    if (cut_p1 <> 0) then
    begin
      idx := -1;
      for i := 0 to cityNum - 1 do
      begin
        flag := true;
        for k := cut_p1 to cut_p2 do
          if (Pbest_popu[TT][i] = son[k]) then
          begin
            flag := false;
            break;
          end;
        if (flag) then
        begin
          idx := idx + 1;
          son[idx] := Pbest_popu[TT][i];
          if (idx = cut_p1 - 1) and (cut_p2 = cityNum - 1) then
            break
          else if (idx = cut_p1 - 1) then
            idx := cut_p2;
        end;

      end;
    end
    else if (cut_p2 <> cityNum - 1) then
    begin
      idx := cut_p2;
      for i := 0 to cityNum - 1 do
      begin
        flag := true;
        for k := cut_p1 to cut_p2 do
          if (Pbest_popu[TT][i] = son[k]) then
          begin
            flag := false;
            break;
          end;
        if (flag) then
        begin
          idx := idx + 1;
          son[idx] := Pbest_popu[TT][i];
          if (idx = cityNum - 1) then
            break;
        end;
      end;
    end;
  end;
  if ffff = 'Gbest_popu' then
  begin
    // ½«Ã»ÓÐ½»²æ²¿·ÖÌæ»»»ØÀ´
    if (cut_p1 <> 0) then
    begin
      idx := -1;
      for i := 0 to cityNum - 1 do
      begin
        flag := true;
        for k := cut_p1 to cut_p2 do
          if (Gbest_popu[i] = son[k]) then
          begin
            flag := false;
            break;
          end;
        if (flag) then
        begin
          idx := idx + 1;
          son[idx] := Gbest_popu[i];
          if (idx = cut_p1 - 1) and (cut_p2 = cityNum - 1) then
            break
          else if (idx = cut_p1 - 1) then
            idx := cut_p2;
        end;
      end;
    end
    else if (cut_p2 <> cityNum - 1) then
    begin
      idx := cut_p2;
      for i := 0 to cityNum - 1 do
      begin
        flag := true;
        for k := cut_p1 to cut_p2 do
          if (Gbest_popu[i] = son[k]) then
          begin
            flag := false;
            break;
          end;
        if (flag) then
        begin
          idx := idx + 1;
          son[idx] := Gbest_popu[i];
          if (idx = cityNum - 1) then
            break;
        end;
      end;
    end;
  end;
  for i := 0 to cityNum - 1 do
  begin
    // if son[i]<>-1 then
    popu_copy[TT][i] := son[i];
    if son[i] = -1 then
      application.ProcessMessages;
  end;

end;

procedure TPSO.mutation; // Ëæ»ú±äÒì
var
  MRate, r: double;
  i, p1, p2, www: integer;
begin

  MRate := w;
  for i := 0 to M - 1 do
  begin
    r := Random() / RM;
    if (r <= MRate) then
    begin
      p1 := Random(cityNum - 1) mod (cityNum - 1);
      p2 := Random(cityNum - 1) mod (cityNum - 1);
      while (p1 = p2) do
        p2 := Random(cityNum - 1) mod (cityNum - 1);
      // swap(popu_copy[i][p1],popu_copy[i][p2]);
      // swap²Ù×÷ÊµÏÖ½»»»Á½¸öÈÝÆ÷ÄÚËùÓÐÔªËØµÄ¹¦ÄÜ
      www := popu_copy[i][p1];
      popu_copy[i][p1] := popu_copy[i][p2];
      popu_copy[i][p2] := www;
    end;
  end;

end;

function TPSO.getpathlength(pathlist: Tstringlist): double;
var
  i, x1, y1, x2, y2, j, ii, jj: integer;
  sqr0, rij: double;
  www: string;
begin
  for ii := 0 to n - 1 do
  begin

    fff.curdistance[ii][ii] := 0;
    for jj := ii + 1 to n - 1 do
    begin
      //rij := sqrt(((fff.Cities[ii].x -
      //  fff.Cities[jj].x) *
      //  (fff.Cities[ii].x -
      //  fff.Cities[jj].x) +
      //  (fff.Cities[ii].y -
      //  fff.Cities[jj].y) *
      //  (fff.Cities[ii].y -
      //  fff.Cities[jj].y)) / 1.0) *
      //  fff.Weightedge[ii][jj];
       rij := sqrt(((fff.Cities[ii].x -
        fff.Cities[jj].x) *
        (fff.Cities[ii].x -
        fff.Cities[jj].x) +
        (fff.Cities[ii].y -
        fff.Cities[jj].y) *
        (fff.Cities[ii].y -
        fff.Cities[jj].y)) / 1.0) ;
        //fff.distance[ii][jj] := -1.0;
      if fff.distance[ii][jj] = -1.0 then
      begin
        fff.curdistance[ii][jj] := rij;
        fff.curdistance[jj][ii] := rij;
      end
      else
      begin

        fff.curdistance[ii][jj] :=
          fff.distance[ii][jj];
        fff.curdistance[jj][ii] :=
          fff.distance[ii][jj];
      end;
    end;
  end;

  fff.curdistance[n - 1][n - 1] := 0;

  sqr0 := 0;
  for ii := 0 to n - 2 do
  begin
    www := pathlist.Strings[ii];
    www := stringreplace(www, 'P', '', []);
    www := stringreplace(www, 'p', '', []);
    try
      i := strtoint(www);
    except
      for jj := 0 to n - 1 do
        if fff.pcodes[jj] = trim(pathlist.Strings[ii]) then
        begin
          i := jj;
          break;
        end;
    end;
    www := pathlist.Strings[ii + 1];
    www := stringreplace(www, 'P', '', []);
    www := stringreplace(www, 'p', '', []);

    try
      j := strtoint(www);
    except
      for jj := 0 to n - 1 do
        if fff.pcodes[jj] = trim(pathlist.Strings[ii + 1]) then
        begin
          j := jj;
          break;
        end;
    end;
    x1 := trunc(fff.Cities[i].x);
    y1 := trunc(fff.Cities[i].y);
    x2 := trunc(fff.Cities[j].x);
    y2 := trunc(fff.Cities[j].y);

    if fff.distance[i][j] = -1 then
      //sqr0 := sqr0 + sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)) *
          //fff.Weightedge[i][j]
      sqr0 := sqr0 + sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
    else
      sqr0 := sqr0 + fff.curdistance[i][j];

    sqr0 := sqr0;
  end;
  www := pathlist.Strings[0];
  www := stringreplace(www, 'P', '', []);
  www := stringreplace(www, 'p', '', []);
  try
    i := strtoint(www);
  except
    for jj := 0 to n - 1 do
      if fff.pcodes[jj] = trim(pathlist.Strings[0]) then
      begin
        i := jj;
        break;
      end;
  end;
  www := pathlist.Strings[n - 1];
  www := stringreplace(www, 'P', '', []);
  www := stringreplace(www, 'p', '', []);
  try
    j := strtoint(www);
  except
    for jj := 0 to n - 1 do
      if fff.pcodes[jj] = trim(pathlist.Strings[n - 1]) then
      begin
        j := jj;
        break;
      end;
  end;
  x1 := trunc(fff.Cities[i].x);
  y1 := trunc(fff.Cities[i].y);
  x2 := trunc(fff.Cities[j].x);
  y2 := trunc(fff.Cities[j].y);
  if fff.distance[i][j] = -1 then
  //sqr0 := sqr0 + sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)) *
      //fff.Weightedge[i][j]
  sqr0 := sqr0 + sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
  else
    sqr0 := sqr0 + fff.curdistance[i][j];

  for i := 0 to n - 1 do
    sqr0 := sqr0 + z[i];
  result := sqr0;

end;

end.

