{%RunFlags MESSAGES+}
unit TSPmain;

{$mode objfpc}{$H+}
//{$I lcl_defines.inc}
interface

uses
  Types, Math, StrUtils, DateUtils,
  LazFileUtils, LazUTF8, SpinEx,
  LResources, LCLStrConsts,
  Classes, SysUtils, DB, SQLDB, SQLite3Conn, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, LCLType, Menus,//,files;//System;
  lMessages, Variants, ButtonPanel, FPImage;

type

  { TMain }

  TMain = class(TForm)
    addOnePoint: TButton;
    alpha: TSpinEditEx;
    antNums: TSpinEditEx;
    antsHelp: TButton;
    beta: TSpinEditEx;
    btn_about: TButton;
    btn_ant_run: TButton;
    btn_createANT: TButton;
    Btn_edges: TButton;
    Btn_exit: TButton;
    btn_fireHelp: TButton;
    btn_GaHelpgenerateHelp: TButton;
    btn_gainit: TButton;
    btn_GaReRun: TButton;
    btn_importPoints: TButton;
    btn_info: TButton;
    btn_PSO_run: TButton;
    btn_seaLine: TButton;
    btn_seaLineFloorPoint: TButton;
    btn_seaLineFloorPoint1: TButton;
    btn_seaLineFloorPoint2: TButton;
    btn_seaLineLine: TButton;
    btn_sealine_test: TButton;
    btn_showGa: TButton;
    btn_subfire_run: TButton;
    Button1: TButton;
    Button3: TButton;
    CheckBox_showhint: TCheckBox;
    customLength: TButton;
    customLength_help: TButton;
    Delta: TSpinEditEx;
    Edit1: TEdit;
    exportPoints: TButton;
    exportPointsToSQLite: TButton;
    fireEdit1: TSpinEditEx;
    fireEdit2: TSpinEditEx;
    fireEdit3: TSpinEditEx;
    fireEdit4: TSpinEditEx;
    Fitness: TSpinEditEx;
    gMAX_GEN: TSpinEditEx;
    ImageList1: TImageList;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label4: TLabel;
    desktop_file: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MAX_GEN: TSpinEditEx;
    memo_seaLine: TMemo;
    mem_customlength: TMemo;
    mem_subfire: TMemo;
    onebyoneHelp: TButton;
    btn_BranchStop: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    PCROSS: TSpinEditEx;
    pheromone: TSpinEditEx;
    PMUTATE: TSpinEditEx;
    pointsXYpos: TButton;
    btn_LKHini: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button4: TButton;
    Button5: TButton;
    btn_dyp_run: TButton;
    btn_dyp_help: TButton;
    btn_branch_run: TButton;
    branch_edit: TEdit;
    OpenDialog2: TOpenDialog;
    POP_SIZE: TSpinEditEx;
    PSOc1: TSpinEditEx;
    PSOc2: TSpinEditEx;
    PSOhelp: TButton;
    PSOiter: TSpinEditEx;
    PSOLine: TMemo;
    PSOnum: TSpinEditEx;
    PSOVv: TSpinEditEx;
    PSOw: TSpinEditEx;
    PSOwe: TSpinEditEx;
    PSOws: TSpinEditEx;
    RadioBtn_calc: TRadioButton;
    RadioBtn_input: TRadioButton;
    RadioGroup3: TRadioGroup;
    refrash: TButton;
    hintPoint: TMenuItem;
    memo_guess: TMemo;
    path1: TLabel;
    Label3: TLabel;
    path2: TLabel;
    mem_GA: TMemo;
    mem_dyp_path: TMemo;
    mem_branch: TMemo;
    mem_ant: TMemo;
    Memo9: TMemo;
    memoPoint: TMenuItem;
    lineMenu: TPopupMenu;
    lineBeginEnd: TMenuItem;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    PageControl3: TPageControl;
    PageControl4: TPageControl;
    Panel_right: TPanel;
    refrash1: TButton;
    rho: TSpinEditEx;
    SaveDialog1: TSaveDialog;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    setpoints: TButton;
    setpoints1: TButton;
    shiftEdges: TToggleBox;
    shiftPoints: TToggleBox;
    TabSheet1: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabDyp: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TrayIcon1: TTrayIcon;
    updateMemo: TMenuItem;
    Linememo: TMenuItem;
    SQLTransaction2: TSQLTransaction;
    SQLTransaction3: TSQLTransaction;
    Image1: TImage;
    pMenu: TPopupMenu;
    ScrollBox1: TScrollBox;
    DataSource1: TDataSource;
    Memo_SaveToTxT: TMemo;
    Memo3: TMemo;
    ProgressBar1: TProgressBar;
    Shape1: TShape;
    Splitter1: TSplitter;
    SQLConnector1: TSQLConnector;
    SQLConnector2: TSQLConnector;
    SQLConnector3: TSQLConnector;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLQuery3: TSQLQuery;
    SQLtemp: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    OpenDialog1: Topendialog;
    delOnePoint: TMenuItem;
    procedure antsHelpClick(Sender: TObject);
    procedure btn_aboutClick(Sender: TObject);
    procedure Btn_about_spfaClick(Sender: TObject);
    procedure Btn_about_way111Click(Sender: TObject);
    procedure Btn_about_way1Click(Sender: TObject);
    procedure Btn_about_way2Click(Sender: TObject);
    procedure Btn_about_way3Click(Sender: TObject);
    procedure btn_ant_runClick(Sender: TObject);
    procedure btn_BranchStopClick(Sender: TObject);
    procedure btn_branch_runClick(Sender: TObject);
    procedure btn_createANTClick(Sender: TObject);
    procedure btn_dyp_helpClick(Sender: TObject);
    procedure btn_dyp_runClick(Sender: TObject);
    procedure btn_fireHelpClick(Sender: TObject);
    procedure btn_gainitClick(Sender: TObject);
    procedure btn_GaReRunClick(Sender: TObject);
    procedure btn_infoClick(Sender: TObject);
    procedure btn_importPointsClick(Sender: TObject);
    procedure Btn_exitClick(Sender: TObject);
    procedure btn_seaLineClick(Sender: TObject);
    procedure btn_seaLineFloorPointClick(Sender: TObject);
    procedure btn_seaLineLineClick(Sender: TObject);
    procedure btn_sealine_testClick(Sender: TObject);

    procedure btn_subfire_runClick(Sender: TObject);
    procedure btn_PSO_runClick(Sender: TObject);

    procedure btn_showGaClick(Sender: TObject);
    procedure btn_GaHelpgenerateHelpClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure customLengthClick(Sender: TObject);
    procedure customLength_helpClick(Sender: TObject);
    procedure delOnePointClick(Sender: TObject);
    procedure exportPointsClick(Sender: TObject);
    procedure exportPointsToSQLiteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure Label3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure onebyoneHelpClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure PageControl3Change(Sender: TObject);
    procedure pointsXYposClick(Sender: TObject);
    procedure PSOhelpClick(Sender: TObject);
    procedure ScrollBox1DragDrop(Sender, Source: TObject; X, Y: integer);
    procedure shiftPointsChange(Sender: TObject);
    procedure shiftPointsClick(Sender: TObject);
    procedure shiftEdgesClick(Sender: TObject);

    procedure btn_LKHiniClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure addOnePointClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure refreshClick(Sender: TObject);
    procedure emptyfreeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);

    procedure FormShow(Sender: TObject);

    procedure setpointsClick(Sender: TObject);
    procedure Shape1ChangeBounds(Sender: TObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure Shape1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure Shape1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure Shape1Paint(Sender: TObject);

    procedure shiftEdgesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure shiftPointsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure TrayIcon1Click(Sender: TObject);
    procedure updateMemoClick(Sender: TObject);

  private

  public
    isdebug: integer;
    alreadyLength: double;
    beginp, endp, FFF, ALLPATH2, MEMO2, ALLLength2: string;
    PPP: TStringList;
    ResultPathEdgesRed: TStringList;
    oriP: Tpoint;
    userclick: boolean;
    LabelsCaptions: TStringList;
    ///////////
    Cities: array of TPoint;
    Distance: array of array of double;
    curDistance: array of array of double;
    WeightsPoint: array of double;
    WeightsEdge: array of double;
    CityCount: integer;
    Pcodes: array of string;

    ///////////////////////
    bestTour: array of integer; // 最佳路径
    ///////////////////////////////
    function islink(): boolean;
    function link(vpa: string): boolean;
    function AllTree(curp, treePath: string; SQLConnector: TSQLConnector;
      Transaction: TSQLTransaction): boolean;
    function getFromTo(ecodePP, dirPP, pcode1PP, pcode2PP: string;
      var fromPP, toPP: string): boolean;
    function getFromTo_Li(ecodePP, dirPP, pcode1PP, pcode2PP: string;
      var fromPP, toPP: string; TTag: integer): boolean;

    function getLong(pa, pb: string): integer;
    function getECode(pa, pb: string): string;


    function getPcode(pcode: string): tshape;
    procedure refreshoneP(ccolor: string; pcode: string; iitime1000: integer;
      ccclred: TColor);
    procedure fromLabelcaption;
    procedure fromLabelcaptionC(onlyc: TColor);
    procedure AutorefreshALLP;
    procedure looktime(iitime1000: integer);
    procedure savetoLabelcaption;
    procedure groupcount;
    function DrawArrowAI(bpoint, epoint: tpoint): integer;  // 箭头在目标方
    function DrawArrow(bpoint, epoint: tpoint): integer;  // 箭头在目标方
    function Fill3poit(onep, twop, threep: tpoint): integer;  // 箭头在目标方
    function GetRecordCount(query: TSQLQuery): integer;
    function LocateOneField(query: TSQLQuery; oneField, fieldValue: string): integer;
    function LocateTwoField(query: TSQLQuery;
      Field1, Field2, value1, value2: string): integer;
    function GetTableAllString(query: TSQLQuery): string;
    function P_E_ListToArray(): string;
    function drawTSPpath(): integer;
    procedure refreshFromSQLite(Sender: TObject);
    procedure refreshFromLineList(Sender: TObject);
    procedure refreshFromTWOList(Sender: TObject);
    procedure refreshFromimportPoint(Sender: TObject);
    procedure refreshCityCountAndCitiexyFromPointList(Sender: TObject);
    function pcodeAndPointLineListFromSQL(): integer;
    function sealine000(minx, miny, maxx, maxy: integer): integer;
    function ifCross(pcodeA, pcodeB, pcodeC, pcodeD: string): boolean;
    function ifCrosswww(pcodeA, pcodeB, pcodeC, pcodeD: string): boolean;
    function getPcodeIndex(vpcode: string): integer;
    procedure sleepli(i: integer);
    function fromPcodeGetPoint(spcode: string): tpoint;
  end;

type
  //   TSmallPoint =
  //{$ifndef FPC_REQUIRES_PROPER_ALIGNMENT}
  //  packed
  //{$endif FPC_REQUIRES_PROPER_ALIGNMENT}
  //  record
  //      X,
  //      Y : SmallInt;
  //      end;
  //TlinePoint =
  //  {$ifndef FPC_REQUIRES_PROPER_ALIGNMENT}
  //  packed
  //  {$endif FPC_REQUIRES_PROPER_ALIGNMENT}
  //  record
  //  beginPcode: string;
  //  endPcode: string;
  //  direction: string;
  //  beginPoint: tpoint;
  //  endPoint: tpoint;
  //end;
  //PlinePoint =^TlinePoint;
  TlinePoint = class(TComponent)
  type





























  private
  protected
  public
    beginPcode: string;
    endPcode: string;
    direction: string;
    weightLine: string;
    beginPoint: tpoint;
    endPoint: tpoint;
    floor: integer;
  end;

  { TPsubpPoint }

  TPsubpPoint = class(TComponent)
  type




























  private
  protected
  public
    Pcode: string;
    subPcode: TStringList;
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TPointline = class(TComponent)
  type




























  private
  protected
  public
    pcode: string;
    pname: string;
    floor: integer;
    px: integer;
    py: integer;
  end;

var
  Main: TMain;
  // FC: TFC;
  userid: string;
  //demoid: string;
  dprid: string;
  AllPath, AllPath_: TStringList;
  tempList: TStringList;
  Origin: Tpoint;
  LineBeforeColor, LableBeforeColor, MyLineColor: TColor;
  mouseMoveCount, PCount, curPcount: integer;
  wwwname: string;
  shiftPointsB, shiftEdgesB: boolean;
  shiftPointsL, shiftEdgesL: TStringList;
  exitOut: boolean;
  isTest5Chain: integer; // 实例且改代码才可测五环肯普链涟漪
  isTest5ChainReturnOK: integer; // 实例且改代码才可测五环肯普链涟漪
  //////////////////
  shapeList: TFPList;//TPointerList;//TList;
  // shapeList: TList;//TPointerList;//TList;
  LineList: TFPList;//TPointerList;//TList;   // TlinePoint
  TPsubpPointList: TFPList;
  PointList: TFPList;//TPointerList;//TList;  //TPointline
  /////////////////////
  OnPainNoPainColor: boolean;
  online: TlinePoint;
  BranchStop: boolean;
  ttaco: TComponent;
  drawTSPpathLong: double;

implementation

uses  msgshow, u_points, msgshow2, u_edges, showPathTree, dp, branch,
  tfire, pso, aco, GA;
  {$R *.lfm}

  // {$R MessageDialogs.inc}   // 这种.inc，不是pas，不知如何直接引用

{ TMain }
function S_abc(A, B, C: TPoint): double;
var
  aa, bb, cc, s: double;
begin
  // 计算三边长度
  aa := Sqrt(Sqr(B.X - C.X) + Sqr(B.Y - C.Y)); // BC边长度
  bb := Sqrt(Sqr(A.X - C.X) + Sqr(A.Y - C.Y)); // AC边长度
  cc := Sqrt(Sqr(A.X - B.X) + Sqr(A.Y - B.Y)); // AB边长度

  // 计算半周长
  s := (aa + bb + cc) / 2;

  // 应用海伦公式计算面积
  Result := Sqrt(s * (s - aa) * (s - bb) * (s - cc));
end;

function isCross(A, B, C, D: TPoint): boolean;
var
  k1, b1, k2, b2, x, y: double;
begin
  Result := False;
  //if (S_abc(A, C, D) + S_abc(B, C, D)) = (S_abc(C, A, B) + S_abc(D, A, B)) then
  //   Result := True;
  if a.x <> b.x then
    k1 := (a.y - b.y) / (a.x - b.x)
  else
    k1 := 1;
  b1 := a.y - k1 * a.x;

  if c.x <> d.x then
    k2 := (c.y - d.y) / (c.x - d.x)
  else
    k2 := 1;
  b2 := c.y - k2 * c.x;
  if k1 <> k2 then
    x := (b2 - b1) / (k1 - k2)
  else
  if (((a.x = c.x) and (a.y = c.y)) or ((b.x = c.x) and (b.y = c.y)) or
    ((a.x = d.x) and (a.y = d.y)) or ((b.x = d.x) and (b.y = d.y))) then
    Result := True
  else
    Result := False;
  y := k1 * x + b1;

  if ((x > min(a.x, b.x)) and (x < max(a.x, b.x))) then
    if ((x > min(c.x, d.x)) and (x < max(c.x, d.x))) then
      if ((y > min(a.y, b.y)) and (y < max(a.y, b.y))) then
        if ((y > min(c.y, d.y)) and (y < max(c.y, d.y))) then
          Result := True;
  if (Result and (k1 <> k2)) then
    if (((a.x = c.x) and (a.y = c.y)) or ((a.x = d.x) and (a.y = d.y)) or
      ((b.x = c.x) and (b.y = c.y)) or ((b.x = d.x) and (b.y = d.y))) then
      Result := False;
end;


function isCross222(A, B, C, D: TPoint; www: string): boolean;
  //var
  // 计算叉积
  function crossProduct(a, b, c: TPoint): integer;
  begin
    Result := (b.X - a.X) * (c.Y - a.Y) - (b.Y - a.Y) * (c.X - a.X);
  end;

  // 判断点c是否在线段ab上
  function onSegment(a, b, c: TPoint): boolean;
  begin
    Result := (Min(a.X, b.X) <= c.X) and (c.X <= Max(a.X, b.X)) and
      (Min(a.Y, b.Y) <= c.Y) and (c.Y <= Max(a.Y, b.Y));
  end;

var
  d1, d2, d3, d4: integer;
begin
  // 计算四个叉积值
  d1 := crossProduct(A, B, C);
  d2 := crossProduct(A, B, D);
  d3 := crossProduct(C, D, A);
  d4 := crossProduct(C, D, B);

  // 判断两线段是否跨立
  if ((d1 * d2 < 0) and (d3 * d4 < 0)) then
    Result := True
  // 检查特殊情况（共线或端点相交）
  else if (d1 = 0) and onSegment(A, B, C) then
    Result := True
  else if (d2 = 0) and onSegment(A, B, D) then
    Result := True
  else if (d3 = 0) and onSegment(C, D, A) then
    Result := True
  else if (d4 = 0) and onSegment(C, D, B) then
    Result := True
  else
    Result := False;
end;

function chineseCharToInt10(const w: string): integer;
var
  i, len: integer;
  cur: integer;
  ws: widestring;
begin
  Result := 0;
  ws := WideString(w);
  len := Length(ws);
  i := 1;
  while i <= len do
  begin
    cur := Ord(ws[i]);
    Result := Result + cur;
    Inc(i);
  end;

end;

function isCross333(A, B, C, D, E: TPoint): boolean;

  // 计算叉积
  function CrossProduct(v1, v2: TPoint): double;
  begin
    Result := v1.X * v2.Y - v1.Y * v2.X;
  end;

  // 判断点P是否在线段AB上
  function IsPointOnSegment(P, A, B: TPoint): boolean;
  begin
    // 首先检查三点共线
    if CrossProduct(Point(B.X - A.X, B.Y - A.Y), Point(P.X - A.X, P.Y - A.Y)) <> 0 then
      Exit(False);

    // 然后检查P的坐标在A和B之间
    Result := (Min(A.X, B.X) <= P.X) and (P.X <= Max(A.X, B.X)) and
      (Min(A.Y, B.Y) <= P.Y) and (P.Y <= Max(A.Y, B.Y));
  end;

  // 判断线段AB与CD是否相交
  function SegmentsIntersect(A, B, C, D: TPoint): boolean;
  var
    d1, d2, d3, d4: double;
  begin
    d1 := CrossProduct(Point(C.X - A.X, C.Y - A.Y), Point(B.X - A.X, B.Y - A.Y));
    d2 := CrossProduct(Point(D.X - A.X, D.Y - A.Y), Point(B.X - A.X, B.Y - A.Y));
    d3 := CrossProduct(Point(A.X - C.X, A.Y - C.Y), Point(D.X - C.X, D.Y - C.Y));
    d4 := CrossProduct(Point(B.X - C.X, B.Y - C.Y), Point(D.X - C.X, D.Y - C.Y));

    // 跨立实验
    if ((d1 * d2) < 0) and ((d3 * d4) < 0) then
      Exit(True);

    // 检查端点是否在另一条线段上
    if IsPointOnSegment(A, C, D) or IsPointOnSegment(B, C, D) or
      IsPointOnSegment(C, A, B) or IsPointOnSegment(D, A, B) then
      Exit(True);

    Result := False;
  end;

  // 判断点P是否在三角形CDE内
  function IsPointInTriangle(P: TPoint): boolean;
  var
    d1, d2, d3: double;
    hasNeg, hasPos: boolean;
  begin
    d1 := CrossProduct(Point(C.X - P.X, C.Y - P.Y), Point(D.X - P.X, D.Y - P.Y));
    d2 := CrossProduct(Point(D.X - P.X, D.Y - P.Y), Point(E.X - P.X, E.Y - P.Y));
    d3 := CrossProduct(Point(E.X - P.X, E.Y - P.Y), Point(C.X - P.X, C.Y - P.Y));

    hasNeg := (d1 < 0) or (d2 < 0) or (d3 < 0);
    hasPos := (d1 > 0) or (d2 > 0) or (d3 > 0);

    Result := not (hasNeg and hasPos);
  end;

begin
  // 1. 检查线段AB是否与三角形的任何边相交
  if SegmentsIntersect(A, B, C, D) or SegmentsIntersect(A, B, D, E) or
    SegmentsIntersect(A, B, E, C) then
    Exit(True);

  // 2. 检查线段端点是否在三角形内
  if IsPointInTriangle(A) or IsPointInTriangle(B) then
    Exit(True);

  // 3. 都不满足则不相交
  Result := False;
end;

function Int10TochineseChar(int10: string): string;
var
  i, len: integer;
  ws: widestring;
begin
  ws := '';
  i := 1;
  len := Length(int10);
  while i < len do
  begin
    ws := ws + widechar(StrToInt(int10));
    i := i + 4;
  end;
  Result := ansistring(ws);
end;

function GetAveCharSize(Canvas: TCanvas): TPoint;
begin
  Result.x := Canvas.TextWidth('X');
  Result.y := Canvas.TextHeight('X');
end;

type
  TDummyEditList = array of TEdit;
  PDummyEditList = ^TDummyEditList;

  TDummyForInput = class(TForm)
  public
    FEditsPtr: PDummyEditList;
    FOnCloseEvent: TInputCloseQueryEvent;
    procedure FOnClick(Sender: TObject);
  end;

procedure TDummyForInput.FOnClick(Sender: TObject);
var
  Cfm: boolean;
  Str: array of string;
  i: integer;
begin
  Cfm := True;
  if Assigned(FOnCloseEvent) then
  begin
    SetLength(Str, Length(FEditsPtr^));
    for i := 0 to Length(Str) - 1 do
      Str[i] := FEditsPtr^[i].Text;
    FOnCloseEvent(nil, Str, Cfm);
  end;
  if Cfm then
    ModalResult := mrOk;
end;

function _InputQueryActiveMonitor: TMonitor;
begin
  if Screen.ActiveCustomForm <> nil then
    Result := Screen.ActiveCustomForm.Monitor
  else
  if Application.MainForm <> nil then
    Result := Application.MainForm.Monitor
  else
    Result := Screen.PrimaryMonitor;
end;
//function InputQuery(const ACaption, APrompt : string; var Value : string) : Boolean;
function InputQueryLi(const ACaption: string; const APrompts: array of string;
  var AValues: array of string; ACloseEvent: TInputCloseQueryEvent): boolean;
var
  FPanels: array of TPanel;
  FEdits: array of TEdit;
  FLabels: array of TPanel;
  FButtons: TButtonPanel;
  FForm: TDummyForInput;
  Len, NSpacing, NEditWidth, i: integer;

  function GetPromptCaption(const APrompt: string): string;
  begin
    Result := APrompt;
    if (Result <> '') and (Result[1] < ' ') then
      Delete(Result, 1, 1);
  end;

  function GetPasswordChar(const APrompt: string): char;
  begin
    if (APrompt <> '') and (APrompt[1] < ' ') then
      Result := '*'
    else
      Result := #0;
  end;

begin
  Result := False;
  if Length(APrompts) < 1 then
    raise EInvalidOperation.Create('InputQuery: prompt array cannot be empty');
  if Length(APrompts) > Length(AValues) then
    raise EInvalidOperation.Create(
      'InputQuery: prompt array length must be <= value array length');

  Len := Length(AValues);
  SetLength(FPanels, Len);
  SetLength(FLabels, Len);
  SetLength(FEdits, Len);

  FForm := TDummyForInput.CreateNew(nil);
  try
    //FForm.Width:= FForm.Scale96ToForm(600);
    FForm.Width := FForm.Scale96ToForm(800);
    FForm.Height := FForm.Scale96ToForm(400);
    FForm.BorderStyle := bsDialog;
    FForm.Position := poScreenCenter;
    FForm.Caption := ACaption;
    FForm.FOnCloseEvent := ACloseEvent;

    NSpacing := FForm.Scale96ToForm(cInputQuerySpacingSize);
    NEditWidth := Max(FForm.Scale96ToForm(cInputQueryEditSizePixels),
      _InputQueryActiveMonitor.Width * cInputQueryEditSizePercents div 100);

    FButtons := TButtonPanel.Create(FForm);
    FButtons.Parent := FForm;
    FButtons.ShowButtons := [pbOK, pbCancel];
    FButtons.ShowBevel := False;
    FButtons.OKButton.OnClick := @FForm.FOnClick;
    FButtons.OKButton.ModalResult := mrNone;

    for i := 0 to Len - 1 do
    begin
      FPanels[i] := TPanel.Create(FForm);
      FPanels[i].Parent := FForm;
      FPanels[i].Align := alTop;
      FPanels[i].BevelInner := bvNone;
      FPanels[i].BevelOuter := bvNone;
      FPanels[i].AutoSize := True;
      FPanels[i].BorderSpacing.Around := NSpacing;

      //fix order of panels
      if i > 0 then
        FPanels[i].Top := FPanels[i - 1].Top + 10;

      FEdits[i] := TEdit.Create(FForm);
      FEdits[i].Parent := FPanels[i];
      FEdits[i].Align := alRight;
      FEdits[i].Width := NEditWidth;
      FEdits[i].Text := AValues[i];
      if i < Length(APrompts) then
        FEdits[i].PasswordChar := GetPasswordChar(APrompts[i]);

      FLabels[i] := TPanel.Create(FForm);
      FLabels[i].Parent := FPanels[i];
      FLabels[i].Align := alRight;
      FLabels[i].BevelInner := bvNone;
      FLabels[i].BevelOuter := bvNone;
      if i < Length(APrompts) then
        FLabels[i].Caption := GetPromptCaption(APrompts[i]);
      FLabels[i].BorderSpacing.Right := NSpacing;
      FLabels[i].Width := FLabels[i].Canvas.TextWidth(FLabels[i].Caption);

      FEdits[i].Left := FForm.Width; // place edits to right
    end;

    FButtons.Align := alTop;
    FButtons.Top := FPanels[Len - 1].Top + 10; // place buttons to bottom

    FForm.AutoSize := True;
    FForm.ActiveControl := FEdits[0];
    FForm.FEditsPtr := @FEdits;

    Result := FForm.ShowModal = mrOk;
    if Result then
      for i := 0 to Len - 1 do
        AValues[i] := FEdits[i].Text;
  finally
    FreeAndNil(FForm);
  end;
end;

function InputQueryLiMemo(const ACaption: string; const APrompts: string;
  ACloseEvent: TInputCloseQueryEvent): boolean;
var
  Fmemo: Tmemo;
  FButtons: TButtonPanel;
  FForm: TDummyForInput;
  Len, NSpacing, NEditWidth, i: integer;
  FPanel: TPanel;

  function GetPromptCaption(const APrompt: string): string;
  begin
    Result := APrompt;
    if (Result <> '') and (Result[1] < ' ') then
      Delete(Result, 1, 1);
  end;

begin
  Result := False;


  FForm := TDummyForInput.CreateNew(nil);
  try
    //FForm.Width:= FForm.Scale96ToForm(600);
    FForm.Width := 600;//FForm.Scale96ToForm(800);
    FForm.Height := 400;//FForm.Scale96ToForm(400);
    FForm.BorderStyle := bsDialog;
    FForm.Position := poScreenCenter;
    FForm.Caption := ACaption;
    FForm.FOnCloseEvent := ACloseEvent;

    //NSpacing:= FForm.Scale96ToForm(cInputQuerySpacingSize);
    //NEditWidth:= Max(
    //  FForm.Scale96ToForm(cInputQueryEditSizePixels),
    //  _InputQueryActiveMonitor.Width * cInputQueryEditSizePercents div 100);

    FButtons := TButtonPanel.Create(FForm);
    FButtons.Parent := FForm;
    FButtons.ShowButtons := [pbOK, pbCancel];
    FButtons.ShowBevel := False;
    FButtons.OKButton.OnClick := @FForm.FOnClick;
    FButtons.OKButton.ModalResult := mrNone;

    FPanel := TPanel.Create(FForm);
    FPanel.Parent := FForm;
    FPanel.Align := alClient;//alTop;
    FPanel.BevelInner := bvNone;
    FPanel.BevelOuter := bvNone;
    //FPanel.AutoSize:= true;
    //FPanel.BorderSpacing.Around:= NSpacing;

    Fmemo := tmemo.Create(FForm);
    Fmemo.Parent := FPanel;
    Fmemo.Align := alClient;
    //Fmemo.Width:= NEditWidth;
    Fmemo.Text := APrompts;
    //Fmemo.Height:= 100;
    Fmemo.ScrollBars := ssBoth;
    //Fmemo.Left:= FForm.Width; // place edits to right


    FButtons.Align := alBottom;//alTop;
    FButtons.Top := FForm.Top + 10; // place buttons to bottom
    //FButtons.Height:= 80;
    //FForm.AutoSize:= true;
    FForm.ActiveControl := Fmemo;
    //FForm.FEditsPtr:= @FEdits;

    Result := FForm.ShowModal = mrOk;

  finally
    FreeAndNil(FForm);
  end;
end;

function InputQueryLiImage(const ACaption: string; const APrompts: string;
  imgFileName: string; ACloseEvent: TInputCloseQueryEvent): boolean;
var
  Fmemo: Tmemo;
  FButtons: TButtonPanel;
  FForm: TDummyForInput;
  Len, NSpacing, NEditWidth, i: integer;
  FPanel, FPanelimage: TPanel;
  img: Timage;

  function GetPromptCaption(const APrompt: string): string;
  begin
    Result := APrompt;
    if (Result <> '') and (Result[1] < ' ') then
      Delete(Result, 1, 1);
  end;

begin
  Result := False;


  FForm := TDummyForInput.CreateNew(nil);
  try
    //FForm.Width:= FForm.Scale96ToForm(600);
    FForm.Width := 500;//600;//FForm.Scale96ToForm(800);
    FForm.Height := 800;//FForm.Scale96ToForm(400);
    FForm.BorderStyle := bsDialog;
    FForm.Position := poScreenCenter;
    FForm.Caption := ACaption;
    FForm.FOnCloseEvent := ACloseEvent;

    //NSpacing:= FForm.Scale96ToForm(cInputQuerySpacingSize);
    //NEditWidth:= Max(
    //  FForm.Scale96ToForm(cInputQueryEditSizePixels),
    //  _InputQueryActiveMonitor.Width * cInputQueryEditSizePercents div 100);

    FButtons := TButtonPanel.Create(FForm);
    FButtons.Parent := FForm;
    FButtons.ShowButtons := [pbOK, pbCancel];
    FButtons.ShowBevel := False;
    FButtons.OKButton.OnClick := @FForm.FOnClick;
    FButtons.OKButton.ModalResult := mrNone;
    FPanelimage := TPanel.Create(FForm);
    FPanelimage.Parent := FForm;
    FPanelimage.Align := alTop;
    FPanelimage.BevelInner := bvNone;
    FPanelimage.BevelOuter := bvNone;
    FPanelimage.AutoSize := True;
    //FPanelimage.BorderSpacing.Around:= NSpacing;
    //image1.Parent:= FPanelimage;
    //image1.Align:= alClient;//alTop;
    img := Timage.Create(FForm);
    //img.Picture.Bitmap.LoadFromFile(imgFileName);
    img.Parent := FPanelimage;
    img.Picture.LoadFromFile(imgFileName);
    img.AutoSize := True;
    FPanelimage.Height := img.Height;
    //FPanelimage.Height:=300;

    FPanel := TPanel.Create(FForm);
    FPanel.Parent := FForm;
    FPanel.Align := alClient;//alTop;
    FPanel.BevelInner := bvNone;
    FPanel.BevelOuter := bvNone;
    //FPanel.AutoSize:= true;
    //FPanel.BorderSpacing.Around:= NSpacing;

    Fmemo := tmemo.Create(FForm);
    Fmemo.Parent := FPanel;
    Fmemo.Align := alClient;
    //Fmemo.Width:= NEditWidth;
    Fmemo.Text := APrompts;
    //Fmemo.Height:= 100;
    Fmemo.ScrollBars := ssBoth;
    //Fmemo.Left:= FForm.Width; // place edits to right


    FButtons.Align := alBottom;//alTop;
    FButtons.Top := FForm.Top + 10; // place buttons to bottom
    //FButtons.Height:= 80;
    //FForm.AutoSize:= true;
    FForm.ActiveControl := Fmemo;
    //FForm.FEditsPtr:= @FEdits;

    Result := FForm.ShowModal = mrOk;

  finally
    FreeAndNil(FForm);
  end;
end;

procedure TMain.FormShow(Sender: TObject);
var
  ii, i, j: integer;
  www: ticon;
begin
  wwwname := '开发者：三界火宅人/开源(元)盛世/阴汁成世 ';

  //wwwname := '开发者：窗明几净~天气几好^几何原本^欧几里得 ';
  //wwwname := '开发者：无人知/路人知/反枝苋/茼蒿/开源盛世 ';
  // wwwname := '作者：无人知/无人不知/街知巷闻/路人知/路人皆知';
  // wwwname := '作者：FastLine/快来/快线';
  // wwwname := '作者：反枝苋/茼蒿/开源盛世/阴汁成世';
  //窗明几净~天气几好^几何原本^欧几里得
  wwwname := wwwname + ' https://github.com/aMeTooFor/TSP';
  wwwname := wwwname + ' 广东吴川梅菉';
  self.Caption := 'TSP算法小软件V9.0  2026年3月 ' + wwwname;
  Application.Title := self.Caption;
  // 四色定理染色算法小软件Version1.11        2025.6.13     开发者：不是我/不是我干的，和我无关/与我无关，身无分文/心无罣碍，路人甲/打酱油
  userid := '1';
  //demoid := '2';
  dprid := userid;

  self.Hint := 'OnShow' + self.Hint;
  main.SQLConnector1.connected := True;
  main.SQLTransaction1.Active := True;
  frmpoints.SQLConnector1.connected := False;
  frmpoints.SQLTransaction1.Active := False;
  frmedges.SQLConnector1.connected := False;
  frmedges.SQLTransaction1.Active := False;
  image1.Picture.LoadFromFile(extractfilepath(ParamStr(0)) + '用户地图.jpg');
  //又是怪事，如果不存在“用户地图”，不是提示找不到的报错，而是不知报什么错
  //self.WindowState:=wsMaximized;
  //application.ProcessMessages;
  //  首先在Lazarus的lfm中设置窗体的WindowState:= wsFullScreen;//   wsMaximized;
  //再代码在form.show中如下写，才可以象正常的wsMaximized;
  //如此怪诞，只能讲是经验，找不到如何解释，映像人生，为何会怪，因为正路无法正常，就会怪了，非代码不正也
  //  底图要自拍照天空大海，勿用网上的，以免到时出～～～～
  // self.WindowState:=wsFullScreen;
  // ii := GetTickCount64;
  // while ((GetTickCount64 - ii) < 2500) do
  //   Application.ProcessMessages;
  //self.WindowState:=wsMaximized;
  // application.ProcessMessages;
  // refrash.Click;

  //self.WindowState:=wsMaximized;
  //application.ProcessMessages;
  // self.Icon:=
  //www:=ticon.Create;
  //www:=self.TrayIcon1.Icon;
  //for i:=0 to www.Canvas.Width-1 do
  //  for j:=0 to www.canvas.Height-1 do
  //for i:=0 to 555 do
  //  for j:=0 to 555 do
  // self.Icon.Canvas.TextOut(1,1,'wwwwwwwwwww');
  //application.Title:='www';
  //self.icon.LoadFromFile('TSP.ico');
  //application.icon:=self.Icon;

  // if 1=2 then
  begin
    desktop_file.Text := stringreplace(desktop_file.Text,
      '/media/w/data/日记类/TSP_ubuntu_Lazarus/', extractfilepath(ParamStr(0)),
      [rfReplaceAll]);
    desktop_file.Lines.SaveToFile('/home/w/.local/share/applications/TSP.desktop');
  end;

end;



procedure TMain.setpointsClick(Sender: TObject);
begin
  u_points.frmPoints.ShowModal;
  refrash.Click;
end;

procedure TMain.Shape1ChangeBounds(Sender: TObject);
begin

end;

procedure TMain.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  //if ((x> tshape(Sender).Left) and (x<(tshape(Sender).Left+tshape(Sender).Width))) then
  // if ((y> tshape(Sender).top) and (y<(tshape(Sender).top+tshape(Sender).Height))) then
  tshape(Sender).Tag := (x) * 100000 + (y);
end;

procedure TMain.Shape1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
var
  x0, y0, L0, T0: integer;
  i, j, k: integer;
  //www: tshape;
  pcode1, pcode2: string;
  pcode1Shape, pcode2Shape: Tshape;
  pcode1Pointer, pcode2Pointer: Tpoint;
  pline: TlinePoint;
begin
  if tshape(Sender).Tag < 100000 then exit;
  x0 := trunc(tshape(Sender).Tag div 100000);
  y0 := tshape(Sender).Tag - x0 * 100000;
  L0 := tshape(Sender).left;
  T0 := tshape(Sender).top;
  tshape(Sender).Left := tshape(Sender).left + x - x0;
  //tshape(Sender).Left :=  x - x0;
  tshape(Sender).top := tshape(Sender).top + y - y0;
  //tshape(Sender).top := y - y0;
  //tshape(Sender).Tag := x * 100000 + y;

  //SQLQuery1.Close;
  //SQLQuery1.SQL.Text := 'select * from edges where relation=1 and (pcode1=''' +
  //  tshape(Sender).Name + ''' or pcode2=''' + tshape(Sender).Name +
  //  ''') and dprid=' + dprid;
  //self.SQLQuery1.Open;
  //SQLQuery1.First;
  //while not SQLQuery1.EOF do
  //begin
  //  pcode1 := SQLQuery1.FieldByName('pcode1').AsString;
  //  pcode2 := SQLQuery1.FieldByName('pcode2').AsString;
  //  if pcode1 = tshape(Sender).Name then
  //    pcode1Shape := tshape(Sender)
  //  else
  //    pcode1Shape := getpcode(pcode1);
  //  if pcode2 = tshape(Sender).Name then
  //    pcode2Shape := tshape(Sender)
  //  else
  //    pcode2Shape := getpcode(pcode2);
  //  pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
  //  pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
  //  pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
  //  pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
  //  //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);
  //  self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok
  //  pline := TlinePoint.Create(nil);
  //  pline.beginPcode := pcode1;
  //  pline.endPcode := pcode2;
  //  pline.direction := 'from1to2';
  //  pline.beginPoint := pcode1Pointer;
  //  pline.endPoint := pcode2Pointer;
  //  linelist.Add(pline);
  //  SQLQuery1.Next;
  //end;
  ////SQLQuery1.Close;
  for i := TPsubpPointList.Count - 1 downto 0 do
  begin
    try
      if (TPsubpPointList.Items[i]) <> nil then
      begin
        if TPsubpPoint(TPsubpPointList.Items[i]).Pcode = tshape(Sender).Name then
        begin

          for j := 0 to TPsubpPoint(TPsubpPointList.Items[i]).subPcode.Count - 1 do
          begin
            pcode1 := tshape(Sender).Name;
            pcode2 := TPsubpPoint(TPsubpPointList.Items[i]).subPcode[j];
            pcode1Shape := tshape(Sender);
            pcode2Shape := getpcode(pcode2);

            pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
            pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
            //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

            pcode1Pointer.x := L0 + (pcode1Shape.Width div 2);
            pcode1Pointer.y := T0 + (pcode1Shape.Height div 2);
            //ScrollBox1.Canvas.Brush.Color := clred;//clForm;//ScrollBox1.Color;
            ScrollBox1.Canvas.pen.Color := clForm;//clForm;//clblack;  clDefault
            ScrollBox1.Canvas.pen.Mode := pmMerge;
            self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok

            pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
            pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);

            //ScrollBox1.Canvas.Brush.Color := clwhite;//clblack;
            ScrollBox1.Canvas.pen.Color := clblack;//clblack;
            ScrollBox1.Canvas.pen.Mode := pmCopy;
            self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok




            pline := TlinePoint.Create(nil);
            pline.beginPcode := pcode1;
            pline.endPcode := pcode2;
            pline.direction := 'from1to2';
            pline.beginPoint := pcode1Pointer;
            pline.endPoint := pcode2Pointer;
            linelist.Add(pline);
            if 1 = 2 then
              for k := 0 to linelist.Count - 1 do
              begin
                if ((TlinePoint(linelist.Items[k]).beginPcode = tshape(Sender).Name) or
                  (TlinePoint(linelist.Items[k]).endPcode = tshape(Sender).Name)) then
                begin
                  if not ((TlinePoint(linelist.Items[k]).beginPoint =
                    pline.beginPoint) and
                    (TlinePoint(linelist.Items[k]).endPoint = pline.endPoint)) then
                  begin
                    self.ScrollBox1.Canvas.Brush.Color := ScrollBox1.Color;
                    self.ScrollBox1.Canvas.Line(TlinePoint(linelist.Items[k]).beginPoint,
                      TlinePoint(linelist.Items[k]).endPoint);  //ok

                  end;
                end;

              end;
          end;
          break;
        end;
      end;
    except
    end;
    application.ProcessMessages;
  end;
end;

procedure TMain.Shape1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  x0, y0, xycenter: integer;
  p, t: tpoint;
  ii, i: integer;
  cc: tcolor;
begin
  if tshape(Sender).Tag < 100000 then exit;
  application.ProcessMessages;
  x0 := trunc(tshape(Sender).Tag div 100000);
  y0 := tshape(Sender).Tag - x0 * 100000;
  xycenter := StrToInt(edit1.Text) div 2;   //15
  tshape(Sender).Tag := 0;
  if pointlist.Count = 0 then
  begin
    SQLTransaction1.Active := True;
    //SQLQuery1.Close;
    //SQLQuery1.SQL.Text := 'select * from points where pcode=''' + tshape(
    //  Sender).Name + ''' and dprid=' + dprid;
    //self.SQLQuery1.Open;
    //if SQLQuery1.RecordCount = 1 then
    //begin
    //  SQLQuery1.edit;
    //  //SQLQuery1.FieldByName('dprid').AsString := dprid;
    //  //SQLQuery1.FieldByName('pcode').AsString := 'P' + IntToStr(I);
    //  //SQLQuery1.FieldByName('pname').AsString := 'P' + IntToStr(I);
    //  SQLQuery1.FieldByName('px').AsInteger := tshape(Sender).Left + x - xycenter;
    //  //tshape(Sender).Left + x0;
    //  SQLQuery1.FieldByName('py').AsInteger := tshape(Sender).top + y - xycenter;
    //  //tshape(Sender).top + y0;
    //  SQLQuery1.Post;   /////////////////////////
    //  SQLQuery1.ApplyUpdates();

    SQLtemp.Close;
    SQLtemp.SQL.Text := 'update points set px=' +
      IntToStr(tshape(Sender).Left + x - xycenter) + ',py=' +
      IntToStr(tshape(Sender).top + y - xycenter) + ' where dprid=' +
      dprid + ' and pcode=''' + TShape(Sender).Name + '''';
    SQLtemp.ExecSQL;

    SQLTransaction1.Commit;
    SQLTransaction1.Active := True;
  end;
  if pointlist.Count > 0 then
  begin
    for i := 0 to pointlist.Count - 1 do
      if Tpointline(pointlist[i]).Pcode = TShape(Sender).Name then
      begin
        Tpointline(pointlist[i]).px := tshape(Sender).Left + x - xycenter;
        Tpointline(pointlist[i]).py := (tshape(Sender).top + y - xycenter);
      end;
  end;

  /////////////////////////////////////////
  if shiftEdges.Caption = '正在shift边......' then
  begin
    cc := TShape(Sender).Brush.Color;
    TShape(Sender).Brush.Color := clred;
    ii := GetTickCount64;
    while ((GetTickCount64 - ii) < 250) do
      Application.ProcessMessages;
    // 这个常没反应，不灵，所以要这样，不顺
    //if Shift = [ssShift] then
    if ssShift in Shift then
    begin
      shiftEdgesL.Add(TShape(Sender).Name);
    end;
    //if Shift = [ssCtrl] then
    if ssCtrl in Shift then
    begin
      shiftEdgesL[shiftEdgesL.Count - 1] :=
        shiftEdgesL[shiftEdgesL.Count - 1] + ':' + TShape(Sender).Name;
      // 这个常可以星形，一个中心，其余多个，但分割时亦不顺

    end;
    TShape(Sender).Brush.Color := cc;

    exit;
  end;



  ///////////////////////////////////////////////////
  if Button = mbRight then
  begin
    p.X := X;
    p.Y := Y;
    t := TShape(Sender).clienttoscreen(p);
    delOnePoint.Hint := TShape(Sender).Name;
    hintPoint.Hint := TShape(Sender).hint;
    hintPoint.Caption := '提示：' + hintPoint.Hint;
    updateMemo.Hint := TShape(Sender).Name;
    sqltemp.Close;
    sqltemp.SQL.Text := 'select memo from points where dprid=' +
      dprid + ' and pcode=''' + TShape(Sender).Name + '''';
    sqltemp.Open;
    if GetRecordCount(sqltemp) > 0 then
    begin
      memoPoint.Caption := '备注：' + sqltemp.FieldByName('memo').AsString;
      memoPoint.hint := sqltemp.FieldByName('memo').AsString;
    end;
    sqltemp.Close;
    pMenu.Popup(t.X, t.Y);

    exit;
  end;
  if not (ssShift in Shift) then
    refreshClick(nil);
end;

procedure TMain.Shape1Paint(Sender: TObject);
var
  p, c, cap: string;
  www: tpoint;
  ccolor: string;
  ccclred, brushcolor: tcolor;
  ii, kk, w: integer;
begin
  //   if TShape(Sender).Name=application.Hint then
  //  application.ProcessMessages;
  if Sender = nil then exit;
  cap := TShape(Sender).Caption;
  p := cap.Substring(0, cap.IndexOf(';'));
  c := cap.Substring(cap.IndexOf(';') + 1);
  // TShape(Sender).Canvas.TextOut(-10,-10,p);
  www.X := -20;
  www.y := -20;
  www := TShape(Sender).ClientToParent(www, Tscrollbox(TShape(Sender).parent));
  if CheckBox_showhint.Checked then
    Tscrollbox(TShape(Sender).parent).Canvas.TextOut(www.x, www.y, p);
  //image1.Canvas.TextOut(www.x, www.y, p);
  //  self.ScrollBox1.Canvas.TextOut(www.x, www.y, p);
  w := StrToInt(edit1.Text);
  //TShape(Sender).Canvas.TextOut(w div 2, w div 2, c);
  TShape(Sender).Canvas.TextOut((w div 3), (w div 3) - 2, c);

  if c <> '0' then
    ccolor := c;
  //application.ProcessMessages;
  ccolor := c;
  if ccolor = '0' then
    ccclred := clwhite;
  if ccolor = '1' then
    ccclred := cllime;
  if ccolor = '2' then
    ccclred := clFuchsia;
  if ccolor = '3' then
    ccclred := clyellow;
  if ccolor = '4' then
    ccclred := clskyblue;
  if ccolor = '5' then
    ccclred := clsilver;
  //TShape(Sender).Color := ccclred;
  ////////////////////////////////  TShape(Sender).Brush.Color := ccclred;
  //if not OnPainNoPainColor then
  //application.ProcessMessages;
  if Sender = nil then exit;
  brushcolor := TShape(Sender).Brush.Color;




  // iitime1000 := trunc(strtoint(stepTime.text));
  ii := GetTickCount64;
  //now0f:= time() ;
  // while ((now()-now0f)<( (0.1)/24*3600) ) do
  // while ((GetTickCount64 - ii) < 100) do
  Application.ProcessMessages;
end;

function TMain.getPcode(pcode: string): tshape;
var
  i: integer;
begin
  Result := nil;
  for i := shapeList.Count - 1 downto 0 do
  begin
    try
      if TGraphicControl(shapeList.Items[i]) is tshape then
        if tshape(shapeList.Items[i]).Name = pcode then
        begin
          Result := tshape(shapeList.Items[i]);
          break;
          application.ProcessMessages;
        end;
    except
    end;
    application.ProcessMessages;
  end;
end;

procedure TMain.refreshoneP(ccolor: string; pcode: string; iitime1000: integer;
  ccclred: TColor);
var
  ijk, ii: integer;
  www: string;
  ooo: tshape;
  nowf, now0f: real;
  w: Tdatetime;
begin
  //  if pcode=application.Hint then
  //   application.ProcessMessages;
  //if ccclred <> clred then
  //  // 没有现成的橙色orange，事先自备才可
  //  if not ((ccclred = clAqua) or (ccclred = clHighLight) or (ccclred = clmedgray) or
  //    (ccclred = clblue) or (ccclred = clwindowFrame)) then




  ooo := getpcode(pcode);
  if ooo <> nil then
  begin
    www := ooo.Caption;
    // getpcode(pcode).Caption:= www.Substring(www.IndexOf(';'));
    ooo.Caption := www.Substring(0, www.IndexOf(';')) + ';' + ccolor;
    // if not OnPainNoPainColor then exit;
    //if not OnPainNoPainColor then
    begin

    end;
    //    GetTickCount
    //iitime1000 := trunc(StrToInt(stepTime.Text));
    //ii := GetTickCount64;
    ////now0f:= time() ;
    //// while ((now()-now0f)<( (0.1)/24*3600) ) do
    //while ((GetTickCount64 - ii) < iitime1000) do
    Application.ProcessMessages;
    //  looktime(-1);

  end;
  exit;




  for ijk := self.ComponentCount - 1 downto 0 do
  begin
    if ((self.Components[ijk] is TLabel)) then
    begin
      if (uppercase(self.Components[ijk].Name) = uppercase('FC' + pcode)) then
      begin
        TLabel(self.Components[ijk]).Caption := ccolor;
        if not (ccclred = clwhite) then
        begin
          TLabel(self.Components[ijk]).Color := ccclred; // clred;
          TLabel(self.Components[ijk]).Transparent := False;
        end;
        Application.ProcessMessages;
        break;
      end;
    end;
  end;
  for ijk := self.ComponentCount - 1 downto 0 do
  begin
    if ((self.Components[ijk] is TShape)) then
    begin
      //showmessage(self.Components[ijk].Name); //shape1
      if (uppercase(self.Components[ijk].Name) = uppercase(pcode)) then
      begin

        if not (ccclred = clwhite) then
        begin
          TShape(self.Components[ijk]).Brush.Color := ccclred; // clred;

        end;
        Application.ProcessMessages;
        break;
      end;
    end;
  end;
  // iitime1000 := 0;
  //iitime1000 := trunc(strtoint(stepTime.text));
  //ii := Winapi.Windows.GetTickCount;
  //while ((Winapi.Windows.GetTickCount - ii) < iitime1000) do
  //  Application.ProcessMessages;
  //looktime(-1);
  if ccolor = '5' then
    Application.ProcessMessages;

end;

procedure TMain.fromLabelcaption;
var
  ijk, ii: integer;
  p, c, cap, ccolor: string;
  ccclred: tcolor;
begin
  // LabelsCaptions.Clear;
  //OnPainNoPainColor := False;
  application.ProcessMessages;
  for ijk := self.ComponentCount - 1 downto 0 do
  begin
    if ((self.Components[ijk] is TShape)) then
      // if LabelsCaptions.Values[uppercase(self.Components[ijk].Name)]<>nil then
      if LabelsCaptions.Values[uppercase(self.Components[ijk].Name)] <> '' then
      begin
        TShape(self.Components[ijk]).Caption :=
          LabelsCaptions.Values[uppercase(self.Components[ijk].Name)];

      end;
  end;
  //ii := gettickcount64;
  //while (gettickcount64 - ii) < 100 do
  //  application.ProcessMessages;
  //OnPainNoPainColor := True;
  //application.ProcessMessages;
end;

procedure TMain.fromLabelcaptionC(onlyc: TColor);
var
  ijk, ii: integer;
  p, c, cap, ccolor: string;
  ccclred: tcolor;
begin
  // LabelsCaptions.Clear;
  //OnPainNoPainColor := False;
  //    fromLabelcaption;
  //  exit;


  application.ProcessMessages;
  for ijk := self.ComponentCount - 1 downto 0 do
  begin
    if ((self.Components[ijk] is TShape)) then
      //    if LabelsCaptions.Values[uppercase(self.Components[ijk].Name)]<>nil then
      if LabelsCaptions.Values[uppercase(self.Components[ijk].Name)] <> '' then
      begin
        if self.Components[ijk].Name = application.hint then
          application.ProcessMessages;
        // LabelsCaptions.Add(uppercase(self.Components[ijk].Name)+'='+TLabel(self.Components[ijk]).Caption);
        //if TShape(self.Components[ijk]).Color = onlyc then
        //if not ((ccclred = clAqua) or (ccclred = clHighLight) or (ccclred = clmedgray) or
        //  (ccclred = clblue) or (ccclred = clwindowFrame)) then
        //if ((TShape(self.Components[ijk]).Brush.Color = onlyc ) or
        //    (TShape(self.Components[ijk]).Brush.Color = clAqua ) or
        //     (TShape(self.Components[ijk]).Brush.Color = clHighLight ) or
        //     (TShape(self.Components[ijk]).Brush.Color = clmedgray ) or
        //     (TShape(self.Components[ijk]).Brush.Color = clblue ) or
        //     (TShape(self.Components[ijk]).Brush.Color = clwindowFrame ) ) then
        if TShape(self.Components[ijk]).Brush.Color = onlyc then
          //if TShape(self.Components[ijk]).Brush.Color = clblue then
        begin
          //if TShape(self.Components[ijk]).Brush.Color = clblue then
          //  application.ProcessMessages;
          //if TShape(self.Components[ijk]).Brush.Color = onlyc then
          //  application.ProcessMessages;
          //if TShape(self.Components[ijk]).Brush.Color = clred then
          //  application.ProcessMessages;
          TShape(self.Components[ijk]).Caption :=
            LabelsCaptions.Values[uppercase(self.Components[ijk].Name)];

        end;

      end;
  end;
  //ii := gettickcount64;
  //while (gettickcount64 - ii) < 500 do
  //  application.ProcessMessages;
  //OnPainNoPainColor := True;
  //application.ProcessMessages;
end;

procedure TMain.AutorefreshALLP;
var
  ijk, ii: integer;
  ccolor: string;
  ccclred: TColor;
begin
  // 没有现成的橙色orange，事先自备才可
  if 1 = 2 then
    if ((ccclred = clFuchsia) or (ccclred = cllime) or (ccclred = clyellow) or
      (ccclred = clskyblue) or (ccclred = clsilver)) then
    begin
      if ccolor = '1' then
        ccclred := cllime;
      if ccolor = '2' then
        ccclred := clFuchsia;
      if ccolor = '3' then
        ccclred := clyellow;
      if ccolor = '4' then
        ccclred := clskyblue;
      if ccolor = '5' then
        ccclred := clsilver;

    end;

  for ijk := self.ComponentCount - 1 downto 0 do
  begin
    if ((self.Components[ijk] is TLabel)) then
      if ((uppercase(TLabel(self.Components[ijk]).Name)[1] +
        uppercase(TLabel(self.Components[ijk]).Name)[2]) = 'FC') then
      begin
        ccolor := TLabel(self.Components[ijk]).Caption;
        ccclred := clOlive;
        if ccolor = '1' then
          ccclred := cllime;
        if ccolor = '2' then
          ccclred := clFuchsia;
        if ccolor = '3' then
          ccclred := clyellow;
        if ccolor = '4' then
          ccclred := clskyblue;
        if ccolor = '5' then
          ccclred := clsilver;

        TLabel(self.Components[ijk]).Color := ccclred; // clred;
        TLabel(self.Components[ijk]).Transparent := False;
        for ii := self.ComponentCount - 1 downto 0 do
        begin
          if ((self.Components[ii] is TShape)) then
          begin
            if uppercase(TLabel(self.Components[ijk]).Name) = 'FC' +
              uppercase(self.Components[ii].Name) then
              TShape(self.Components[ii]).Brush.Color := ccclred; // clred;
          end;
        end;
        Application.ProcessMessages;

      end;
  end;

end;

procedure TMain.looktime(iitime1000: integer);
var
  ii: integer;
  sqltemp1: TSQLQuery;
begin
  userclick := True;
  ii := GetTickCount64;
  if iitime1000 > -1 then
    while ((GetTickCount64 - ii) < iitime1000) do
      Application.ProcessMessages;
  if iitime1000 = -1 then
  begin
    while userclick do
      Application.ProcessMessages;
    sqltemp1 := TSQLQuery.Create(self);
    sqltemp1.DataBase := sqltemp.DataBase;
    sqltemp1.Transaction := sqltemp.Transaction;
    Application.ProcessMessages;
    sqltemp1.Close;
    sqltemp1.SQL.Text := 'select * from points where dprid=' + dprid;
    sqltemp1.Open;
    sqltemp1.First;
    while not sqltemp1.EOF do
    begin
      LabelsCaptions.Values[uppercase(sqltemp1.FieldByName('pcode').AsString)] :=
        sqltemp1.FieldByName('fc').AsString;
      sqltemp1.Next;
    end;

    self.fromLabelcaptionC(clred);
    sqltemp1.Free;
  end;

end;

procedure TMain.savetoLabelcaption;
var
  ijk, ii: integer;
begin
  LabelsCaptions.Clear;
  for ijk := self.ComponentCount - 1 downto 0 do
  begin
    if ((self.Components[ijk] is tshape)) then
    begin

      LabelsCaptions.Add(uppercase(self.Components[ijk].Name) +
        '=' + tshape(self.Components[ijk]).Caption);
      //tshape(self.Components[ijk]).OnPaint(tshape(self.Components[ijk]));
    end;
  end;

end;



procedure TMain.groupcount;
var
  ccc: string;
begin

  sqltemp.Close;
  sqltemp.SQL.Text := 'select  count(1) as c  from points where dprid=' + dprid;
  sqltemp.Open;
  ccc := sqltemp.FieldByName('c').AsString;
  sqltemp.Close;
  sqltemp.SQL.Text := 'select  fc ,count(1) as c  from points where dprid=' +
    dprid + ' group by fc order by fc ';
  sqltemp.Open;
  sqltemp.First;

end;



//function TMain.DrawArrow(bpoint, epoint: tpoint): integer;   //    箭头在目标方
//var
//  upp,downp:tpoint;
//begin
//  //self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok
//  if bpoint.X=epoint.X  then
//  if bpoint.y>epoint.y  then   //  向下的
//  begin

//  end;
//  if bpoint.X=epoint.X  then
//  if bpoint.y<epoint.y  then    // 向上的
//  begin

//  end;
//    if bpoint.X>epoint.X  then
//  if bpoint.y=epoint.y  then    //  向左的
//  begin

//  end;
//    if bpoint.X<epoint.X  then
//    if bpoint.y=epoint.y  then   //向右的
//    begin

//    end;
//   ///////////////////////////////////////
//     if bpoint.X>epoint.X  then
//  if bpoint.y>epoint.y  then      //  正方形指向左下角
//  begin

//  end;
//  if bpoint.X>epoint.X  then
//  if bpoint.y<epoint.y  then  //   正方形指向左上角
//  begin

//  end;
//    if bpoint.X<epoint.X  then
//  if bpoint.y<epoint.y  then   //    正方形指向右上角
//  begin
//    //upp.X:=  trunc(bpoint.X+  (epoint.X-bpoint.X)*0.5);
//    //upp.Y:=trunc(bpoint.y+  (epoint.y-bpoint.y)*0.3);
//    //self.ScrollBox1.Canvas.Line(upp, epoint);
//    // downp.X:=  trunc(bpoint.X+  (epoint.X-bpoint.X)*0.5);
//    //downp.Y:=trunc(bpoint.y+  (epoint.y-bpoint.y)*0.8);
//    //self.ScrollBox1.Canvas.Line(downp, epoint);
//  end;
//    if bpoint.X<epoint.X  then
//    if bpoint.y>epoint.y  then  //   正方形指向右下角   //p1p2  test
//    begin
//      //upp.X:=  trunc(bpoint.X+  (epoint.X-bpoint.X)*0.5);
//      //upp.Y:=trunc(bpoint.y+  (epoint.y-bpoint.y)*0.8);
//      //self.ScrollBox1.Canvas.Line(upp, epoint);
//      // downp.X:=  trunc(bpoint.X+  (epoint.X-bpoint.X)*0.5);
//      //downp.Y:=trunc(bpoint.y+  (epoint.y-bpoint.y)*0.3);
//      //self.ScrollBox1.Canvas.Line(downp, epoint);

//    end;


//  result:=1;
//end;

function TMain.DrawArrowAI(bpoint, epoint: tpoint): integer;
  /////已证实，这个由网页AI生成的函数，放入我的工程立即生效，确实有用，第一次有用，是在
  ////https://5abdow.smartapps.baidu.com/?_chatParams=%7B%22from%22%3A%22q2a%22%2C%22token%22%3A%22mJ8FUfwNIGn6OllPY1scwUX4SsgYhdxnlZPxN7X5PZE8WNouBI5C8TV9Wt0o1aaJ7wn5VdvUwQemkCr4fUXuK6MLW22XuDSGIIJCDXZgAemRu4YMggJDfZteN7ZbLAeQV5PU8d%2BBfPR4%2Bccb5j%2FfHsAL1cA%3D%22%2C%22chat_no_login%22%3Atrue%2C%22agent_id%22%3A%229kxXMX3IJQTdOLEOLWJPGu1Fgfq7Fco9%22%7D&searchid=bc93b91500946bc2&tplname=ai_agent_qa_recommend&srcid=61446&order=8&lid=bc93b91500946bc2&_swebScene=3711001210000000
  ////deepseek数学助手上生成的代码
var
  arrowSize: integer;
  angle: double;
  arrowP1, arrowP2: TPoint;
  lineAngle: double;
  dx, dy: integer;
begin
  arrowSize := 30;//10; // 箭头大小
  dx := epoint.X - bpoint.X;
  dy := epoint.Y - bpoint.Y;

  // 计算线段角度
  if dx = 0 then
  begin
    if dy > 0 then lineAngle := Pi / 2
    else
      lineAngle := -Pi / 2;
  end
  else
  begin
    lineAngle := ArcTan2(dy, dx);
  end;

  // 计算箭头两个点的位置
  arrowP1.X := epoint.X - Round(arrowSize * Cos(lineAngle + Pi / 6));
  arrowP1.Y := epoint.Y - Round(arrowSize * Sin(lineAngle + Pi / 6));

  arrowP2.X := epoint.X - Round(arrowSize * Cos(lineAngle - Pi / 6));
  arrowP2.Y := epoint.Y - Round(arrowSize * Sin(lineAngle - Pi / 6));

  // 绘制箭头线
  Self.ScrollBox1.Canvas.Line(bpoint, epoint);  // 主线段
  Self.ScrollBox1.Canvas.Line(epoint, arrowP1); // 箭头线1
  Self.ScrollBox1.Canvas.Line(epoint, arrowP2); // 箭头线2

  Result := 1;
end;

function TMain.DrawArrow(bpoint, epoint: tpoint): integer;
var
  arrowSize, arrowSizeHead: integer;
  angle: double;
  arrowP1, arrowP2, arrowHead: TPoint;
  lineAngle, distlength: double;
  dx, dy: integer;
  Points: array[0..3] of TPoint;  // 创建一个包含4个点的数组
  cc: Tcolor;
begin
  arrowSize := 20;//10; // 箭头大小
  arrowSizeHead := 10;   //箭头簇大小
  dx := epoint.X - bpoint.X;
  dy := epoint.Y - bpoint.Y;

  // 计算线段角度
  if dx = 0 then
  begin
    if dy > 0 then lineAngle := Pi / 2
    else
      lineAngle := -Pi / 2;
  end
  else
  begin
    lineAngle := ArcTan2(dy, dx);
  end;

  // 计算箭头两个点的位置
  arrowP1.X := epoint.X - Round(arrowSize * Cos(lineAngle + Pi / 6));
  arrowP1.Y := epoint.Y - Round(arrowSize * Sin(lineAngle + Pi / 6));

  arrowP2.X := epoint.X - Round(arrowSize * Cos(lineAngle - Pi / 6));
  arrowP2.Y := epoint.Y - Round(arrowSize * Sin(lineAngle - Pi / 6));

  distlength := sqrt((epoint.X - bpoint.X) * (epoint.X - bpoint.X) +
    (epoint.Y - bpoint.Y) * (epoint.Y - bpoint.Y));
  arrowHead.x := epoint.X - Round((arrowSizeHead / distlength) * (epoint.X - bpoint.X));
  arrowHead.y := epoint.y - Round((arrowSizeHead / distlength) * (epoint.y - bpoint.y));

  self.ScrollBox1.Canvas.pen.Width := 2;
  // 绘制箭头线
  Self.ScrollBox1.Canvas.Line(bpoint, epoint);  // 主线段

  Points[0] := epoint;
  Points[1] := arrowP1;
  Points[2] := arrowHead;
  Points[3] := arrowP2;
  self.ScrollBox1.Canvas.Brush.Color := self.ScrollBox1.Canvas.pen.Color;
  // 设置为填充
  Self.ScrollBox1.Canvas.Polygon(Points);

  //cc:=self.ScrollBox1.Canvas.pen.Color;
  //self.ScrollBox1.Canvas.pen.Color:=clblack;
  Self.ScrollBox1.Canvas.Line(epoint, arrowP1); // 箭头线1
  Self.ScrollBox1.Canvas.Line(epoint, arrowP2); // 箭头线2
  //self.ScrollBox1.Canvas.pen.Color:=cc;
  Result := 1;
end;

function TMain.Fill3poit(onep, twop, threep: tpoint): integer;
var    //Self.ScrollBox1.Canvas.FillRect();
  Points: array[0..2] of TPoint;  // 创建一个包含3个点的数组
begin
  // 将三个点存入数组
  Points[0] := onep;
  Points[1] := twop;
  Points[2] := threep;

  // 使用Canvas的Polygon方法填充三角形
  Self.ScrollBox1.Canvas.Polygon(Points);

  Result := 0; // 你可以根据需要返回有意义的值
end;

function TMain.GetRecordCount(query: TSQLQuery): integer;
var
  i: integer;
  ii: TBookmark;
  s: string;
begin
  i := 0;
  ii := query.GetBookmark;
  query.DisableControls;
  query.First;
  //s:= query.FieldByName('pcode').AsString;
  while not query.EOF do
  begin
    i := i + 1;
    query.Next;
  end;
  query.GotoBookmark(ii);
  query.EnableControls;
  Result := i;
end;

function TMain.LocateOneField(query: TSQLQuery; oneField, fieldValue: string): integer;
var
  i: integer;
  ii: TBookmark;
begin
  i := 0;
  ii := query.GetBookmark;
  query.DisableControls;
  query.First;
  while not query.EOF do
  begin
    if query.FieldByName(oneField).AsString = fieldValue then
    begin
      i := 1;
      break;
    end;
    query.Next;
  end;
  if i = 0 then
    query.GotoBookmark(ii);
  query.EnableControls;
  Result := i;
end;

function TMain.LocateTwoField(query: TSQLQuery;
  Field1, Field2, value1, value2: string): integer;
var
  i: integer;
  ii: TBookmark;
begin
  i := 0;
  ii := query.GetBookmark;
  query.DisableControls;
  query.First;
  while not query.EOF do
  begin
    if query.FieldByName(Field1).AsString = value1 then
      if query.FieldByName(Field2).AsString = value2 then
      begin
        i := 1;
        break;
      end;
    query.Next;
  end;
  if i = 0 then
    query.GotoBookmark(ii);
  query.EnableControls;
  Result := i;
end;

function TMain.GetTableAllString(query: TSQLQuery): string;
var
  i: integer;
  ii: TBookmark;
  s: string;
begin
  i := 0;
  ii := query.GetBookmark;
  query.DisableControls;
  query.First;
  s := '';
  //s:= query.FieldByName('pcode').AsString;
  for i := 0 to query.Fields.Count - 1 do
    s := s + query.Fields[i].FieldName + ';';

  s := s + #13#10;

  while not query.EOF do
  begin

    for i := 0 to query.Fields.Count - 1 do
    begin
      s := s + query.FieldByName(query.Fields[i].FieldName).AsString + ';';
    end;
    s := s + #13#10;

    query.Next;
  end;
  query.GotoBookmark(ii);
  query.EnableControls;
  Result := s;
end;

function TMain.P_E_ListToArray(): string;
var
  cc, i: integer;
begin
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from points where dprid=' + dprid;
  self.SQLQuery1.Open;
  cc := GetRecordCount(SQLQuery1);
  CityCount := cc;
  setlength(Cities, cc);
  setlength(WeightsPoint, cc);
  setlength(Pcodes, cc);
  SQLQuery1.First;
  i := -1;
  while not SQLQuery1.EOF do
  begin
    i := i + 1;
    Cities[i].X := SQLQuery1.FieldByName('px').AsInteger;
    Cities[i].y := SQLQuery1.FieldByName('py').AsInteger;
    WeightsPoint[i] := SQLQuery1.FieldByName('weightPoint').AsFloat;
    Pcodes[i] := SQLQuery1.FieldByName('pcode').AsString;
    SQLQuery1.Next;
  end;
  pointsXYpos.Caption := '城市数： ' + IntToStr(CityCount) +
    '    可以重新输入';
end;

function TMain.drawTSPpath(): integer;
var
  i: integer;
  www: tshape;
  pcode1, pcode2: string;
  pcode1Shape, pcode2Shape: Tshape;
  pcode1Pointer, pcode2Pointer: Tpoint;
  pline: TlinePoint;//PlinePoint;//TlinePoint;
  psubp: TPsubpPoint;
  ccolor: string;
  ccclred: tcolor;
  tt: integer;
  curdirect: string;
  pathlong: double;
begin
  for i := lineList.Count - 1 downto 0 do
  begin
    try
      //if tobject(shapeList.Items[i]) is TlinePoint then
      if lineList.Items[i] <> nil then
      begin
        TlinePoint(lineList.Items[i]).Free;
        lineList.Items[i] := nil;
        lineList.Count := lineList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  lineList.Clear;
  for i := TPsubpPointList.Count - 1 downto 0 do
  begin
    try
      if (TPsubpPointList.Items[i]) <> nil then
      begin
        TPsubpPoint(TPsubpPointList.Items[i]).Free;
        TPsubpPointList.Items[i] := nil;
        TPsubpPointList.Count := TPsubpPointList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  TPsubpPointList.Clear;


  Image1.Refresh;
  application.ProcessMessages;


  for tt := 0 to CityCount - 1 do
  begin
    pline := TlinePoint.Create(nil);
    pcode1 := Pcodes[bestTour[tt]];
    if tt = CityCount - 1 then
      pcode2 := Pcodes[bestTour[0]]
    else
      pcode2 := Pcodes[bestTour[tt + 1]];
    curdirect := '无向';
    pcode1Shape := getpcode(pcode1);
    pcode2Shape := getpcode(pcode2);
    pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
    pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
    pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
    pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
    //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

    if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
    begin
      ScrollBox1.Canvas.pen.color := clHighlight;//clred;
      ScrollBox1.Canvas.pen.Width := 4;
    end
    else
    begin
      ScrollBox1.Canvas.pen.color := clgrayText;
      ScrollBox1.Canvas.pen.Width := 2;
    end;

    pathlong := pathlong + sqrt(
      (((pcode1Pointer.X - pcode2Pointer.x) * (pcode1Pointer.X - pcode2Pointer.x) +
      (pcode1Pointer.y - pcode2Pointer.y) * (pcode1Pointer.y - pcode2Pointer.y)) / 1.0));
    self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok

    pline.beginPcode := pcode1;
    pline.endPcode := pcode2;
    pline.direction := 'from1to2';
    pline.beginPoint := pcode1Pointer;
    pline.endPoint := pcode2Pointer;
    //pline.weightLine := floattostr(WeightsPoint[tt]);
    pline.weightLine := floattostr(sqrt(
      (((pcode1Pointer.X - pcode2Pointer.x) * (pcode1Pointer.X - pcode2Pointer.x) +
      (pcode1Pointer.y - pcode2Pointer.y) * (pcode1Pointer.y -
      pcode2Pointer.y)) / 1.0)));
    linelist.Add(pline);
    //linelist.Add(^pline);
    //shapeList.Add(www);

    //www.Tag:=;
    //drawarrow
    //if curdirect = '序号从小指向大 --->' then    //    序号从小指向大 --->
    if (pos('序号从小指向大', curdirect) > 0) then
    begin
      drawarrow(pline.beginPoint, pline.endPoint);
    end;
    if (pos('序号从大指向小', curdirect) > 0) then
      //if curdirect = '序号从大指向小 <---' then    //   序号从大指向小 <---
    begin
      drawarrow(pline.endPoint, pline.beginPoint);
    end;
    if (pos('双向', curdirect) > 0) then
      if (pos('无向', curdirect) <= 0) then
        if (pos('无方向', curdirect) <= 0) then
          //if curdirect = '双向  <---->' then    //   双向  <---->
        begin
          drawarrow(pline.beginPoint, pline.endPoint);
          drawarrow(pline.endPoint, pline.beginPoint);
        end;
    if (pos('无向', curdirect) > 0) then
      //if curdirect = '无向   ------' then    //   无向   ------
    begin
      ///
    end;

  end;
  drawTSPpathLong := pathlong;
end;

procedure TMain.refreshFromSQLite(Sender: TObject);
var
  i: integer;
  www: tshape;
  pcode1, pcode2: string;
  pcode1Shape, pcode2Shape: Tshape;
  pcode1Pointer, pcode2Pointer: Tpoint;
  pline: TlinePoint;//PlinePoint;//TlinePoint;
  pPoint: TPointLine;
  psubp: TPsubpPoint;
  ccolor: string;
  ccclred: tcolor;
  tt: integer;
  curdirect: string;
begin
  //for i:=self.component.Count-1 to 0 do
  //for i:=self.ControlCount-1 to 0 do
  //begin
  //   if   self.Controls[i] is tshape then
  //   begin
  //       self.Controls[i].Free;
  //   end;

  //end;
  //if shapeList.Count > 0 then
  for i := shapeList.Count - 1 downto 0 do
  begin
    try
      if TGraphicControl(shapeList.Items[i]) is tshape then
      begin
        tshape(shapeList.Items[i]).Visible := False;
        tshape(shapeList.Items[i]).Free;
        shapeList.Items[i] := nil;
        shapeList.Count := shapeList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  shapeList.Clear;
  for i := lineList.Count - 1 downto 0 do
  begin
    try
      //if tobject(shapeList.Items[i]) is TlinePoint then
      if lineList.Items[i] <> nil then
      begin
        TlinePoint(lineList.Items[i]).Free;
        lineList.Items[i] := nil;
        lineList.Count := lineList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  lineList.Clear;
  for i := TPsubpPointList.Count - 1 downto 0 do
  begin
    try
      if (TPsubpPointList.Items[i]) <> nil then
      begin
        TPsubpPoint(TPsubpPointList.Items[i]).Free;
        TPsubpPointList.Items[i] := nil;
        TPsubpPointList.Count := TPsubpPointList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  TPsubpPointList.Clear;

  for i := pointList.Count - 1 downto 0 do
  begin
    try
      //if tobject(shapeList.Items[i]) is TlinePoint then
      if pointList.Items[i] <> nil then
      begin
        TPointLine(pointList.Items[i]).Free;
        pointList.Items[i] := nil;
        pointList.Count := pointList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  pointList.Clear;



  //SQLTransaction1.Active := True;
  //self.ScrollBox1.Canvas.Destroy;
  self.ScrollBox1.Canvas.Brush.Color := ScrollBox1.Color;
  ScrollBox1.Canvas.FillRect(ScrollBox1.Canvas.ClipRect);
  image1.Refresh;
  image1.BringToFront;
  application.ProcessMessages;
  //   SQLConnector1.ConnectorType:='sqlite3';
  //// SQLConnector1.DatabaseName:='/media/w/data/日记类/TSP_ubuntu_Lazarus/TSP.sqlite3';
  // SQLConnector1.DatabaseName:='TSP.sqlite3';
  //self.ScrollBox1.Canvas.Create;
  application.ProcessMessages;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from points where dprid=' + dprid;
  self.SQLQuery1.Open;
  SQLQuery1.First;
  while not SQLQuery1.EOF do
  begin
    // www := tshape.Create(nil);
    www := tshape.Create(self);
    www.Parent := ScrollBox1;
    www.Width := StrToInt(edit1.Text);
    www.Height := StrToInt(edit1.Text);
    www.Shape := stCircle;
    www.Left := SQLQuery1.FieldByName('px').AsInteger;
    www.top := SQLQuery1.FieldByName('py').AsInteger;
    /////////////////////////////////
    www.Caption := SQLQuery1.FieldByName('pname').AsString;  /////
    ScrollBox1.Font.Size := 8; /////   TShape没有caption？？？没有Font？？？
    //////////////////////////////////

    www.Name := SQLQuery1.FieldByName('pcode').AsString;
    www.Hint := SQLQuery1.FieldByName('pname').AsString + '权' +
      SQLQuery1.FieldByName('weightPoint').AsString;
    www.ShowHint := True;
    www.OnMouseDown := self.Shape1.OnMouseDown;
    www.OnMouseMove := self.Shape1.OnMouseMove;
    www.OnMouseUp := self.Shape1.OnMouseUp;
    www.OnPaint := self.Shape1.OnPaint;  //  www.Canvas.TextOut(0,0,www.Caption);
    // www.brush.Color := clred;
    //www.canvas.TextStyle:=[Graphics.TTextStyle.EndEllipsis];
    //www.Canvas.TextRect(www.ClientRect,www.Width div 2,www.Height div 2,www.Caption,www.canvas.TextStyle);
    //www.Canvas.TextOut(0,0,www.Caption);

    //www.Canvas.TextRect(www.ClientRect,www.Width div 2,www.Height div 2,www.Caption);
    ccolor := '5';
    if ccolor = '0' then
      ccclred := clwhite;
    if ccolor = '1' then
      ccclred := cllime;
    if ccolor = '2' then
      ccclred := clFuchsia;
    if ccolor = '3' then
      ccclred := clyellow;
    if ccolor = '4' then
      ccclred := clskyblue;
    if ccolor = '5' then
      ccclred := clsilver;
    www.Brush.Color := ccclred;
    if SQLQuery1.FieldByName('isbegin').AsInteger = 1 then
      www.Brush.Color := clred;
    if SQLQuery1.FieldByName('isend').AsInteger = 1 then
      www.Brush.Color := clyellow;
    shapeList.Add(www);
    //www.Tag:=;
    psubp := TPsubpPoint.Create(nil);
    psubp.Pcode := SQLQuery1.FieldByName('pcode').AsString;
    TPsubpPointList.Add(psubp);
    //tt:=gettickcount64;
    //while (gettickcount64-tt)<100 do
    //application.ProcessMessages;



    pPoint := TPointLine.Create(nil);
    pPoint.px := SQLQuery1.FieldByName('px').AsInteger;
    pPoint.py := SQLQuery1.FieldByName('py').AsInteger;
    pPoint.pname := SQLQuery1.FieldByName('pname').AsString;
    pPoint.pcode := SQLQuery1.FieldByName('pcode').AsString;

    pointlist.add(ppoint);

    SQLQuery1.Next;
  end;



  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from edges where relation=1 and dprid=' + dprid;
  self.SQLQuery1.Open;
  SQLQuery1.First;
  ScrollBox1.Canvas.pen.color := clgrayText;
  ScrollBox1.Canvas.pen.Width := 2;
  while not SQLQuery1.EOF do
  begin
    ///pline    //init???memory???
    pline := TlinePoint.Create(nil);
    pcode1 := SQLQuery1.FieldByName('pcode1').AsString;
    pcode2 := SQLQuery1.FieldByName('pcode2').AsString;
    curdirect := SQLQuery1.FieldByName('direct').AsString;
    pcode1Shape := getpcode(pcode1);
    pcode2Shape := getpcode(pcode2);
    pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
    pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
    pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
    pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
    //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

    if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
    begin
      ScrollBox1.Canvas.pen.color := clHighlight;//clred;
      ScrollBox1.Canvas.pen.Width := 4;
    end
    else
    begin
      ScrollBox1.Canvas.pen.color := clgrayText;
      ScrollBox1.Canvas.pen.Width := 2;
    end;


    self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok


    //pline^.beginPcode := pcode1;
    //pline^.endPcode := pcode2;
    //pline^.direction := 'from1to2';
    //pline^.beginPoint := pcode1Pointer;
    //pline^.endPoint := pcode2Pointer;
    //linelist.Add(pline);
    pline.beginPcode := pcode1;
    pline.endPcode := pcode2;
    pline.direction := 'from1to2';
    pline.beginPoint := pcode1Pointer;
    pline.endPoint := pcode2Pointer;
    pline.weightLine := SQLQuery1.FieldByName('weightLine').AsString;
    linelist.Add(pline);
    //linelist.Add(^pline);
    //shapeList.Add(www);

    //www.Tag:=;
    //drawarrow
    //if curdirect = '序号从小指向大 --->' then    //    序号从小指向大 --->
    if (pos('序号从小指向大', curdirect) > 0) then
    begin
      drawarrow(pline.beginPoint, pline.endPoint);
    end;
    if (pos('序号从大指向小', curdirect) > 0) then
      //if curdirect = '序号从大指向小 <---' then    //   序号从大指向小 <---
    begin
      drawarrow(pline.endPoint, pline.beginPoint);
    end;
    if (pos('双向', curdirect) > 0) then
      if (pos('无向', curdirect) <= 0) then
        if (pos('无方向', curdirect) <= 0) then
          //if curdirect = '双向  <---->' then    //   双向  <---->
        begin
          drawarrow(pline.beginPoint, pline.endPoint);
          drawarrow(pline.endPoint, pline.beginPoint);
        end;
    if (pos('无向', curdirect) > 0) then
      //if curdirect = '无向   ------' then    //   无向   ------
    begin
      ///
    end;

    for i := TPsubpPointList.Count - 1 downto 0 do
    begin
      try
        if (TPsubpPointList.Items[i]) <> nil then
        begin
          if TPsubpPoint(TPsubpPointList.Items[i]).Pcode = pcode1 then
          begin
            if TPsubpPoint(TPsubpPointList.Items[i]).subPcode.IndexOf(pcode2) = -1 then
              TPsubpPoint(TPsubpPointList.Items[i]).subPcode.add(pcode2);
          end;
          if TPsubpPoint(TPsubpPointList.Items[i]).Pcode = pcode2 then
          begin
            if TPsubpPoint(TPsubpPointList.Items[i]).subPcode.IndexOf(pcode1) = -1 then
              TPsubpPoint(TPsubpPointList.Items[i]).subPcode.add(pcode1);
          end;
        end;
      except
      end;
      application.ProcessMessages;
    end;
    SQLQuery1.Next;
  end;
  ScrollBox1.Canvas.pen.color := clblack;
  ScrollBox1.Canvas.pen.Width := 1;
  SQLQuery1.Close;
  for i := shapeList.Count - 1 downto 0 do
    if shapeList.Items[i] <> nil then
      if TGraphicControl(shapeList.Items[i]) is tshape then
      begin
        tshape(shapeList.Items[i]).BringToFront;
        tshape(shapeList.Items[i]).OnPaint(tshape(shapeList.Items[i]));
        //refreshoneP('1',tshape(shapeList.Items[i]).name,0,clMoneyGreen);
        // Application.ProcessMessages;
      end;
  // refreshoneP();
  //   refreshoneP(sqltemp.FieldByName('fc').AsString, sqltemp.FieldByName('pcode')
  //  .AsString, 0, clMoneyGreen);

  refreshCityCountAndCitiexyFromPointList(Sender);
  P_E_ListToArray();
end;

procedure TMain.refreshFromLineList(Sender: TObject);
var
  i: integer;
  www: tshape;
  pcode1, pcode2: string;
  pcode1Shape, pcode2Shape: Tshape;
  pcode1Pointer, pcode2Pointer: Tpoint;
  pline: TlinePoint;//PlinePoint;//TlinePoint;
  psubp: TPsubpPoint;
  ccolor: string;
  ccclred: tcolor;
  tt: integer;
  curdirect: string;
begin
  {
  for i := shapeList.Count - 1 downto 0 do
  begin
    try
      if TGraphicControl(shapeList.Items[i]) is tshape then
      begin
        tshape(shapeList.Items[i]).Visible := False;
        tshape(shapeList.Items[i]).Free;
        shapeList.Items[i] := nil;
        shapeList.Count := shapeList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  shapeList.Clear;
  for i := lineList.Count - 1 downto 0 do
  begin
    try
      //if tobject(shapeList.Items[i]) is TlinePoint then
      if lineList.Items[i] <> nil then
      begin
        TlinePoint(lineList.Items[i]).Free;
        lineList.Items[i] := nil;
        lineList.Count := lineList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  lineList.Clear;
  for i := TPsubpPointList.Count - 1 downto 0 do
  begin
    try
      if (TPsubpPointList.Items[i]) <> nil then
      begin
        TPsubpPoint(TPsubpPointList.Items[i]).Free;
        TPsubpPointList.Items[i] := nil;
        TPsubpPointList.Count := TPsubpPointList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  TPsubpPointList.Clear;
  //SQLTransaction1.Active := True;
  //self.ScrollBox1.Canvas.Destroy;
  }
  self.ScrollBox1.Canvas.Brush.Color := ScrollBox1.Color;
  ScrollBox1.Canvas.FillRect(ScrollBox1.Canvas.ClipRect);
  image1.Refresh;
  image1.BringToFront;
  application.ProcessMessages;
  //self.ScrollBox1.Canvas.Create;
  application.ProcessMessages;

  for i := 0 to linelist.Count - 1 do
  begin

    pcode1 := TlinePoint(linelist[i]).beginPcode;
    pcode2 := TlinePoint(linelist[i]).endPcode;
    curdirect := TlinePoint(linelist[i]).direction;
    pcode1Shape := getpcode(pcode1);
    pcode2Shape := getpcode(pcode2);
    pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
    pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
    pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
    pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
    //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

    if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
    begin
      ScrollBox1.Canvas.pen.color := clHighlight;//clred;
      ScrollBox1.Canvas.pen.Width := 4;
    end
    else
    begin
      ScrollBox1.Canvas.pen.color := clgrayText;
      ScrollBox1.Canvas.pen.Width := 2;
    end;


    self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok



    //www.Tag:=;
    //drawarrow
    //if curdirect = '序号从小指向大 --->' then    //    序号从小指向大 --->
    if (pos('序号从小指向大', curdirect) > 0) then
    begin
      drawarrow(pline.beginPoint, pline.endPoint);
    end;
    if (pos('序号从大指向小', curdirect) > 0) then
      //if curdirect = '序号从大指向小 <---' then    //   序号从大指向小 <---
    begin
      drawarrow(pline.endPoint, pline.beginPoint);
    end;
    if (pos('双向', curdirect) > 0) then
      if (pos('无向', curdirect) <= 0) then
        if (pos('无方向', curdirect) <= 0) then
          //if curdirect = '双向  <---->' then    //   双向  <---->
        begin
          drawarrow(pline.beginPoint, pline.endPoint);
          drawarrow(pline.endPoint, pline.beginPoint);
        end;
    if (pos('无向', curdirect) > 0) then
      //if curdirect = '无向   ------' then    //   无向   ------
    begin
      ///
    end;
  end;
  for i := shapeList.Count - 1 downto 0 do
    if shapeList.Items[i] <> nil then
      if TGraphicControl(shapeList.Items[i]) is tshape then
      begin
        tshape(shapeList.Items[i]).BringToFront;
        tshape(shapeList.Items[i]).OnPaint(tshape(shapeList.Items[i]));
        //refreshoneP('1',tshape(shapeList.Items[i]).name,0,clMoneyGreen);
        // Application.ProcessMessages;
      end;
  // refreshoneP();
  //   refreshoneP(sqltemp.FieldByName('fc').AsString, sqltemp.FieldByName('pcode')
  //  .AsString, 0, clMoneyGreen);

  refreshCityCountAndCitiexyFromPointList(Sender);
  //P_E_ListToArray();
end;

procedure TMain.refreshFromTWOList(Sender: TObject);
var
  i: integer;
  www: tshape;
  pcode1, pcode2: string;
  pcode1Shape, pcode2Shape: Tshape;
  pcode1Pointer, pcode2Pointer: Tpoint;
  pline: TlinePoint;//PlinePoint;//TlinePoint;
  psubp: TPsubpPoint;
  ccolor: string;
  ccclred: tcolor;
  tt: integer;
  curdirect: string;
begin

  for i := shapeList.Count - 1 downto 0 do
  begin
    try
      if TGraphicControl(shapeList.Items[i]) is tshape then
      begin
        tshape(shapeList.Items[i]).Visible := False;
        tshape(shapeList.Items[i]).Free;
        shapeList.Items[i] := nil;
        shapeList.Count := shapeList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  shapeList.Clear;


  //SQLTransaction1.Active := True;
  //self.ScrollBox1.Canvas.Destroy;
  //  ScrollBox1.VertScrollBar.Position:=(ScrollBox1.Tag mod 10000);
  //ScrollBox1.HorzScrollBar.Position:=trunc(ScrollBox1.Tag div 10000);
  // ScrollBox1.Tag:= ScrollBox1.VertScrollBar.Position;
  // ScrollBox1.Tag:= ScrollBox1.HorzScrollBar.Position;
  //ScrollBox1.Tag:=  ScrollBox1.HorzScrollBar.Position*10000+ ScrollBox1.VertScrollBar.Position;


  self.ScrollBox1.Canvas.Brush.Color := ScrollBox1.Color;
  ScrollBox1.Canvas.FillRect(ScrollBox1.Canvas.ClipRect);
  //image1.Refresh;
  //image1.BringToFront;
  Application.ProcessMessages;
  //   ScrollBox1.VertScrollBar.Position:=(ScrollBox1.Tag mod 10000);
  // //ScrollBox1.VertScrollBar.Position:=1111;
  // ScrollBox1.HorzScrollBar.Position:=trunc(ScrollBox1.Tag div 10000);
  // //ScrollBox1.HorzScrollBar.Position:=1111;
  // ScrollBox1.Tag:= ScrollBox1.VertScrollBar.Position;
  // ScrollBox1.Tag:= ScrollBox1.HorzScrollBar.Position;
  //ScrollBox1.Tag:=  ScrollBox1.HorzScrollBar.Position*10000+ ScrollBox1.VertScrollBar.Position;
  Application.ProcessMessages;




  application.ProcessMessages;
  //self.ScrollBox1.Canvas.Create;
  application.ProcessMessages;
  for i := 0 to pointlist.Count - 1 do
  begin

    www := tshape.Create(self);
    www.Parent := ScrollBox1;
    www.Width := StrToInt(edit1.Text);
    www.Height := StrToInt(edit1.Text);
    www.Shape := stCircle;
    www.Left := Tpointline(pointlist[i]).px;
    www.top := Tpointline(pointlist[i]).py;
    /////////////////////////////////
    www.Caption := Tpointline(pointlist[i]).pname;
    ScrollBox1.Font.Size := 8; /////   TShape没有caption？？？没有Font？？？
    //////////////////////////////////

    www.Name := Tpointline(pointlist[i]).pcode;
    www.Hint := Tpointline(pointlist[i]).pcode;
    www.ShowHint := True;
    www.OnMouseDown := self.Shape1.OnMouseDown;
    www.OnMouseMove := self.Shape1.OnMouseMove;
    www.OnMouseUp := self.Shape1.OnMouseUp;
    www.OnPaint := self.Shape1.OnPaint;  //  www.Canvas.TextOut(0,0,www.Caption);
    // www.brush.Color := clred;
    //www.canvas.TextStyle:=[Graphics.TTextStyle.EndEllipsis];
    //www.Canvas.TextRect(www.ClientRect,www.Width div 2,www.Height div 2,www.Caption,www.canvas.TextStyle);
    //www.Canvas.TextOut(0,0,www.Caption);

    //www.Canvas.TextRect(www.ClientRect,www.Width div 2,www.Height div 2,www.Caption);
    ccolor := '5';
    if ccolor = '0' then
      ccclred := clwhite;
    if ccolor = '1' then
      ccclred := cllime;
    if ccolor = '2' then
      ccclred := clFuchsia;
    if ccolor = '3' then
      ccclred := clyellow;
    if ccolor = '4' then
      ccclred := clskyblue;
    if ccolor = '5' then
      ccclred := clsilver;
    www.Brush.Color := ccclred;

    shapeList.Add(www);

  end;




  for i := 0 to linelist.Count - 1 do
  begin

    pcode1 := TlinePoint(linelist[i]).beginPcode;
    pcode2 := TlinePoint(linelist[i]).endPcode;
    curdirect := TlinePoint(linelist[i]).direction;
    pcode1Shape := getpcode(pcode1);
    pcode2Shape := getpcode(pcode2);
    pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
    pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
    pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
    pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
    //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

    if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
    begin
      ScrollBox1.Canvas.pen.color := clHighlight;//clred;
      ScrollBox1.Canvas.pen.Width := 4;
    end
    else
    begin
      ScrollBox1.Canvas.pen.color := clgrayText;
      ScrollBox1.Canvas.pen.Width := 2;
    end;


    self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok



    //www.Tag:=;
    //drawarrow
    //if curdirect = '序号从小指向大 --->' then    //    序号从小指向大 --->
    if (pos('序号从小指向大', curdirect) > 0) then
    begin
      drawarrow(pline.beginPoint, pline.endPoint);
    end;
    if (pos('序号从大指向小', curdirect) > 0) then
      //if curdirect = '序号从大指向小 <---' then    //   序号从大指向小 <---
    begin
      drawarrow(pline.endPoint, pline.beginPoint);
    end;
    if (pos('双向', curdirect) > 0) then
      if (pos('无向', curdirect) <= 0) then
        if (pos('无方向', curdirect) <= 0) then
          //if curdirect = '双向  <---->' then    //   双向  <---->
        begin
          drawarrow(pline.beginPoint, pline.endPoint);
          drawarrow(pline.endPoint, pline.beginPoint);
        end;
    if (pos('无向', curdirect) > 0) then
      //if curdirect = '无向   ------' then    //   无向   ------
    begin
      ///
    end;
  end;
  for i := shapeList.Count - 1 downto 0 do
    if shapeList.Items[i] <> nil then
      if TGraphicControl(shapeList.Items[i]) is tshape then
      begin
        tshape(shapeList.Items[i]).BringToFront;
        tshape(shapeList.Items[i]).OnPaint(tshape(shapeList.Items[i]));
        //refreshoneP('1',tshape(shapeList.Items[i]).name,0,clMoneyGreen);
        // Application.ProcessMessages;
      end;
  // refreshoneP();
  //   refreshoneP(sqltemp.FieldByName('fc').AsString, sqltemp.FieldByName('pcode')
  //  .AsString, 0, clMoneyGreen);

  //refreshCityCountAndCitiexyFromPointList(Sender);
  //P_E_ListToArray();



  // ScrollBox1.VertScrollBar.Position:=(ScrollBox1.Tag mod 10000);
  // ScrollBox1.VertScrollBar.Position:=1111;
  // ScrollBox1.HorzScrollBar.Position:=trunc(ScrollBox1.Tag div 10000);
  // ScrollBox1.HorzScrollBar.Position:=1111;
  // ScrollBox1.Tag:= ScrollBox1.VertScrollBar.Position;
  // ScrollBox1.Tag:= ScrollBox1.HorzScrollBar.Position;
  //ScrollBox1.Tag:=  ScrollBox1.HorzScrollBar.Position*10000+ ScrollBox1.VertScrollBar.Position;
  //Application.ProcessMessages;

end;

procedure TMain.refreshFromimportPoint(Sender: TObject);
var
  i: integer;
  www: tshape;
  pcode1, pcode2: string;
  pcode1Shape, pcode2Shape: Tshape;
  pcode1Pointer, pcode2Pointer: Tpoint;
  pline: TlinePoint;//PlinePoint;//TlinePoint;
  psubp: TPsubpPoint;
  ccolor: string;
  ccclred: tcolor;
  tt: integer;
  curdirect: string;
begin

  for i := shapeList.Count - 1 downto 0 do
  begin
    try
      if TGraphicControl(shapeList.Items[i]) is tshape then
      begin
        tshape(shapeList.Items[i]).Visible := False;
        tshape(shapeList.Items[i]).Free;
        shapeList.Items[i] := nil;
        shapeList.Count := shapeList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  shapeList.Clear;

  for i := lineList.Count - 1 downto 0 do
  begin
    try
      //if tobject(shapeList.Items[i]) is TlinePoint then
      if lineList.Items[i] <> nil then
      begin
        TlinePoint(lineList.Items[i]).Free;
        lineList.Items[i] := nil;
        lineList.Count := lineList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  lineList.Clear;
  for i := TPsubpPointList.Count - 1 downto 0 do
  begin
    try
      if (TPsubpPointList.Items[i]) <> nil then
      begin
        TPsubpPoint(TPsubpPointList.Items[i]).Free;
        TPsubpPointList.Items[i] := nil;
        TPsubpPointList.Count := TPsubpPointList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  TPsubpPointList.Clear;

  //SQLTransaction1.Active := True;
  //self.ScrollBox1.Canvas.Destroy;

  self.ScrollBox1.Canvas.Brush.Color := ScrollBox1.Color;
  ScrollBox1.Canvas.FillRect(ScrollBox1.Canvas.ClipRect);
  image1.Refresh;
  image1.BringToFront;
  application.ProcessMessages;
  //self.ScrollBox1.Canvas.Create;
  application.ProcessMessages;
  for i := 0 to pointlist.Count - 1 do
  begin

    www := tshape.Create(self);
    www.Parent := ScrollBox1;
    www.Width := StrToInt(edit1.Text);
    www.Height := StrToInt(edit1.Text);
    www.Shape := stCircle;
    www.Left := Tpointline(pointlist[i]).px;
    www.top := Tpointline(pointlist[i]).py;
    /////////////////////////////////
    www.Caption := Tpointline(pointlist[i]).pname;
    ScrollBox1.Font.Size := 8; /////   TShape没有caption？？？没有Font？？？
    //////////////////////////////////

    www.Name := Tpointline(pointlist[i]).pcode;
    www.Hint := Tpointline(pointlist[i]).pcode;
    www.ShowHint := True;
    www.OnMouseDown := self.Shape1.OnMouseDown;
    www.OnMouseMove := self.Shape1.OnMouseMove;
    www.OnMouseUp := self.Shape1.OnMouseUp;
    www.OnPaint := self.Shape1.OnPaint;  //  www.Canvas.TextOut(0,0,www.Caption);
    // www.brush.Color := clred;
    //www.canvas.TextStyle:=[Graphics.TTextStyle.EndEllipsis];
    //www.Canvas.TextRect(www.ClientRect,www.Width div 2,www.Height div 2,www.Caption,www.canvas.TextStyle);
    //www.Canvas.TextOut(0,0,www.Caption);

    //www.Canvas.TextRect(www.ClientRect,www.Width div 2,www.Height div 2,www.Caption);
    ccolor := '5';
    if ccolor = '0' then
      ccclred := clwhite;
    if ccolor = '1' then
      ccclred := cllime;
    if ccolor = '2' then
      ccclred := clFuchsia;
    if ccolor = '3' then
      ccclred := clyellow;
    if ccolor = '4' then
      ccclred := clskyblue;
    if ccolor = '5' then
      ccclred := clsilver;
    www.Brush.Color := ccclred;

    shapeList.Add(www);

  end;




  for i := shapeList.Count - 1 downto 0 do
    if shapeList.Items[i] <> nil then
      if TGraphicControl(shapeList.Items[i]) is tshape then
      begin
        tshape(shapeList.Items[i]).BringToFront;
        tshape(shapeList.Items[i]).OnPaint(tshape(shapeList.Items[i]));
        //refreshoneP('1',tshape(shapeList.Items[i]).name,0,clMoneyGreen);
        // Application.ProcessMessages;
      end;
  // refreshoneP();
  //   refreshoneP(sqltemp.FieldByName('fc').AsString, sqltemp.FieldByName('pcode')
  //  .AsString, 0, clMoneyGreen);

  refreshCityCountAndCitiexyFromPointList(Sender);
  //P_E_ListToArray();
end;

procedure TMain.refreshCityCountAndCitiexyFromPointList(Sender: TObject);
var
  cc, i: integer;
begin
  cc := pointlist.Count;
  CityCount := cc;
  setlength(Cities, cc);
  setlength(Pcodes, cc);
  for i := 0 to CityCount - 1 do
  begin

    Cities[i].X := tpointline(pointlist[i]).px;
    Cities[i].y := tpointline(pointlist[i]).py;
    Pcodes[i] := tpointline(pointlist[i]).pcode;
  end;
  pointsXYpos.Caption := '城市数： ' + IntToStr(CityCount) +
    '       可以重新输入';
end;

function TMain.pcodeAndPointLineListFromSQL(): integer;
var
  cc, i: integer;
  pPoint: TPointLine;
begin

  for i := pointList.Count - 1 downto 0 do
  begin
    try
      //if tobject(shapeList.Items[i]) is TlinePoint then
      if pointList.Items[i] <> nil then
      begin
        TPointLine(pointList.Items[i]).Free;
        pointList.Items[i] := nil;
        pointList.Count := pointList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  pointList.Clear;


  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from points where dprid=' + dprid;
  self.SQLQuery1.Open;
  cc := GetRecordCount(SQLQuery1);
  CityCount := cc;
  setlength(Cities, cc);

  setlength(Pcodes, cc);
  SQLQuery1.First;
  i := -1;
  while not SQLQuery1.EOF do
  begin
    i := i + 1;
    Cities[i].X := SQLQuery1.FieldByName('px').AsInteger;
    Cities[i].y := SQLQuery1.FieldByName('py').AsInteger;
    Pcodes[i] := SQLQuery1.FieldByName('pcode').AsString;



    pPoint := TPointLine.Create(nil);
    pPoint.px := SQLQuery1.FieldByName('px').AsInteger;
    pPoint.py := SQLQuery1.FieldByName('py').AsInteger;
    pPoint.pname := SQLQuery1.FieldByName('pname').AsString;
    pPoint.pcode := SQLQuery1.FieldByName('pcode').AsString;
    pPoint.floor := -1;
    pointlist.add(ppoint);

    SQLQuery1.Next;
  end;
  pointsXYpos.Caption := '城市数： ' + IntToStr(CityCount) +
    '    可以重新输入';
end;




procedure TMain.pointsXYposClick(Sender: TObject);
var
  NewString: string;
  ClickedOK: boolean;
  I: integer;
begin
  if Application.MessageBox('是否清空用户项目数据？',
    '是否继续？', MB_YESNO) <> idYes then
    exit;
  SQLTransaction1.Active := True;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from points where dprid=' + dprid;
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from edges where dprid=' + dprid + '';
  SQLQuery1.ExecSQL;
  // SQLQuery1.ApplyUpdates();
  // SQLTransaction1.Commit;
  //SQLTransaction1.Active := True;
  //application.ProcessMessages;
  FFF := '';
  self.Tag := 0;

  if dprid = userid then
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from points where dprid=' + dprid;
    self.SQLQuery1.Open;
    SQLQuery1.First;
    if GetRecordCount(SQLQuery1) = 0 then
    begin
      NewString := '';
      ClickedOK := InputQuery('总质点个数不能小于6个',
        '请输入总的质点个数', NewString);
      if ClickedOK then
      begin
        if StrToInt(NewString) < 6 then
          exit;
        ProgressBar1.Visible := True;
        ProgressBar1.Min := 0; // ：=1，结果出错于0时。
        ProgressBar1.Max := StrToInt(NewString);
        //SQLTransaction1.Active := True;
        // SQLQuery1.Close;
        //SQLQuery1.SQL.Text := 'delete from  linesxy where linetext=''-1''';
        //SQLQuery1.ExecSQL;SQLTransaction1.Commit;
        ////SQLQuery1.ApplyUpdates();
        Randomize;
        for I := 1 to StrToInt(NewString) do
        begin

          SQLQuery1.Append;
          //SQLQuery1.Insert;
          SQLQuery1.FieldByName('dprid').AsString := dprid;
          SQLQuery1.FieldByName('pcode').AsString := 'P' + IntToStr(I);
          SQLQuery1.FieldByName('pname').AsString := 'P' + IntToStr(I);

          //if 1 = 2 then
          begin
            SQLQuery1.FieldByName('px').AsInteger := Random(1000);//100 + I * 10;
            SQLQuery1.FieldByName('py').AsInteger := Random(1000);//100 + I * 10;
          end;
          if 1 = 2 then
          begin
            SQLQuery1.FieldByName('px').AsInteger :=
              100 + (100 * (i - 1) mod 1000) + Random(20);
            //Random(1000);//100 + I * 10;
            SQLQuery1.FieldByName('py').AsInteger :=
              100 + 100 * (100 * (i - 1) div 1000) + Random(20);
            //Random(1000);//100 + I * 10;
          end;
          if 1 = 2 then
          begin
            SQLQuery1.FieldByName('px').AsInteger :=
              100 + (100 * (i - 1) mod 1000);
            SQLQuery1.FieldByName('py').AsInteger :=
              100 + 100 * (100 * (i - 1) div 1000);
          end;


          SQLQuery1.Post;
          SQLQuery1.ApplyUpdates();

          ProgressBar1.Position := I;
        end;
        ProgressBar1.Visible := False;
        SQLQuery1.ApplyUpdates();
        SQLTransaction1.Commit;
        SQLTransaction1.Active := True;

      end;
    end;
  end;

  if StrToInt(NewString) <= 30 then
    if dprid = userid then
    begin
      SQLTransaction1.Active := True;
      SQLQuery1.Close;
      SQLQuery1.SQL.Text := 'select * from edges where dprid=' + dprid;
      self.SQLQuery1.Open;
      if GetRecordCount(SQLQuery1) = 0 then
      begin
        SQLQuery3.Close;
        SQLQuery3.SQL.Text :=
          'select * from points where dprid=' + dprid + '  order by id';
        SQLQuery3.Open;
        SQLQuery2.Close;
        SQLQuery2.SQL.Text :=
          'select * from points where dprid=' + dprid + '  order by id';
        SQLQuery2.Open;
        SQLQuery2.First;
        ProgressBar1.Visible := True;
        ProgressBar1.Min := 0;
        ProgressBar1.Position := 0;
        ProgressBar1.Max := GetRecordCount(SQLQuery3) * GetRecordCount(SQLQuery2);
        while not SQLQuery2.EOF do
        begin
          SQLQuery3.First;
          while not SQLQuery3.EOF do
          begin
            ProgressBar1.Position := ProgressBar1.Position + 1;
            if SQLQuery3.FieldByName('id').AsInteger <=
              SQLQuery2.FieldByName('id').AsInteger then
            begin
              SQLQuery3.Next;
              continue;
            end;
            SQLQuery1.Append;
            SQLQuery1.FieldByName('dprid').AsString := dprid;
            SQLQuery1.FieldByName('ecode').AsString :=
              SQLQuery2.FieldByName('pcode').AsString +
              SQLQuery3.FieldByName('pcode').AsString;
            SQLQuery1.FieldByName('pcode1').AsString :=
              SQLQuery2.FieldByName('pcode').AsString;
            SQLQuery1.FieldByName('pcode2').AsString :=
              SQLQuery3.FieldByName('pcode').AsString;
            SQLQuery1.FieldByName('pname1').AsString :=
              SQLQuery2.FieldByName('pname').AsString;
            SQLQuery1.FieldByName('pname2').AsString :=
              SQLQuery3.FieldByName('pname').AsString;
            SQLQuery1.FieldByName('Relation').AsBoolean := False;
            // SQLQuery1.FieldByName('direct').AsString := '双向或者无方向<-->';
            SQLQuery1.Post;
            SQLQuery3.Next;
          end;
          SQLQuery2.Next;
        end;
      end;
      SQLQuery1.ApplyUpdates();

      SQLTransaction1.Commit;
      SQLTransaction1.Active := True;
      ProgressBar1.Visible := False;
    end;
  if StrToInt(NewString) > 30 then
    ShowMessage('点数大于30的，不自动生成边了，以后理，或者，TSP，暂不理边，只理点');

  refreshFromSQLite(nil);
end;

procedure TMain.FormCreate(Sender: TObject);
var
  www: ticon;
begin
  // www:=ticon.Create;
  //  www.LoadFromFile('ttsp');
  //imagelist1.GetIcon(0,www);
  //self.icon:=www;
  //self.Icon:=trayicon1.Icon;
  //self.Icon.Canvas.Assign(trayicon1.Icon.Canvas);
  MyLineColor := clGrayText; // clSilver;
  // refreshhClick(nil);
  AllPath := TStringList.Create;
  AllPath_ := TStringList.Create;
  tempList := TStringList.Create;
  PPP := TStringList.Create;

  shiftPointsB := False;
  shiftEdgesB := False;
  shiftPointsL := TStringList.Create;
  shiftEdgesL := TStringList.Create;
  LabelsCaptions := TStringList.Create;


  shapeList := TFPList.Create;
  LineList := TFPList.Create;
  TPsubpPointList := TFPList.Create;
  PointList := TFPList.Create;
  OnPainNoPainColor := False;
  ResultPathEdgesRed := TStringList.Create;
end;

procedure TMain.Btn_exitClick(Sender: TObject);
begin
  exitOut := True;
  Close;
end;




procedure TMain.btn_subfire_runClick(Sender: TObject);
var
  dp: TTFire;
begin

  // 竟然与这句有关，如果改成下面一句，居然很慢很慢，
  // 什么原因，暂不理，草，不顺的事怪事太多，草。

  dp := TTFire.Create(CityCount, self);


  dp.init;
  mem_subfire.Lines.Add('开始时间: ' + formatdatetime(
    'yyyy-mm-dd hh:mm:ss', now()));
  dp.main;
  mem_subfire.Lines.Add('结束时间: ' + formatdatetime(
    'yyyy-mm-dd hh:mm:ss', now()));
  mem_subfire.SelStart := Length(mem_subfire.Text);
  dp.Free;

  drawTSPpath();

end;

procedure TMain.btn_PSO_runClick(Sender: TObject);
var
  PSO: TPSO;
  vv: TStringList;
begin
  // if CityCount=0  then
  begin
    // showmessage('请先在坐标标签页创建或导入坐标点');
    // exit;
  end;
  //self.showissetcity(0);

  vv := TStringList.Create;
  // vv.Add('citys='+inttostr(trunc(EditNoCities.Value))) ;     //城市数
  vv.Add('PSOnum=' + IntToStr(PSOnum.Value)); // 粒子数
  vv.Add('PSOws=' + IntToStr(PSOws.Value)); // 惯性因子最大值ws:
  vv.Add('PSOw=' + IntToStr(PSOw.Value)); // 惯性系数w：
  vv.Add('PSOwe=' + IntToStr(PSOwe.Value)); // 惯性因子最小值we:
  vv.Add('PSOVv=' + IntToStr(PSOVv.Value)); // 认知系数：
  vv.Add('PSOc1=' + IntToStr(PSOc1.Value)); // 个体学习因子c1：
  vv.Add('PSOc2=' + IntToStr(PSOc2.Value)); // 社会学习因子c2：
  vv.Add('PSOiter=' + IntToStr(PSOiter.Value)); // 迭代次数iter：

  Application.ProcessMessages;
  PSO := TPSO.Create(CityCount, self, vv);
  vv.Free;


  PSO.init;
  self.PSOLine.Lines.Add('================');
  self.PSOLine.Lines.Add
  ('开始时间: ' + formatdatetime('yyyy-mm-dd hh:mm:ss', now()));
  PSO.main;
  self.PSOLine.Lines.Add
  ('结束时间: ' + formatdatetime('yyyy-mm-dd hh:mm:ss', now()));
  PSOLine.SelStart := Length(PSOLine.Text);
  try
    PSO.Free;
  except
  end;
  try
    // PSO.DisposeOf;
  except
  end;
  try
    PSO := nil;
  except
  end;
  drawTSPpath();
end;



procedure TMain.btn_showGaClick(Sender: TObject);
begin
  //ga.fff:=self;
  //ga.GAinit;
  //drawTSPpath();
  //self.mem_GA.Lines.Add('draw='+floattostr(drawTSPpathLong));
end;

procedure TMain.btn_GaHelpgenerateHelpClick(Sender: TObject);
begin
  ShowMessage('此遗传算法有时运行多次无结果，尝试下重新创建种群才OK的。');
end;

procedure TMain.Button5Click(Sender: TObject);
var
  www, w: TStringList;
  i, j: integer;
  wstr, ww: string;
begin
  ShowMessage(IntToStr(chineseCharToInt10('刷'))); // 21047    Button3
  //ShowMessage(Int10TochineseChar('28436')); //演
  // wstr:='www#28436#123';
  // stringreplace(wstr,'#'+www[i],Int10TochineseChar('28436'),[rfReplaceAll]);


  if self.OpenDialog1.Execute then
  begin
    www := TStringList.Create;
    w := TStringList.Create;
    www.LoadFromFile(self.OpenDialog1.FileName);
    w.LoadFromFile(self.OpenDialog1.FileName);
    ww := w.Text;
    www.Delimiter := '#';
    www.DelimitedText := www.Text;
    for i := 0 to www.Count - 1 do
    begin
      try
        wstr := (Int10TochineseChar(leftstr(www[i], 5)));
        w.Text := stringreplace(w.Text, '#' + www[i], wstr, []);  //rfReplaceAll
        //w.Add((Int10TochineseChar(www[i])));
        //www[i]:=wstr;
        // for j:=0 to w.count-1 do
        //   w[j]:= stringreplace(w[j],'#'+www[i],wstr,[]);


      except
        //w.Add((www[i]));
      end;
    end;
    //www.Clear;
    //www.text:=stringreplace(w.Text,#13,'',[rfReplaceAll]);
    //www.text:=stringreplace(w.Text,#10,'',[rfReplaceAll]);
    //w.text:=ww;
    w.SaveToFile(self.OpenDialog1.FileName + '.txt');
    //www.SaveToFile(self.OpenDialog1.FileName+'www.txt');
    www.Free;
    // w.Free;;
  end;


  ShowMessage(Int10TochineseChar('28436')); //演

end;

procedure TMain.customLengthClick(Sender: TObject);
var
  i, x1, y1, x2, y2, j, ii, jj, ccount: integer;
  sqr0, rij: double;
  www: string;
begin
  if trim(mem_customlength.Text) = '' then
  begin
    ShowMessage('先输入或粘贴路径，例如 ：' + #13#10 +
      'P1' + #13#10 + 'P3' + #13#10 + 'P7' + #13#10 + '。。。');
    exit;
  end;
  P_E_ListToArray;


  setlength(curdistance, CityCount, CityCount);
  setlength(distance, CityCount, CityCount);
  for ii := 0 to self.CityCount - 1 do
  begin
    distance[ii][ii] := 0;
    curdistance[ii][ii] := 0;
    for jj := ii + 1 to CityCount - 1 do
    begin
      rij := sqrt(((Cities[ii].X - Cities[jj].X) * (Cities[ii].X - Cities[jj].X) +
        (Cities[ii].Y - Cities[jj].Y) * (Cities[ii].Y - Cities[jj].Y)) / 1.0);
      Distance[ii][jj] := -1.0;
      if Distance[ii][jj] = -1.0 then
      begin
        distance[ii][jj] := rij;
        distance[jj][ii] := rij;
        curdistance[ii][jj] := rij;
        curdistance[jj][ii] := rij;
      end
      else
      begin
        // 不是 代替SQRT，否则仍然要乘以权数，自定义边长则不再乘权数乎
        curdistance[ii][jj] :=
          Distance[ii][jj];
        curdistance[jj][ii] :=
          Distance[ii][jj];
      end;
    end;
  end;
  distance[CityCount - 1][CityCount - 1] := 0;
  curdistance[CityCount - 1][CityCount - 1] := 0;


  ccount := min(mem_customlength.Lines.Count, CityCount);
  sqr0 := 0;
  for ii := 0 to ccount - 2 do
  begin
    www := mem_customlength.Lines.Strings[ii];
    // www := stringreplace(www, 'P', '', []);
    // www := stringreplace(www, 'p', '', []);
    //try
    //  i := StrToInt(www);
    // except
    for jj := 0 to CityCount - 1 do
      if pcodes[jj] = trim(www) then
      begin
        i := jj;
        break;
      end;
    // end;
    www := mem_customlength.Lines.Strings[ii + 1];
    //www := stringreplace(www, 'P', '', []);
    //www := stringreplace(www, 'p', '', []);

    //  try
    //   j := StrToInt(www);
    // except
    for jj := 0 to CityCount - 1 do
      if PCodes[jj] = trim(www) then
      begin
        j := jj;
        break;
      end;
    // end;
    x1 := trunc(Cities[i].X);
    y1 := trunc(Cities[i].Y);
    x2 := trunc(Cities[j].X);
    y2 := trunc(Cities[j].Y);

    if Distance[i][j] = -1 then
      sqr0 := sqr0 + sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
    else
      sqr0 := sqr0 + curdistance[i][j];

    //sqr0 := sqr0;
  end;
  www := mem_customlength.Lines.Strings[0];
  //www := stringreplace(www, 'P', '', []);
  //www := stringreplace(www, 'p', '', []);
  //try
  //  i := StrToInt(www);
  // except
  for jj := 0 to CityCount - 1 do
    if pcodes[jj] = trim(www) then
    begin
      i := jj;
      break;
    end;
  //end;
  www := mem_customlength.Lines.Strings[CCount - 1];
  //www := stringreplace(www, 'P', '', []);
  // www := stringreplace(www, 'p', '', []);
  // try
  // j := StrToInt(www);
  // except
  for jj := 0 to CityCount - 1 do
    if pcodes[jj] = trim(www) then
    begin
      j := jj;
      break;
    end;
  // end;
  x1 := trunc(Cities[i].X);
  y1 := trunc(Cities[i].Y);
  x2 := trunc(Cities[j].X);
  y2 := trunc(Cities[j].Y);
  if Distance[i][j] = -1 then
    sqr0 := sqr0 + sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
  else
    sqr0 := sqr0 + curdistance[i][j];

  //for i := 0 to CityCount - 1 do
  //  sqr0 := sqr0 + Cities[i].Z;

  mem_customlength.Lines.Add('总路长：' + floattostr(sqr0));
end;

procedure TMain.customLength_helpClick(Sender: TObject);
var
  s: string;
  fn: TStringList;
begin
  //fn:=tstringlist.Create;
  //fn.LoadFromFile(extractfilepath(ParamStr(0)) + '模拟退火算法说明.txt');
  //s:=fn.text;
  s := '计算路长的说明：' + #13#10 +
    '先清空，再粘贴路径，再计算路长' + #13#10 +
    '在下面手工输入或粘贴路径，再点击计算路长，一个点占一行' +
    #13#10 + '先清空，再粘贴路径，再计算路长' + #13#10 +
    '例如：' + #13#10 + 'P3' + #13#10 + 'P7' + #13#10 + 'P8' + #13#10 + '。。。';
  InputQueryLiMemo('计算路长的说明', s, nil);
  //fn.free;
end;

procedure TMain.delOnePointClick(Sender: TObject);
var
  pcode: string;
begin
  if application.MessageBox('删除此质点？', PChar(Tmenuitem(Sender).Hint),
    MB_OKCANCEL) = ID_OK then
  begin
    pcode := delonepoint.Hint;
    sqltemp.Close;
    sqltemp.SQL.Text := 'delete from points where dprid=' + dprid +
      ' and pcode=''' + pcode + '''';
    sqltemp.ExecSQL;
    sqltemp.Close;
    sqltemp.SQL.Text := 'delete from edges where dprid=' + dprid +
      ' and pcode1=''' + pcode + '''';
    sqltemp.ExecSQL;
    sqltemp.Close;
    sqltemp.SQL.Text := 'delete from edges where dprid=' + dprid +
      ' and pcode2=''' + pcode + '''';
    sqltemp.ExecSQL;
    //sqltransaction1.Commit;
    //sqltemp.ApplyUpdates();
    application.ProcessMessages;
    SQLTransaction1.Commit;
    SQLTransaction1.Active := True;
    application.ProcessMessages;
    refrash.Click;
  end;
end;

procedure TMain.exportPointsClick(Sender: TObject);
var
  www: TStringList;
  i, j, k, ii, jj: integer;
  w2: string;
  rij: double;
begin
  k := 0;
  //if Application.MessageBox(
  //  '将保存点的坐标，点的权值（默认为0），边的权值（默认为1），自定义边长。'
  //  + #13#10 +
  //  '默认仅保存自定义边长，要不要保存所有的边长（自定义的和自动计算的）？'
  //  + #13#10 + '【是】：仅保存自定义边长' + #13#10 +
  //  '【否】：保存所有的边长（自定义的和自动计算的）',
  //  '保存', MB_YESNO) = idYes then
  //begin
  //  k := 1;
  //end;
  if Application.MessageBox(
    '只保存点的坐标，对于点的权值（默认为0），边的权值（默认为1），自定义边长，全不理'
    + #13#10 + '默认仅保存点的坐标，要不要继续？' +
    #13#10 + '【是】：仅保存点的坐标' + #13#10 +
    '【否】：不保存', '保存', MB_YESNO) = idYes then
  begin
    k := 3;
  end
  else
    exit;
  // MessageDlg   TMessageForm
  if self.SaveDialog1.Execute then
  begin
    www := TStringList.Create;
    www.Add('//  tsp小软件的质点参数设置文件txt的说明：');
    www.Add('//  ⑴点坐标,直角坐标<像素值整数/小数>,球面坐标经纬度/极坐标');
    www.Add('//  ⑵点权数,点权数相加   ');
    www.Add('//  ⑶边权数<本应二维表格，本地数据库类>');
    www.Add('//  ⑷边长自动计算再乘权数');
    www.Add('//  ⑸边长用户手工定义');
    www.Add('//  ⑹不是完全图,非任意两点有边');
    www.Add('//  ⑺→将不存在的边长设置成一个大数，表示这边是不连通的，或约等于现有边长的总和的有限N倍，这样就相当于过滤掉这条边乎');
    www.Add('//  简化成如下格式规则：');
    www.Add('//  以demo.txt数据为例：  可以先随机生成质点，再保存来看格式。');
    www.Add('//  ①请注意，序号从0开始，序号要连续，但不要序号相重，末尾为空，不要添加字符');
    www.Add('//  ②坐标值为屏幕像素坐标，只可以为整数，但不可以为负数，但可以大于屏幕，自动出现滚动条。');
    www.Add('//  ③如果是地球经纬度坐标，可以近似折算回直角坐标来显示，再乘以两端点且乘边的权数来校正，');
    www.Add('//  ④xy后第一个数是此点的权数，再后面是边的权数，以序号为准的二维表格对应边的坐标,凡空白者，以1为默认值');
    www.Add('//  ⑤最后是自定义边长,先自动计算边长,如果存在权数则乘以两点权数和边权数取代之,如果存在自定义边长则覆盖同坐标之前述边长,以起止点之序号PiPj来定边之坐标 ');
    www.Add('//  ⑥当前一行的数据,先序号Pi,再x与y坐标,再点的权数,再边的权数,不够的自动认为1,最后以#分隔为自定义边长,每项以;分隔,空值和不够长的都认为是自动计算的无须用户自定义的,当前;;分割值对应坐标i,j边值/权数/自定义长等');
    www.Add('//  ⑦二维表格对应坐标i,j,纵i横j');
    www.Add('//  ⑧或斜对角线PiPi可代表Pi点权数不必另外单独,或以斜对角线PiPi对称轴值相同,暂不考虑');
    www.Add('//  ⑨至于结果如果存在多条同样最短值的多条路径，这用穷举法必可找到，有没有别的算法，我就没这功夫去理了。');
    www.Add('//示例：');
    www.Add('//P0: x=1;y=2#    p0点权值#p0p0边权值;p0p1边权值;p0p2边权值#p0p0边长;p0p1边长;p0p2边长');
    www.Add('//P1: x=11;y=21#  p1点权值#p1p0边权值;p1p1边权值;p1p2边权值#p1p0边长;p1p1边长;p1p2边长');
    www.Add('//P2: x=111;y=211#p2点权值#p2p0边权值;p2p1边权值;p2p2边权值#p2p0边长;p2p1边长;p2p2边长');
    www.Add('//最小容器内遇上空格清空trim()');
    www.Add('//分拆最小容器时，如果遇上;;这种分隔出来的空格空值，当作默认值1或0或-1');
    www.Add('//遇上前缀前段不够长的后面序列点全作默认值，例如本应p0...pi...pn齐全的，只有前面一截p0..pn-5,没有后面的，后面的pn-5...pn就当成默认值，如果是点与边的权默认是1，如果是自定义边长默认是0或-1，覆盖用勾股定理/毕达哥拉斯定理自动计算的边长时特殊处理');

    /// 证实，导出质点数中的矩阵确是对角线对称的

    for i := 0 to self.CityCount - 1 do
    begin
      //if pcodes[i] = 'P' + IntToStr(i) then
      //  w2 := 'P' + IntToStr(i) + ': ';
      for j := 0 to shapelist.Count - 1 do
        if TShape(shapelist[j]).Name = pcodes[i] then
        begin
          if TShape(shapelist[j]).Caption <> pcodes[i] then
            w2 := pcodes[i] + '(' + TShape(shapelist[j]).Caption + '):'
          else
            w2 := pcodes[i] + ':';
        end;

      w2 := w2 + 'x=' + floattostr((Cities[i].X)) + ';y=' + floattostr(
        (Cities[i].Y));

      w2 := w2 + '#';
      /////////////////////////
      if k = 1 then
      begin
        w2 := w2 + floattostr((Distance[i][0]));
        for j := 1 to CityCount - 1 do
          w2 := w2 + ';' + floattostr((Distance[i][j]));
      end;
      if k = 0 then
      begin
        for ii := 0 to CityCount - 1 do
        begin

          curdistance[ii][ii] := 0;
          for jj := ii + 1 to CityCount - 1 do
          begin
            rij := sqrt(((Cities[ii].X - Cities[jj].X) *
              (Cities[ii].X - Cities[jj].X) +
              (Cities[ii].Y - Cities[jj].Y) *
              (Cities[ii].Y - Cities[jj].Y)) / 1.0);
            if Distance[ii][jj] = -1.0 then
            begin
              curdistance[ii][jj] := rij;
              curdistance[jj][ii] := rij;
            end
            else
            begin
              // 不是 代替SQRT，否则仍然要乘以权数，自定义边长则不再乘权数乎
              curdistance[ii][jj] :=
                Distance[ii][jj];
              curdistance[jj][ii] :=
                Distance[ii][jj];
            end;
          end;
        end;

        curdistance[CityCount - 1][CityCount - 1] := 0;

        w2 := w2 + floattostr((curdistance[i][0]));
        for j := 1 to CityCount - 1 do
          w2 := w2 + ';' + floattostr((curdistance[i][j]));
      end;
      //////////////////////////////////////////////

      www.Add(w2);
    end;
    // www.SaveToFile('c:\data.txt');
    www.SaveToFile(SaveDialog1.FileName);
    www.Free;
    ShowMessage('ok');
  end;
end;

procedure TMain.exportPointsToSQLiteClick(Sender: TObject);
var
  www: TStringList;
  i, j, k, ii, jj: integer;
  w2: string;
  rij: double;
begin
  k := 0;

  if Application.MessageBox(
    '将要清空本地数据库sqlite中的点数据，要不要继续？' +
    #13#10 + '默认仅保存点的坐标，要不要继续？' +
    #13#10 + '【是】：仅保存点的坐标' + #13#10 +
    '【否】：不保存', '保存', MB_YESNO) = idYes then
  begin
    k := 3;
  end
  else
    exit;
  // MessageDlg   TMessageForm
  ////////////////////////////////////
  SQLTransaction1.Active := True;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from points where dprid=' + dprid;
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from edges where dprid=' + dprid + '';
  SQLQuery1.ExecSQL;

  if dprid = userid then
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from points where dprid=' + dprid;
    self.SQLQuery1.Open;
    SQLQuery1.First;
    if GetRecordCount(SQLQuery1) = 0 then
      ///////////////////////////////////
      //if self.SaveDialog1.Execute then
    begin
      /// 证实，导出质点数中的矩阵确是对角线对称的
      ProgressBar1.Visible := True;
      ProgressBar1.Min := 0; // ：=1，结果出错于0时。
      ProgressBar1.Max := CityCount;

      for I := 0 to CityCount - 1 do
      begin

        SQLQuery1.Append;
        //SQLQuery1.Insert;
        SQLQuery1.FieldByName('dprid').AsString := dprid;
        SQLQuery1.FieldByName('pcode').AsString := pcodes[i];
        for j := 0 to shapelist.Count - 1 do
          if TShape(shapelist[j]).Name = pcodes[i] then
            SQLQuery1.FieldByName('pname').AsString := TShape(shapelist[j]).Caption;
        SQLQuery1.FieldByName('px').AsInteger := Cities[i].X;
        SQLQuery1.FieldByName('py').AsInteger := Cities[i].Y;
        SQLQuery1.Post;
        SQLQuery1.ApplyUpdates();

        ProgressBar1.Position := I;
      end;
      ProgressBar1.Visible := False;
      SQLQuery1.ApplyUpdates();
      SQLTransaction1.Commit;
      SQLTransaction1.Active := True;

    end;
    ShowMessage('ok');
  end;
end;

procedure TMain.FormActivate(Sender: TObject);
var
  ii: integer;
begin
  // self.WindowState:=wsFullScreen;
  //ii := GetTickCount64;
  //while ((GetTickCount64 - ii) < 2500) do
  //  Application.ProcessMessages;
  if pos('OnShow', self.Hint) > 0 then
  begin
    self.Hint := stringreplace(self.Hint, 'OnShow', '', []);
    self.WindowState := wsMaximized;
    application.ProcessMessages;
    refrash.Click;
  end;
end;

procedure TMain.FormPaint(Sender: TObject);
begin

end;

procedure TMain.Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
var
  p, t, aaa, bbb, ccc: tpoint;
  ii: integer;
  ab, ac, bc, L, minL, H, minH, Sabc, pp: real;
  Cap, minLCaption, minHCaption: string;
  p1, p2: string;
  curline: TlinePoint;
  c: tcolor;
begin

  //exit;
  ////测试正确
  //   海伦公式是通过三角形三边长度直接计算面积的公式，表达式为S=sqrt(p(p−a)(p−b)(p−c))
  //，其中p=(a+b+c)/2 为半周长。
  //online    三角形海伦面积公式，求得点到各边之高之距离，不仅最小高，还要诸高排序，取一个最小范围，这样不足取也


  p.X := X;
  p.Y := Y;
  t := TImage(Sender).clienttoscreen(p);
  //ccc:=p;
  ccc := TImage(Sender).ClientToParent(p);

  minL := 1000000000;
  minH := 1000000000;
  for ii := lineList.Count - 1 downto 0 do
  begin
    try
      //if tobject(shapeList.Items[i]) is TlinePoint then
      if lineList.Items[ii] <> nil then
      begin
        aaa := TlinePoint(lineList.Items[ii]).beginPoint;
        bbb := TlinePoint(lineList.Items[ii]).endPoint;

        ab := sqrt((aaa.X - bbb.X) * (aaa.X - bbb.X) + (aaa.y - bbb.y) *
          (aaa.y - bbb.y));
        ac := sqrt((aaa.X - ccc.X) * (aaa.X - ccc.X) + (aaa.y - ccc.y) *
          (aaa.y - ccc.y));
        bc := sqrt((ccc.X - bbb.X) * (ccc.X - bbb.X) + (ccc.y - bbb.y) *
          (ccc.y - bbb.y));

        pp := (ab + ac + bc) / 2;
        Sabc := sqrt(pp * (pp - ab) * (pp - bc) * (pp - ac));
        H := Sabc / ab;
        //三角形海伦面积公式，求得点到各边之高之距离，不仅最小高，还要诸高排序，取一个最小范围，这样不足取也
        //if H < minH then
        //begin
        //  minH := H;
        //  minHCaption := Cap;
        //end;
        L := sqrt(((ab) - (ac) - (bc)) * ((ab) - (ac) - (bc)));
        Cap := TlinePoint(lineList.Items[ii]).beginPcode + ' <--> ' +
          TlinePoint(lineList.Items[ii]).endPcode;//+ '=' + floattostr(L);
        //  p1 := TlinePoint(lineList.Items[ii]).beginPcode;
        //  p2 := TlinePoint(lineList.Items[ii]).endPcode;
        if L < minL then
        begin
          minL := L;
          minLCaption := Cap;
          p1 := TlinePoint(lineList.Items[ii]).beginPcode;
          p2 := TlinePoint(lineList.Items[ii]).endPcode;
          curline := TlinePoint(lineList.Items[ii]);
          minH := H;
        end;

        if L < -1 then
        begin
          linememo.Caption :=
            TlinePoint(lineList.Items[ii]).beginPcode +
            TlinePoint(lineList.Items[ii]).endPcode;
          linemenu.PopUp(t.x, t.y);
          break;
        end;
        if minL < 2 then
          if minH < 5 then
            break;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;

  //if ii = 0 then
  begin
    //if minLcaption = minHcaption then
    if minL < 2 then
      if minH < 5 then
      begin

        if online <> nil then
        begin
          ScrollBox1.Canvas.Pen.Width := 2;
          ScrollBox1.Canvas.Pen.Color := clgrayText;
          ScrollBox1.Canvas.Line(online.beginPoint, online.endPoint);  //ok
        end;
        online := curline;
        c := ScrollBox1.Canvas.Pen.Color;
        ScrollBox1.Canvas.Pen.Color := clblue;
        ScrollBox1.Canvas.Pen.Width := 2;
        ScrollBox1.Canvas.Line(online.beginPoint, online.endPoint);  //ok
        ScrollBox1.Canvas.Pen.Width := 1;
        ScrollBox1.Canvas.Pen.Color := c;
        image1.ShowHint := False;
        application.ProcessMessages;
        //  image1.Hint := online.beginPcode + '::' + online.endPcode +
        //    '::' + '权' + online.weightLine;
        image1.Hint := online.beginPcode + '::' + online.endPcode;
        image1.ShowHint := True;
        application.ProcessMessages;
      end;

    if ((minL >= 2) or (minH >= 5)) then
      //if minL >= 2 then
      //  if minH>10 then
    begin
      if online <> nil then
      begin
        ScrollBox1.Canvas.Pen.Width := 2;
        ScrollBox1.Canvas.Pen.Color := clgrayText;
        ScrollBox1.Canvas.Line(online.beginPoint, online.endPoint);  //ok
        //getpcode(online.beginPcode).OnPaint(getpcode(online.beginPcode));
        //getpcode(online.endPcode).OnPaint(getpcode(online.endPcode));
        //getpcode(online.beginPcode).BringToFront;
        //getpcode(online.endPcode).BringToFront;
      end;
      online := nil;
    end;
  end;

end;

procedure TMain.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  p, t, aaa, bbb, ccc: tpoint;
  ii: integer;
  ab, ac, bc, L, minL, H, minH, Sabc, pp: real;
  Cap, minLCaption, minHCaption: string;
  p1, p2: string;
  curline: TlinePoint;
  c: tcolor;
begin
  //if shiftPointsB then
  if shiftPoints.Caption = '正在shift点......' then
    //if (Shift = [ssShift]) then
    if ssShift in Shift then
      shiftPointsL.Add(IntToStr(X) + ':' + IntToStr(Y));

  if Button = mbRight then
  begin

    //exit;
    ////测试正确
    //   海伦公式是通过三角形三边长度直接计算面积的公式，表达式为S=sqrt(p(p−a)(p−b)(p−c))
    //，其中p=(a+b+c)/2 为半周长。
    //online  三角形海伦面积公式，求得点到各边之高之距离，不仅最小高，还要诸高排序，取一个最小范围，这样不足取也


    p.X := X;
    p.Y := Y;
    t := TImage(Sender).clienttoscreen(p);
    //ccc:=p;
    ccc := TImage(Sender).ClientToParent(p);

    minL := 1000000000;
    minH := 1000000000;
    for ii := lineList.Count - 1 downto 0 do
    begin
      try
        //if tobject(shapeList.Items[i]) is TlinePoint then
        if lineList.Items[ii] <> nil then
        begin
          aaa := TlinePoint(lineList.Items[ii]).beginPoint;
          bbb := TlinePoint(lineList.Items[ii]).endPoint;

          ab := sqrt((aaa.X - bbb.X) * (aaa.X - bbb.X) + (aaa.y - bbb.y) *
            (aaa.y - bbb.y));
          ac := sqrt((aaa.X - ccc.X) * (aaa.X - ccc.X) + (aaa.y - ccc.y) *
            (aaa.y - ccc.y));
          bc := sqrt((ccc.X - bbb.X) * (ccc.X - bbb.X) + (ccc.y - bbb.y) *
            (ccc.y - bbb.y));
          L := sqrt(((ab) - (ac) - (bc)) * ((ab) - (ac) - (bc)));
          Cap := TlinePoint(lineList.Items[ii]).beginPcode + ' <--> ' +
            TlinePoint(lineList.Items[ii]).endPcode;//+ '=' + floattostr(L);
          //  p1 := TlinePoint(lineList.Items[ii]).beginPcode;
          //  p2 := TlinePoint(lineList.Items[ii]).endPcode;
          if L < minL then
          begin
            minL := L;
            minLCaption := Cap;
            p1 := TlinePoint(lineList.Items[ii]).beginPcode;
            p2 := TlinePoint(lineList.Items[ii]).endPcode;
            curline := TlinePoint(lineList.Items[ii]);
          end;
          //pp := (ab + ac + bc) / 2;
          //Sabc := sqrt(pp * (pp - ab) * (pp - bc) * (pp - ac));
          //H := Sabc / ab; 三角形海伦面积公式，求得点到各边之高之距离，不仅最小高，还要诸高排序，取一个最小范围，这样不足取也
          //if H < minH then
          //begin
          //  minH := H;
          //  minHCaption := Cap;
          //end;
          if L < -1 then
          begin
            linememo.Caption :=
              TlinePoint(lineList.Items[ii]).beginPcode +
              TlinePoint(lineList.Items[ii]).endPcode;
            linemenu.PopUp(t.x, t.y);
            break;
          end;
          application.ProcessMessages;
        end;
      except
      end;
      application.ProcessMessages;
    end;
    //linemenu.PopUp(t.x, t.y);
    if ii = 0 then
    begin
      //if minLcaption = minHcaption then
      if minL < 2 then
        //  if minH<10 then
      begin
        sqltemp.Close;
        sqltemp.SQL.Text := 'select memo from edges where dprid=' +
          dprid + ' and ((pcode1=''' + p1 + ''' and pcode2=''' + p2 +
          ''' ) or (pcode1=''' + p2 + ''' and pcode2=''' + p1 + ''' ))';
        sqltemp.Open;
        if GetRecordCount(SQLtemp) > 0 then
        begin
          linememo.Caption := '备注：' + sqltemp.FieldByName('memo').AsString;
          linememo.hint := sqltemp.FieldByName('memo').AsString;
        end;
        sqltemp.Close;
        //linememo.Caption := minLCaption;
        lineBeginEnd.Caption := minLCaption;

        if online <> nil then
        begin
          ScrollBox1.Canvas.Pen.Width := 2;
          ScrollBox1.Canvas.Pen.Color := clgrayText;
          ScrollBox1.Canvas.Line(online.beginPoint, online.endPoint);  //ok
        end;
        online := curline;
        c := ScrollBox1.Canvas.Pen.Color;
        ScrollBox1.Canvas.Pen.Color := clblue;
        ScrollBox1.Canvas.Pen.Width := 2;
        ScrollBox1.Canvas.Line(online.beginPoint, online.endPoint);  //ok
        ScrollBox1.Canvas.Pen.Width := 1;
        ScrollBox1.Canvas.Pen.Color := c;
        linemenu.PopUp(t.x, t.y);
        //linemenu.PopUp(500, 500);
      end;
    end;
  end;
end;

procedure TMain.Label3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if (Button = mbRight) then
    ShowMessage('自思肯普法时，动态染色时，可以设置每步每点时长（毫秒），以利于观察也');
end;

procedure TMain.onebyoneHelpClick(Sender: TObject);
var
  s: string;
  fn: TStringList;
begin
  //fn:=tstringlist.Create;
  //fn.LoadFromFile(extractfilepath(ParamStr(0)) + '蚁群算法说明.txt');
  //s:=fn.text;
  s := '此穷举算法，先得到一个初始值 ，然后穷举所有路径。' +
    #13#10 + '如果路径大于初始值 ，则不用再搜索下去了，退出此路径。'
    + #13#10 + '如果路径小于初始值，则替换初始值为当前最新的最小路径。'
    + #13#10 + '' + #13#10 +
    '    // 初始值可以为一切方法所得，如退火法，蚁群法等近似法，'
    + #13#10 +
    '    // 都可以为初始值。或者中断所得，可以下次作为初始值重新开始。'
    + #13#10 + '' + #13#10 +
    '   1。在顶点数为 12  时，测得此穷举算法约半分钟。' +
    #13#10 + '   2。在顶点数为 13  时，测得此穷举算法约两分半钟。' +
    #13#10 + '   3。在顶点数为 14  时，测得此穷举算法约四分钟。' +
    #13#10 + '   4。顶点数大于 14 时，没有测试过。' +
    #13#10 + '      不同的电脑硬件可能这个时间有所不同。' +
    #13#10 + '   5。本来是穷举法求精确解，但如果运行时间 过长，' +
    #13#10 + '        中途点击中断，则相当于求近似解了 。';
  InputQueryLiMemo('蚁群算法说明', s, nil);
  //fn.free;
end;

procedure TMain.PageControl1Change(Sender: TObject);
begin

end;

procedure TMain.PageControl2Change(Sender: TObject);
begin

end;

procedure TMain.PageControl3Change(Sender: TObject);
begin

end;

procedure TMain.PSOhelpClick(Sender: TObject);
var
  s: string;
  fn: TStringList;
begin
  fn := TStringList.Create;
  fn.LoadFromFile(extractfilepath(ParamStr(0)) + '粒子群算法说明.txt');
  s := fn.Text;
  InputQueryLiMemo('粒子群算法说明', s, nil);
  fn.Free;
end;

procedure TMain.ScrollBox1DragDrop(Sender, Source: TObject; X, Y: integer);
begin
  //refreshClick(nil);
end;

procedure TMain.shiftPointsChange(Sender: TObject);
begin

end;

procedure TMain.shiftPointsClick(Sender: TObject);
//var
//  i: integer;
//begin
//  //shiftPoints.Caption := 'www';
//  //
//  //i := gettickcount64;
//  //while (gettickcount64 - i) < 3000 do
//  //  //application.ProcessMessages;
//  //  sleep(111);
//end;
var
  I, ccc: integer;
  c: longint;
  pcode, pname, px, py: string;
begin
  //if shiftPointsB then
  if shiftPoints.Caption = '正在shift点......' then
  begin
    //shiftPointsB := False;
    shiftPoints.Caption := 'shift点(看右键)';
    shiftPoints.Checked := False;
    if dprid = userid then
    begin
      SQLtemp.Close;
      //SQLtemp.SQL.Text := 'select * from points where dprid=' + userid;
      SQLtemp.SQL.Text := 'select count(1) as ccc from points where dprid=' + dprid;
      SQLtemp.Open;
      //SQLtemp.Refresh;
      // if SQLtemp.RecordCount = 0 then
      ccc := 0;
      ccc := SQLtemp.FieldByName('ccc').AsInteger;
      //if SQLtemp.RecordCount >0 then
      if ccc > 0 then
      begin
        //  c := 0
        // else
        //  ccc := SQLtemp.RecordCount;    //????  SQLQuery1.RecordCount实际不止10，但返回值竟为10，怪
        for I := 0 to shiftPointsL.Count - 1 do
        begin
          //SQLtemp.Append;
          //SQLtemp.FieldByName('dprid').AsString := dprid;
          //SQLtemp.FieldByName('pcode').AsString := 'P' + inttostr(I + ccc);
          //SQLtemp.FieldByName('pname').AsString := 'P' + inttostr(I + ccc);
          //SQLtemp.FieldByName('px').AsInteger :=
          //  strtoint(leftstr(shiftPointsL[I], pos(':', shiftPointsL[I]) - 1));
          //SQLtemp.FieldByName('py').AsInteger :=
          //  strtoint(copy(shiftPointsL[I], pos(':', shiftPointsL[I]) + 1,
          //  length(shiftPointsL[I]) - pos(':', shiftPointsL[I])));
          //SQLtemp.Post;
          //SQLtemp.ApplyUpdates();
          pcode := 'P' + IntToStr(I + ccc + 1);
          pname := 'P' + IntToStr(I + ccc + 1);
          px := leftstr(shiftPointsL[I], pos(':', shiftPointsL[I]) - 1);
          py := copy(shiftPointsL[I], pos(':', shiftPointsL[I]) + 1,
            length(shiftPointsL[I]) - pos(':', shiftPointsL[I]));
          SQLtemp.Close;
          SQLtemp.SQL.Text := 'insert into points (dprid,pcode,pname,px,py) values(' +
            dprid + ' , ''' + pcode + ''' ,''' + pname + ''',' + px + ',' + py + ')';
          SQLtemp.ExecSQL;


          SQLQuery2.Close;
          SQLQuery2.SQL.Text :=
            'select * from points where dprid=' + userid + '  order by id';
          SQLQuery2.Open;
          //SQLQuery1.Append;
          //SQLQuery1.FieldByName('dprid').AsString := dprid;
          //SQLQuery1.FieldByName('pcode').AsString :=
          //  'P' + IntToStr(SQLQuery1.RecordCount + 1);
          //SQLQuery1.FieldByName('pname').AsString :=
          //  'P' + IntToStr(SQLQuery1.RecordCount + 1);
          //SQLQuery1.FieldByName('px').AsInteger := 500;
          //SQLQuery1.FieldByName('py').AsInteger := 500;
          //SQLQuery1.Post;
          //SQLQuery1.ApplyUpdates();
          SQLQuery3.Close;
          SQLQuery3.SQL.Text := 'select * from edges where dprid=' + userid;
          SQLQuery3.Open;
          SQLQuery2.First;
          while not SQLQuery2.EOF do
          begin
            if SQLQuery2.FieldByName('pcode').AsString = pcode then
            begin
              SQLQuery2.Next;
              continue;
            end;
            SQLQuery3.Append;
            SQLQuery3.FieldByName('dprid').AsString := userid;
            SQLQuery3.FieldByName('ecode').AsString :=
              SQLQuery2.FieldByName('pcode').AsString + pcode;
            SQLQuery3.FieldByName('pcode1').AsString :=
              SQLQuery2.FieldByName('pcode').AsString;
            SQLQuery3.FieldByName('pcode2').AsString :=
              pcode;
            SQLQuery3.FieldByName('pname1').AsString :=
              SQLQuery2.FieldByName('pname').AsString;
            SQLQuery3.FieldByName('pname2').AsString :=
              pname;
            SQLQuery3.FieldByName('Relation').AsBoolean := False;
            SQLQuery3.Post;
            SQLQuery3.ApplyUpdates();
            SQLQuery2.Next;
          end;
        end;
        ProgressBar1.Visible := False;
      end;
    end;

    sqltransaction1.Commit;
    sqltransaction1.Active := True;
    refreshClick(nil);
    u_points.frmPoints.ShowModal;
    u_edges.frmEdges.Show;
    refreshClick(nil);

  end // ;
  else // if not shiftPointsB then
  begin
    // Button4Click(nil); //手工清空点
    //shiftPointsB := True;
    shiftPoints.Caption := '正在shift点......';
    shiftPoints.Checked := True;
    shiftPointsL.Clear;

  end;
end;

procedure TMain.shiftEdgesClick(Sender: TObject);
//begin
//showmessage('www');
//application.MessageBox('w','ccc',MB_OK);
// application.ProcessMessages;
// application.MessageBox('ok','ok',MB_OK);
//application.ProcessMessages;
//application.MessageBox('ok', 'ok', MB_OKCANCEL);
//end;
var
  I: integer;
  LLine, star, ends: string;
begin
  if shiftEdges.Caption = '正在shift边......' then
  begin
    //shiftEdgesB := False;
    shiftEdges.Caption := 'shift边(看右键)';

    /// 手工创建全部边
    for I := 0 to shiftEdgesL.Count - 1 do
    begin
      LLine := shiftEdgesL[I] + ':';
      star := leftstr(LLine, pos(':', LLine) - 1);
      ends := stringreplace(LLine, star, '', []);
      ends := stringreplace(ends, ':', '', []);
      while ends <> '' do
      begin
        SQLQuery2.Close;
        SQLQuery2.SQL.Text := 'update edges set relation=true' +
          ' where dprid=' + userid + ' and  pcode1=''' + star +
          ''' and pcode2=''' + leftstr(ends, pos(':', ends) - 1) + '''';
        SQLQuery2.ExecSQL;
        SQLQuery2.Close;
        SQLQuery2.SQL.Text := 'update edges set relation=true' +
          ' where dprid=' + userid + ' and  pcode2=''' + star +
          ''' and pcode1=''' + leftstr(ends, pos(':', ends) - 1) + '''';
        SQLQuery2.ExecSQL;

        ends := stringreplace(ends, leftstr(ends, pos(':', ends) - 1), '', []);
        ends := stringreplace(ends, ':', '', []);
      end;
    end;
    ProgressBar1.Visible := False;
    sqltransaction1.Commit;
    sqltransaction1.Active := True;
    refreshClick(nil);
    u_points.frmPoints.ShowModal;
    u_edges.frmEdges.Show;
    refreshClick(nil);

  end // ;
  else // if not shiftPointsB then
  begin
    // edgesssClick(nil);
    //shiftEdgesB := True;
    shiftEdges.Caption := '正在shift边......';
    shiftEdges.Checked := True;
    shiftEdgesL.Clear;

  end;
end;



procedure TMain.btn_infoClick(Sender: TObject);
begin
  ///TabSheet1如果设成autosize，就会控件难位置处理而不知也
  if not FileExists('说明.txt') then
  begin
    Memo_SaveToTxT.Lines.SaveToFile('说明.txt');
  end;
  if FileExists('说明.txt') then
  begin

    msgshow.showMSG.init(ExtractFilePath(ParamStr(0)) + '说明.txt');

  end
  else
    ShowMessage('找不到说明文件');
end;

procedure TMain.Btn_about_way1Click(Sender: TObject);
var
  s: array[0..4] of string;
  v: array[0..4] of string;
begin
  s[0] := '1';
  s[1] := '2';
  s[2] := '3';
  s[3] := '4';
  s[4] := '5';
  v[0] := 'A-Star算法边长只能为正数,不可以为0或负数';
  v[1] := '理论上此算法运算速度最快,有时边长为0或负数';
  v[2] := 'A-Star算法一样可以得到正确结果,但这不是它';
  v[3] := '普遍具有的功能。一般情况下，如果边长为0';
  v[4] := '或负数时,应改用SPFA算法或算法二或算法三';
  InputQueryLi('A-Star算法说明', s, v, nil);
end;

procedure TMain.Btn_about_way2Click(Sender: TObject);
var
  s: string;      // Caption = 算法二
  v: timage;
  //     Caption = 注意：此算法点和边都不允许重复历遍二次。即点与边最多只可以历一遍。
begin
  s := '算法二说明：         ' + #13#10 +
    '算法二可以0边环负边负环。是作者自创法。' +
    #13#10 + '如果SPFA算法无解时，可以用此法解。' +
    #13#10 + '' + #13#10 + '注意：' + #13#10 +
    '此算法点和边都不允许重复历遍二次。即点边最多只可以历一遍。'
    + #13#10 + '这正是算法二与算法三不同之处！' +
    #13#10 + '' + #13#10 +
    '此算法如果是负边，最好不是双向或无向，边最好也一样有单向方向。'
    + #13#10 +
    '有时，此算法在负边为双向或无向下，仍可出正确解。但这个不能保证总是正确的。'
    + #13#10 + '测试表明，当SPFA有解时，此算法二基本上和SPFA一致的。'
    + #13#10 +
    '但在对称图中，有“0"边"0"环时，此算法二有求出对称解中对称性中的一半。'
    + #13#10 +
    '如有多条负边双向或无向时，可取值两个单向。如此组合出所有负边求解。再取其中最小值';

  //v:=timage.Create(self);
  //v.Picture.LoadFromFile('A2.jpg');
  InputQueryLiImage('算法二说明', s, 'A2.jpg', nil);
  //v.Free;
end;

procedure TMain.Btn_about_way3Click(Sender: TObject);
var
  s: string;      // Caption = 算法三
  v: timage;
  // Caption = 注意：此算法点允许重复历遍多次。但是边最多只可以历一遍。
begin
  s := '算法三说明：' + #13#10 +
    '算法三可以0边0环负边负环。也是作者自创的算法。 ' +
    #13#10 + '如果SPFA算法无解时，可以用此法尝试能否有解。' +
    #13#10 + '注意：' + #13#10 +
    '此算法点允许重复历遍多次。但是边最多只可以历一遍。' +
    #13#10 + '这正是算法二与算法三不同之处！' + #13#10 +
    '此算法如果是负边，最好不是双向或无向，负边最好也一样有单向方向。'
    + #13#10 +
    '有时，此算法在负边为双向或无向下，仍可求出正确解。但这个不能保证总是正确的。'
    + #13#10 +
    '算法三目前暂时只能找到一条最短路径，不能找到所有全部的最短路径。'
    + #13#10 + '' + #13#10 +
    '算法三在正常下，有负环时的运行效果图，参看上边的图示。' +
    #13#10 + '' + #13#10 +
    '当有多条负边双向或无向时，可以每边负边取值两个单向。如此组合出所有负边，每个组合求解。再取其中最小值';
  //v:=timage.Create(self);
  //v.Picture.LoadFromFile('A3.jpg');
  InputQueryLiImage('算法三说明', s, 'A3.jpg', nil);
  //v.Free;
end;



procedure TMain.btn_BranchStopClick(Sender: TObject);
begin
  BranchStop := True;
end;

procedure TMain.btn_branch_runClick(Sender: TObject);
var
  dp: Tbranch;
begin
  if CityCount > 14 then
    if Application.MessageBox(
      '当顶点数大于14时，分支限界可能会很慢很慢，要不要继续运行？',
      '提示', MB_YESNO) <> idYes then
      exit;
  //BranchStop := True;
  //if 1 = 2 then
  begin
    //s := ',0,4,7,5,1,3,8,6,2,';
    // s := ',0,7,4,2,6,8,3,1,5,';
    dp := Tbranch.Create(CityCount, self);
    mem_branch.Lines.Add('开始时间: ' + formatdatetime(
      'yyyy-mm-dd hh:mm:ss', now()));
    dp.init;
    // www := dp.getPathLength(s);


    dp.main;

    mem_branch.Lines.Add('结束时间: ' + formatdatetime(
      'yyyy-mm-dd hh:mm:ss', now()));
    mem_branch.SelStart := Length(mem_branch.Text);
    dp.Free;
    //    mem_customlength := 0;

  end;
  ////////TMain.refreshClick(Sender: TObject);

  drawTSPpath();

end;

procedure TMain.btn_createANTClick(Sender: TObject);
var
  i: integer;
begin
  mem_ant.Lines.Add('开始时间: ' + formatdatetime('yyyy-mm-dd hh:mm:ss', now()));
  if taco(ttaco) <> nil then
  begin
    taco(ttaco).Free;
    taco(ttaco) := nil;
  end;
  // TACO.Create(n, m, gMAX_GEN: integer; alpha, beta, rho, pheromone00: double;
  ttaco := TACO.Create(self.CityCount, antNums.Value, gMAX_GEN.Value,
    alpha.Value, beta.Value, rho.Value / 100.00, pheromone.Value / 100.00, self);
  // ACO aco = new ACO(48, 100, 1000, 1.f, 5.f, 0.5f);
  // aco.init("c://data.txt");
  // aco.solve();
  taco(ttaco).init;
  taco(ttaco).solve;
  // aco.free;
  // aco:=nil;
  // freeandnil(aco);
  mem_ant.Lines.Add('路长： ' + floattostr(taco(ttaco).bestLength));
  mem_ant.Lines.Add('路径：');

  btn_ant_run.Enabled := True;

  self.drawTSPpath();
  for i := 0 to citycount - 1 do
  begin
    begin
      mem_ant.Lines.Add(PCodes[bestTour[i]]);
    end;
  end;

  mem_ant.Lines.Add('结束时间: ' + formatdatetime('yyyy-mm-dd hh:mm:ss', now()));
  mem_ant.SelStart := Length(mem_ant.Text);
end;

procedure TMain.btn_dyp_helpClick(Sender: TObject);
var
  s: string;
  fn: TStringList;
begin
  fn := TStringList.Create;
  //fn.LoadFromFile(extractfilepath(ParamStr(0)) + '蚁群算法说明.txt');
  fn.Add('此动态规划算法，');
  fn.Add('当顶点数为 20  时，运行约十秒， ');
  fn.Add('当顶点数为 21  时，运行约半分钟，');
  fn.Add('当顶点数为 22  时，运行约一分钟，');
  fn.Add('顶点数为 23  时，测试时提示 out of memory ， ');
  fn.Add('  内存大的PC电脑,或可一试。');
  fn.Add('');
  fn.Add('');

  s := fn.Text;
  InputQueryLiMemo('动态规划算法说明', s, nil);
  fn.Free;
end;

procedure TMain.btn_ant_runClick(Sender: TObject);
var
  i: integer;
begin
  mem_ant.Lines.Add('开始时间: ' + formatdatetime('yyyy-mm-dd hh:mm:ss', now()));

  taco(ttaco).setg(antNums.Value, gMAX_GEN.Value, alpha.Value, beta.Value,
    rho.Value / 100.00, pheromone.Value / 100.00);
  taco(ttaco).init;
  taco(ttaco).solve;

  btn_ant_run.Enabled := True;
  mem_ant.Lines.Add('路长： ' + floattostr(taco(ttaco).bestLength));
  mem_ant.Lines.Add('路径：');
  self.drawTSPpath();
  for i := 0 to citycount - 1 do
  begin
    begin
      mem_ant.Lines.Add(PCodes[bestTour[i]]);
    end;
  end;

  mem_ant.Lines.Add('结束时间: ' + formatdatetime('yyyy-mm-dd hh:mm:ss', now()));
  mem_ant.SelStart := Length(mem_ant.Text);
end;

procedure TMain.btn_dyp_runClick(Sender: TObject);
var
  dp: Tdp;
begin
  //self.showissetcity(0);
  //if EditNoCities.Value > 22 then
  //  if Application.MessageBox('当顶点数大于22时，动态规划会很慢很慢，要不要继续运行？', '提示', MB_YESNO) <> idYes
  //  then
  //    exit;
  //ProgressBar3.Visible := True;
  //ProgressBar3.min := 0;
  //// ProgressBar3.Max:=trunc(power(2,(EditNoCities.Value)));
  //ProgressBar3.Max := trunc(EditNoCities.Value);
  //ProgressBar3.Position := 0;
  //Application.ProcessMessages;
  dp := Tdp.Create(self.CityCount, self);
  //dp.ProgressBar := ProgressBar3;
  //dp.ProgressBarMax := ProgressBar3.Max;
  //dp.ProgressBarpos := ProgressBar3.Position;

  dp.init;
  mem_dyp_path.Lines.Add('开始时间: ' + formatdatetime(
    'yyyy-mm-dd hh:mm:ss', now()));
  dp.main;
  mem_dyp_path.Lines.Add('结束时间: ' + formatdatetime(
    'yyyy-mm-dd hh:mm:ss', now()));
  mem_dyp_path.SelStart := Length(mem_dyp_path.Text);
  dp.Free;
  // mem_customlength := 0;
  ////////TMain.refreshClick(Sender: TObject);

  drawTSPpath();


  //mem_dyp_path.Append('pathlong='+floattostr(mem_customlength));

end;

procedure TMain.btn_fireHelpClick(Sender: TObject);
var
  s: string;
  fn: TStringList;
begin
  //fn:=tstringlist.Create;
  //fn.LoadFromFile(extractfilepath(ParamStr(0)) + '模拟退火算法说明.txt');
  //s:=fn.text;
  s := '模拟退火算法，可以网上查找相关说明也';
  InputQueryLiMemo('模拟退火算法说明', s, nil);
  //fn.free;
end;

procedure TMain.btn_gainitClick(Sender: TObject);
begin
  mem_GA.Lines.Add('开始时间: ' + formatdatetime('yyyy-mm-dd hh:mm:ss', now()));
  ga.fff := self;
  ga.GAinit;
  drawTSPpath();
  //self.mem_GA.Lines.Add('遗传算法总路长：' + floattostr(drawTSPpathLong));
  mem_GA.Lines.Add('结束时间: ' + formatdatetime('yyyy-mm-dd hh:mm:ss', now()));
  mem_GA.SelStart := Length(mem_GA.Text);
end;

procedure TMain.btn_GaReRunClick(Sender: TObject);
begin
  mem_GA.Lines.Add('开始时间: ' + formatdatetime('yyyy-mm-dd hh:mm:ss', now()));
  ga.fff := self;
  ga.GaReRun();
  drawTSPpath();
  //self.mem_GA.Lines.Add('遗传算法总路长：' + floattostr(drawTSPpathLong));
  mem_GA.Lines.Add('结束时间: ' + formatdatetime('yyyy-mm-dd hh:mm:ss', now()));
  mem_GA.SelStart := Length(mem_GA.Text);
end;

procedure TMain.Btn_about_spfaClick(Sender: TObject);
var
  s: string;
begin
  s := 'SPFA算法说明' + #13#10 + '此算法边长可以边长为0或负数' +
    #13#10 + '如果边长为负数，不可以双向或无向，一定要有方向单向。'
    + #13#10 + '如果边长为0，可以双向或无向。' + #13#10 +
    '此算法在有负环的情况下无解。不了解此算法的人可以百度了解下。'
    + #13#10 +
    '有负环时，可以参考使用作者自创的算法二或算法三，或许有解';
  InputQueryLiMemo('SPFA算法说明', s, nil);
end;

procedure TMain.antsHelpClick(Sender: TObject);
var
  s: string;
  fn: TStringList;
begin
  fn := TStringList.Create;
  fn.LoadFromFile(extractfilepath(ParamStr(0)) + '蚁群算法说明.txt');
  s := fn.Text;
  InputQueryLiMemo('蚁群算法说明', s, nil);
  fn.Free;
end;

procedure TMain.btn_aboutClick(Sender: TObject);
begin
  msgshow2.showMSG2.ShowModal;
end;

procedure TMain.Btn_about_way111Click(Sender: TObject);
var
  s: string;
  //只在作者自创的燃线法添加权重功能，别的算法暂没空去做了，以后再理
begin
  s := '燃线法权重算法说明' + #13#10 +
    '这其实是作者自创的燃线法，' + #13#10 +
    '燃线法，就是设想，节点与线段是导火线是燃烧的线，且匀速直线运动，'
    + #13#10 +
    '又或者设想是金属铜导线，通电后，以光速运动，最先到达的就是最快路径'
    + #13#10 + #13#10 +
    '原先的版本是没有权重的，点与边的权重是现在才添加上去的，'
    + #13#10 + '由于权重可能有多种组合解释，现在以下面为解释：'
    + #13#10 + '点的权重就是，经过此点时路径增加的值，' +
    #13#10 + '边的权重，就是边长再相乘的乘数倍数。' +
    #13#10 + '只在作者自创的燃线法添加权重功能，' +
    #13#10 + '别的算法暂没空去做了，以后再理';
  s := s + #13#10 + #13#10 +
    '因为作者自已闭门造车想出燃线法，再去网上寻找最短路径算法，发觉与已存在的A-Star算法十分相似，实际上又难以明确，于是作出程序来实用，' + #13#10 + '理论上归属哪个算法，不太明确。' + #13#10 + '关键是实际上能找到最短的最快的路径，实用就行了。' + #13#10 + '燃线法，就是设想，节点与线段是导火线是燃烧的线，且匀速直线运动，' + #13#10 + '又或者设想是金属铜导线，通电后，以光速运动，最先到达的就是最快路径';

  s := s + #13#10 +
    '点的权重，动态加入到当前边界的边权重中，lengthDY，动态有方向矢量，'
    + #13#10 + '不是静态加到边中乎？？？静态加到边中？两个端点一齐加？'
    + #13#10 +
    '如果两个端点一齐静态加到边中去，会造成端点被重复相？则加一半？也不行？可能行？？？'
    + #13#10 +
    '如果作为起点与止点或孤点，则不可加一半，改成加全部点权重到边中？';
  InputQueryLiMemo('燃线法权重算法说明', s, nil);

  //  燃线法权重算法说明
  //这其实是作者自创的燃线法，
  //燃线法，就是设想，节点与线段是导火线是燃烧的线，且匀速直线运动，
  //又或者设想是金属铜导线，通电后，以光速运动，最先到达的就是最快路径FastLine

  //原先的版本是没有权重的，点与边的权重是现在才添加上去的，
  //由于权重可能有多种组合解释，现在以下面为解释：
  //点的权重就是，经过此点时路径增加的值，
  //边的权重，就是边长再相乘的乘数倍数。
  //只在作者自创的燃线法添加权重功能，
  //别的算法暂没空去做了，以后再理

  //因为作者自已闭门造车想出燃线法，再去网上寻找最短路径算法，发觉与已存在的A-Star算法十分相似，实际上又难以明确，于是作出程序来实用，
  //理论上归属哪个算法，不太明确。
  //关键是实际上能找到最短的最快的路径，实用就行了。

  //点的权重，动态加入到当前边界的边权重中，lengthDY，动态有方向矢量，
  //不是静态加到边中乎？？？静态加到边中？两个端点一齐加？
  //如果两个端点一齐静态加到边中去，会造成端点被重复相？则加一半？也不行？可能行？？？
  //如果作为起点与止点或孤点，则不可加一半，改成加全部点权重到边中？

end;


//var
//  www: tpoint;
//begin
//  //if  Button=mbLeft then
//  //   Button:=mbRight;
//  www.x := x;
//  www.y := y;
//  www := onebyoneHelp.ClientToParent(www, self);
//  //self.PopupMenu1.PopUp(www.x, www.y);
//end;
procedure TMain.btn_importPointsClick(Sender: TObject); //Btn_exit
var
  i, j, ii, xx, yy, i2: integer;
  j2: double;
  nn, str1: string;
  www, qq, fuck, curts: TStringList;
  tt, pp: TPoint;
  pppppp: TPointLine;
begin
  if self.OpenDialog1.Execute then
  begin

    for i := pointList.Count - 1 downto 0 do
    begin
      try
        //if tobject(shapeList.Items[i]) is TlinePoint then
        if pointList.Items[i] <> nil then
        begin
          TPointLine(pointList.Items[i]).Free;
          pointList.Items[i] := nil;
          pointList.Count := pointList.Count - 1;
          application.ProcessMessages;
        end;
      except
      end;
      application.ProcessMessages;
    end;
    pointList.Clear;




    www := TStringList.Create;
    qq := TStringList.Create;
    curts := TStringList.Create;
    fuck := TStringList.Create;
    www.LoadFromFile(OpenDialog1.FileName);
    for i := www.Count - 1 downto 0 do
    begin
      if trim(www.Strings[i]) = '' then
        www.Delete(i);
      if trim(www.Strings[i])[1] = '/' then
        www.Delete(i);
    end;



    setlength(pcodes, www.Count);
    CityCount := www.Count;
    setlength(Distance, www.Count, www.Count);
    for i := 0 to www.Count - 1 do
      for j := 0 to www.Count - 1 do
        Distance[i][j] := -1.0;
    self.CityCount := www.Count;
    //Display.Controller.CityCount := www.Count;
    for i := 0 to www.Count - 1 do
    begin // 这里似有BUG，明天再理
      str1 := www.Strings[i];
      str1 := stringreplace(str1, 'p', 'P', [rfReplaceAll]);
      str1 := stringreplace(str1, 'X', 'x', [rfReplaceAll]);
      str1 := stringreplace(str1, 'Y', 'y', [rfReplaceAll]);
      str1 := stringreplace(str1, '：', ':', [rfReplaceAll]);
      str1 := stringreplace(str1, '；', ';', [rfReplaceAll]);

      str1 := stringreplace(str1, ' ', '', [rfReplaceAll]);

      str1 := stringreplace(str1, ' ', '', [rfReplaceAll]);
      str1 := stringreplace(str1, '（', '(', [rfReplaceAll]);
      str1 := stringreplace(str1, '）', ')', [rfReplaceAll]);
      curts.Delimiter := '#';
      curts.DelimitedText := str1;

      qq.Delimiter := ':';
      qq.DelimitedText := curts[0];
      nn := trim(qq.Strings[0]);
      nn := stringreplace(nn, 'P', '', [rfReplaceAll]);

      pppppp := TPointLine.Create(nil);
      if pos('(', nn) > 0 then
      begin
        nn := stringreplace(nn, ')', '', [rfReplaceAll]);
        fuck.Clear;
        fuck.Delimiter := '(';
        fuck.DelimitedText := nn;
        ii := StrToInt(fuck[0]);
        //pcodes[ii] := fuck[1];
        pppppp.Pcode := 'P' + fuck[0];
        pppppp.pname := fuck[1];

      end
      else
      begin
        ii := StrToInt(nn);
        //pcodes[ii] := 'P' + nn;
        pppppp.Pcode := 'P' + nn;
        pppppp.pname := 'P' + nn;

      end;
      nn := qq.Strings[1];
      qq.Clear;
      qq.Delimiter := ';';
      qq.DelimitedText := nn;
      if pos('x=', qq.Strings[0]) > 0 then
        nn := qq.Strings[0];
      if pos('x=', qq.Strings[1]) > 0 then
        nn := qq.Strings[1];
      xx := StrToInt(stringreplace(nn, 'x=', '', [rfReplaceAll]));
      if pos('y=', qq.Strings[0]) > 0 then
        nn := qq.Strings[0];
      if pos('y=', qq.Strings[1]) > 0 then
        nn := qq.Strings[1];
      yy := StrToInt(stringreplace(nn, 'y=', '', [rfReplaceAll]));

      tt.X := xx;
      tt.Y := yy;

      //SetCity(ii, tt);
      //Cities[ii].x := trunc(tt.X);
      //Cities[ii].y := trunc(tt.Y);
      //  Z[ii] := tt.Z;

      pppppp.px := trunc(tt.X);
      pppppp.py := trunc(tt.y);

      pointlist.add(pppppp);


      if curts.Count >= 3 then
      begin
        // MainForm.Display.Controller
        fuck.Clear;
        fuck.Delimiter := ';';
        fuck.DelimitedText := stringreplace(curts.Strings[2], '，',
          ';', [rfReplaceAll]);
        for i2 := 0 to fuck.Count - 1 do
        begin
          if trim(fuck[i2]) = '' then
            j2 := 1.0
          else
            j2 := strtofloat(trim(fuck[i2]));

        end;

      end;
      if curts.Count >= 4 then
      begin // MainForm.Display.Controller
        fuck.Clear;
        fuck.Delimiter := ';';
        fuck.DelimitedText := stringreplace(curts.Strings[3], '，',
          ';', [rfReplaceAll]);
        for i2 := 0 to fuck.Count - 1 do
        begin
          if trim(fuck[i2]) = '' then
            j2 := -1.0
          else
            j2 := strtofloat(trim(fuck[i2]));
          if Distance[ii][i2] = -1.0 then
          begin
            Distance[ii][i2] := j2;
            Distance[i2][ii] := j2;
          end;
        end;
        for i2 := fuck.Count to www.Count - 1 do
        begin
          j2 := -1.0; // 这里错了一个负号，很难查
          if Distance[ii][i2] = -1.0 then
          begin
            Distance[ii][i2] := j2;
            Distance[i2][ii] := j2;
          end;
        end;
      end;
    end;
    // EditNoCities.Value := www.Count;
    // Display.Controller.CityCount := www.Count;

    qq.Free;
    www.Free;
    fuck.Free;
    curts.Free;
    //pointsXYpos.Caption := '城市数：' + IntToStr(CityCount) + '   重新输入';
    //addcaption := '  导入座标文件:' + OpenDialog1.FileName;
    //self.Caption := maincapiton + addcaption;
    refreshFromimportPoint(nil);
  end;
end;

procedure TMain.btn_LKHiniClick(Sender: TObject);
begin
  //U_LKH_ini.frmLKH_ini:= TfrmLKH_ini.Create(self);
  // U_LKH_ini.frmLKH_ini.show;
  //msgshow2.showMSG2.Show;
  //U_LKH_ini.frmLKH_ini.ShowModal;
end;

procedure TMain.Button3Click(Sender: TObject);
begin
  if opendialog1.Execute then
  begin
    image1.Picture.LoadFromFile(opendialog1.FileName);
  end;
end;

procedure TMain.addOnePointClick(Sender: TObject);
var
  NewString: string;
  ClickedOK: boolean;
  I, maxindex: integer;
begin
  if dprid <> userid then
    ShowMessage('演示数据不可修改，用户数据才可以');
  if dprid = userid then
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from points where dprid=' + userid;
    SQLQuery1.Open;
    if GetRecordCount(SQLQuery1) > 0 then
    begin
      NewString := '';
      ClickedOK := InputQuery('是否要增加一个质点',
        '新的质点坐标x=500;y=500', NewString);
      if ClickedOK then
      begin
        SQLQuery2.Close;
        SQLQuery2.SQL.Text := 'select pcode from points where dprid=' +
          userid + ' order by id';
        SQLQuery2.Open;    //max(pcode)=P9  <>P20  not  GetRecordCount
        SQLQuery2.Last;
        maxindex := StrToInt(stringreplace(
          SQLQuery2.FieldByName('pcode').AsString, 'P', '', []));
        // not  GetRecordCount
        SQLQuery1.Append;
        SQLQuery1.FieldByName('dprid').AsString := dprid;
        SQLQuery1.FieldByName('pcode').AsString :=
          'P' + IntToStr(maxindex + 1);
        SQLQuery1.FieldByName('pname').AsString :=
          'P' + IntToStr(maxindex + 1);
        SQLQuery1.FieldByName('px').AsInteger := 500;
        SQLQuery1.FieldByName('py').AsInteger := 500;
        SQLQuery1.FieldByName('memo').AsString := NewString;
        SQLQuery1.Post;
        SQLQuery1.ApplyUpdates();
        SQLQuery3.Close;
        SQLQuery3.SQL.Text := 'select * from edges where dprid=' + userid;
        SQLQuery3.Open;

        SQLQuery2.Close;
        SQLQuery2.SQL.Text := 'select * from points where dprid=' +
          userid + '  order by id';
        SQLQuery2.Open;
        SQLQuery2.First;
        while not SQLQuery2.EOF do
        begin
          if SQLQuery2.FieldByName('pcode').AsString = SQLQuery1.FieldByName(
            'pcode').AsString then
          begin
            SQLQuery2.Next;
            continue;
          end;
          SQLQuery3.Append;
          SQLQuery3.FieldByName('dprid').AsString := userid;
          SQLQuery3.FieldByName('ecode').AsString :=
            SQLQuery2.FieldByName('pcode').AsString +
            SQLQuery1.FieldByName('pcode').AsString;
          SQLQuery3.FieldByName('pcode1').AsString :=
            SQLQuery2.FieldByName('pcode').AsString;
          SQLQuery3.FieldByName('pcode2').AsString :=
            SQLQuery1.FieldByName('pcode').AsString;
          SQLQuery3.FieldByName('pname1').AsString :=
            SQLQuery2.FieldByName('pname').AsString;
          SQLQuery3.FieldByName('pname2').AsString :=
            SQLQuery1.FieldByName('pname').AsString;
          SQLQuery3.FieldByName('Relation').AsBoolean := False;
          SQLQuery3.Post;
          SQLQuery3.ApplyUpdates();
          SQLQuery2.Next;
        end;
      end;
      sqltransaction1.Commit;
      sqltransaction1.Active := True;

    end;
  end;
  //sqltransaction1.Commit;
  //sqltransaction1.Active := True;
  refreshClick(nil);
  u_points.frmPoints.ShowModal;
  u_edges.frmEdges.Show;
  refreshClick(nil);
end;



procedure TMain.Button8Click(Sender: TObject);
begin
  u_edges.frmEdges.ShowModal;
  //u_edges.frmEdges.Show;
  refrash.Click;
end;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  i: integer;
begin
  //for i := shapeList.Count - 1 downto 0 do
  //begin
  //  tshape(shapeList.Items[i]^).Free;
  //end;
  //shapeList.Free;
  //for i := LineList.Count - 1 downto 0 do
  //begin
  //  tshape(LineList.Items[i]^).Free;
  //end;
  //LineList.Free;

  for i := shapeList.Count - 1 downto 0 do
  begin
    try
      //if i=20 then
      //  application.ProcessMessages;
      if (shapeList.Items[i]) <> nil then
        if TGraphicControl(shapeList.Items[i]) is tshape then
        begin
          tshape(shapeList.Items[i]).Visible := False;
          tshape(shapeList.Items[i]).Free;
          shapeList.Items[i] := nil;
          shapeList.Count := shapeList.Count - 1;
          application.ProcessMessages;
        end;
    except
      application.ProcessMessages;
    end;
    application.ProcessMessages;
  end;
  shapeList.Free;
  for i := lineList.Count - 1 downto 0 do
  begin
    try
      if (lineList.Items[i]) <> nil then
      begin
        tlinepoint(lineList.Items[i]).Free;
        lineList.Items[i] := nil;
        lineList.Count := lineList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  LineList.Free;

  for i := TPsubpPointList.Count - 1 downto 0 do
  begin
    try
      if (TPsubpPointList.Items[i]) <> nil then
      begin
        TPsubpPoint(TPsubpPointList.Items[i]).Free;
        TPsubpPointList.Items[i] := nil;
        TPsubpPointList.Count := TPsubpPointList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  TPsubpPointList.Clear;
  TPsubpPointList.Free;

  for i := pointList.Count - 1 downto 0 do
  begin
    try
      if (pointList.Items[i]) <> nil then
      begin
        tpointline(pointList.Items[i]).Free;
        pointList.Items[i] := nil;
        pointList.Count := pointList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  pointList.Free;
end;

procedure TMain.shiftEdgesMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  s: string;
begin
  s := '先点击清空用户项目，再点击这个按钮，然后，可以在导入地图作底图后，按住shift键不放，鼠标点击来自动批量记录坐标点，可以反复多次。然后再点击这按钮，就可以自动生成批量坐标点了。';
  s := s + #10#13 +
    '双重标志开关：先点这个按钮，再按下shift键，这两个开关，然后，鼠标左键单点，可以一次记录起点，然后ctrl键，再多个点，可以多个末点，一点对多点来自动生成多条边也';
  if (Button = mbRight) then
    ShowMessage(s);
end;

procedure TMain.shiftPointsMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  s: string;
begin
  s := '先点击清空用户项目，再点击这个按钮，然后，可以在导入地图作底图后，按住shift键不放，鼠标点击来自动批量记录坐标点，可以反复多次。然后再点击这按钮，就可以自动生成批量坐标点了。';
  s := s + #10#13 +
    '双重标志开关：先点这个按钮，再按下shift键，这两个开关，然后，鼠标左键单点，可以一次记录批量记录多个点击作为多个点坐标自动输入也';
  if (Button = mbRight) then
    ShowMessage(s);
end;

procedure TMain.TrayIcon1Click(Sender: TObject);
begin

end;

procedure TMain.updateMemoClick(Sender: TObject);
var
  pcode, varmemo: string;
begin
  pcode := tmenuitem(Sender).Hint;
  varmemo := memopoint.Hint;
  if inputquery(PChar(updatememo.Hint), '修改备注：', varmemo) then
  begin
    sqltemp.Close;
    sqltemp.SQL.Text := 'update points set memo=''' + varmemo +
      ''' where dprid=' + dprid + ' and pcode=''' + pcode + '''';
    sqltemp.ExecSQL;
    sqltransaction1.Commit;
  end;

end;
// 最快路线，可加上点权右键功能！！！！
//object PopupMenu1: TPopupMenu
//    Left = 216
//    Top = 136
//    object N1: TMenuItem
//      Caption = 设置质点的别名
//      OnClick = N1Click
//    end
//    object N2: TMenuItem
//      Caption = 设置质点的权数值
//      OnClick = N2Click
//    end
//  end
function TMain.islink(): boolean;
var
  curdirect, pcode1, pcode2: string;
  curi: integer;
  ado: TSQLQuery;
  i: integer;
begin

  Result := False;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from islink ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from islink ';
  SQLQuery1.Open;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from edges where Relation=True and dprid= ' + dprid;
  SQLQuery2.Open;
  SQLQuery2.First;
  self.ProgressBar1.Visible := True;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := GetRecordCount(SQLQuery2);
  curi := SQLQuery2.RecordCount;
  ProgressBar1.Position := 0;
  curi := 0;
  while not SQLQuery2.EOF do
  begin
    curi := curi + 1;
    ProgressBar1.Position := ProgressBar1.Position + 1;
    curdirect := SQLQuery2.FieldByName('direct').AsString;
    pcode1 := SQLQuery2.FieldByName('pcode1').AsString;
    pcode2 := SQLQuery2.FieldByName('pcode2').AsString;
    if ((pos('双向', curdirect) > 0) or (pos('无', curdirect) > 0)) then
    begin //这个常为空，草
      {
      SQLQuery1.Append;
      SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
      SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
      SQLQuery1.Post;
      SQLQuery1.Append;
      SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
      SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
      SQLQuery1.Post;
      }
    end;
    //  curi:=  pos(ansistring(curdirect),ansistring('序号从小指向大'));  //If Substr is not found, Pos returns zero.If the substr located at the first place, then return 1;
    if (pos('序号从小指向大', curdirect) > 0) then
      //if SQLQuery2.FieldByName('direct').AsString = '序号从小指向大 -->' then
    begin

      SQLQuery1.Append;
      SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
      SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
      SQLQuery1.Post;

    end
    else
    begin
      // if (pos(curdirect,'序号从大指向小')>0) then
      if (pos('序号从大指向小', curdirect) > 0) then
        //if SQLQuery2.FieldByName('direct').AsString = '序号从大指向小 <--' then
      begin

        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end
      else //'双向或者无方向<-->' 这个常为空，草
      begin
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.Post;
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end;

    end;
    SQLQuery2.Next;
  end;
  //////////////BUG 2018-05-30
  ///////如果起点与终点有一个为孤立点，则必不连通的。
  //ProgressBar1.Visible:=false;

  curi := GetRecordCount(SQLQuery1);




  //if not (SQLQuery1.UpdateStatus  in [usUnmodified]) then
  SQLQuery1.ApplyUpdates();




  //self.SQLTransaction1.Commit;
  //self.SQLTransaction1.Active := True;




  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from islink where pa=''' + beginp +
 '''  or pb=''' + beginp + '''';
  SQLQuery2.Open;
  curi := GetRecordCount(SQLQuery2);
  if GetRecordCount(SQLQuery2) <= 0 then
    exit;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from islink where pa=''' + endp +
 '''  or pb=''' + endp + '''';
  SQLQuery2.Open;
  if GetRecordCount(SQLQuery2) <= 0 then
    exit;
  /////////////BUG 2018-05-30
  ProgressBar1.Visible := True;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := 100;
  ProgressBar1.Position := 0;
  link(beginp);
  ProgressBar1.Visible := False;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from islink where pa=''' + endp +
 '''  or pb=''' + endp + '''';
  SQLQuery2.Open;
  if GetRecordCount(SQLQuery2) > 0 then
    exit;

  Result := True;

end;

function TMain.link(vpa: string): boolean;
var
  ado: TSQLQuery;
  ttt: TStringList;
  i: integer;
begin
  ProgressBar1.Position := ProgressBar1.Position + 1;
  if ProgressBar1.Position = 100 then
    ProgressBar1.Position := 1;
  ado := TSQLQuery.Create(self);
  ado.Close;
  //ado.Connection := self.ADOConnection1;
  ado.DataBase := self.SQLConnector1;
  ado.Transaction := self.SQLTransaction1;
  ado.SQL.Text :=
    'select * from  islink as www   where pa=''' + vpa + '''';
  ado.Open;
  ado.Tag := 0;
  if GetRecordCount(ado) <= 0 then
    //找到BUG了，这里有BUG，没有发出边，可能是只接收边，也是连通的！！！
    //不是今日测试实例，真的找不到此BUG，算法，人生，BUG，烦。
  begin
    //ado.Free;
    //exit;
    ado.Tag := 0;
  end
  else
  begin
    ado.Tag := GetRecordCount(ado);
    ttt := TStringList.Create;
    ado.First;
    while not ado.EOF do
    begin
      if ado.FieldByName('pb').AsString <> beginp then //debug  ///OK
        ttt.Add(ado.FieldByName('pb').AsString);

      ado.Next;
    end;
  end;
  ado.Close;
  //ado.Connection := self.ADOConnection1;
  ado.DataBase := self.SQLConnector1;
  ado.Transaction := self.SQLTransaction1;
  ado.SQL.Text := 'update islink set pa=''' + beginp + ''',pb=''' +
    beginp + ''' where pa=''' + vpa + '''';
  ado.ExecSQL;
  ado.Close;
  //ado.Connection := self.ADOConnection1;
  ado.DataBase := self.SQLConnector1;
  ado.Transaction := self.SQLTransaction1;
  ado.SQL.Text := 'update islink set pb=''' + beginp + ''' where pb=''' + vpa + '''';
  ado.ExecSQL; ///BUG
  if ado.Tag > 0 then
  begin
    for i := 0 to ttt.Count - 1 do
    begin
      link(ttt[i]);

    end;
    ttt.Free;
  end;
  ado.Free;

end;

function TMain.AllTree(curp, treePath: string; SQLConnector: TSQLConnector;
  Transaction: TSQLTransaction): boolean;
var
  ado: TSQLQuery;
  i: integer;
  s: string;
begin
  ProgressBar1.Position := ProgressBar1.Position + 1;
  if ProgressBar1.Position = 100 then
    ProgressBar1.Position := 1;
  Result := False;
  if pos(',' + curp + ',', ',' + treePath + ',') > 0 then
  begin
    //treePath := treePath + ',' + curp;
    //AllPath.Add(treePath);
    Result := True;

  end
  else
  begin
    treePath := treePath + ',' + curp;
    if curp = beginp then
    begin
      //treePath:=treePath+','+curp
      if AllPath.IndexOf(treePath) = -1 then
        AllPath.Add(treePath);
      Result := True;

    end
    else
    begin
      ado := TSQLQuery.Create(self);
      ado.Close;
      //ado.Connection := self.ADOConnection1;
      ado.DataBase := SQLConnector;
      ado.Transaction := Transaction;
      //if not SQLConnector.Connected then
      //  SQLConnector.Connected := True;
      //if not Transaction.Active then
      //  Transaction.StartTransaction;

      ado.SQL.Text := 'select * from path as pathwww where pcode="' +
        curp + '"  order by id';
      ado.Open;
      //原来PATH表中，是由pcode指向subcode，如果想由subcode指向pcode,测试不行，这未知如何改动

      ado.First;
      //s := ado.FieldByName('pcode').AsString;
      while not ado.EOF do
      begin
        //AllTree(ado.fieldbyname('subpcode').AsString, treePath + ',' +
        //  ado.fieldbyname('subpcode').AsString);
        AllTree(ado.FieldByName('subpcode').AsString, treePath,
          SQLConnector, Transaction);
        ado.Next;
      end;
      ado.Close;
      ado.Free;
      Result := True;
    end;
  end;
end;

function TMain.getFromTo(ecodePP, dirPP, pcode1PP, pcode2PP: string;
  var fromPP, toPP: string): boolean;
var
  tmpADO: TSQLquery;
  status1, status2: integer;
begin
  fromPP := '';
  toPP := '';
  if pos('序号从小指向大', dirPP) > 0 then
  begin
    toPP := pcode2PP;
    fromPP := pcode1PP;
  end
  else
  begin
    if pos('序号从大指向小', dirPP) > 0 then
    begin
      toPP := pcode1PP;
      fromPP := pcode2PP;
    end
    else
    begin
      //fromPP := '';
      //toPP := '';
      //exit;

      ////////这是双向的，BUG在此产生！！！有单向后，这里不同样了，很复杂。
      tmpADO := TSQLquery.Create(self);
      tmpADO.Close;
      tmpADO.DataBase := SQLConnector1;
      tmpADO.Transaction := SQLTransaction1;

      tmpADO.SQL.Text := 'select * from  points where  dprid=' +
        dprid + '  and pcode=''' + pcode1PP + '''';
      tmpADO.Open;
      status1 := tmpADO.FieldByName('status').AsInteger;
      tmpADO.Close;
      tmpADO.SQL.Text := 'select * from  points where  dprid=' +
        dprid + '  and pcode=''' + pcode2PP + '''';
      tmpADO.Open;
      status2 := tmpADO.FieldByName('status').AsInteger;
      //P3=2,P4=1,P3-->P4 NOT,,,P4-->P3  OOKK
      if ((status1 = 2) or (status1 = 2)) then
      begin
        toPP := pcode2PP;
        fromPP := pcode1PP;
      end;

      if ((status2 = 2) or (status2 = 2)) then
      begin
        toPP := pcode1PP;
        fromPP := pcode2PP;
      end;
      if ((status1 = 2) and (status2 = 2)) then
      begin
        fromPP := '2';
        toPP := '2';
      end;
      if ((status1 = 1) and (status2 = 1)) then
      begin
        fromPP := '1';
        toPP := '1';
      end;
      tmpADO.Close;
      tmpADO.Free;
    end;
  end;
end;

function TMain.getFromTo_Li(ecodePP, dirPP, pcode1PP, pcode2PP: string;
  var fromPP, toPP: string; TTag: integer): boolean;
var
  ado: tSQLquery;
  status1, status2: integer;
begin
  fromPP := '';
  toPP := '';
  Result := False;
  if pos('序号从小指向大', dirPP) > 0 then
  begin
    toPP := pcode2PP;
    fromPP := pcode1PP;
    Result := True;
  end
  else
  begin
    if pos('序号从大指向小', dirPP) > 0 then
    begin
      toPP := pcode1PP;
      fromPP := pcode2PP;
      Result := True;
    end
    else
    begin
      //fromPP := '';
      //toPP := '';
      //exit;
      ado := tSQLquery.Create(self);
      ado.Close;
      ado.DataBase := SQLConnector1;
      ado.Transaction := SQLTransaction1;
      ado.SQL.Text := 'select * from xpp_li   where pcode="' + pcode1PP + '" ';
      ///and dprid=' + dprid;
      ado.Open;
      //  ado.fieldbyname('lengthDy100').AsInteger;
      if self.GetRecordCount(ado) > 0 then
        ppp.Values['dist_a'] := ado.FieldByName('dist').AsString;
      ado.Close;
      ado.DataBase := SQLConnector1;
      ado.Transaction := SQLTransaction1;
      ado.SQL.Text := 'select * from xpp_li   where pcode="' + pcode2PP + '" ';
      ///and dprid=' + dprid;
      ado.Open;
      if self.GetRecordCount(ado) > 0 then
        ppp.Values['dist_b'] := ado.FieldByName('dist').AsString;
      if ppp.Values['dist_a'] = '' then
      begin
        fromPP := pcode2PP;
        toPP := pcode1PP;
        Result := True;
      end;
      if ppp.Values['dist_b'] = '' then
      begin
        fromPP := pcode1PP;
        toPP := pcode2PP;
        Result := True;
      end;
      {
      if not result then
      begin
        if strtoint(ppp.Values['CCount_a']) > strtoint(ppp.Values['CCount_b']) then
        begin
          //fromPP := pcode2PP;
          //toPP := pcode1PP;
           fromPP := pcode1PP;
           toPP := pcode2PP;
          result := true;
        end;
        if strtoint(ppp.Values['CCount_a']) < strtoint(ppp.Values['CCount_b']) then
        begin
          fromPP := pcode2PP;
          toPP := pcode1PP;
          // fromPP := pcode1PP;
          // toPP := pcode2PP;
          result := true;

        end;
        if not result then
        begin

          if strtoint(ppp.Values['CCount_a']) = strtoint(ppp.Values['CCount_b']) then
          begin
            showmessage('数据出错，联系作者');

          end;
        end;
      end; }


      ado.Free;
    end;
  end;
end;



function TMain.getLong(pa, pb: string): integer;
var
  aa, bb, edgecode: string;
  a, b: integer;
  ado: TSQLQuery;
begin

  ado := TSQLQuery.Create(self);

  Result := -1;
  aa := stringreplace(pa, 'P', '', []);
  bb := stringreplace(pb, 'P', '', []);
  //if a=b
  a := StrToInt(aa);
  b := StrToInt(bb);
  if a < b then
    edgecode := pa + pb;

  if a > b then
    edgecode := pb + pa;
  ado.Close;
  ado.DataBase := SQLConnector1;
  ado.Transaction := SQLTransaction1;
  ado.SQL.Text := 'select * from edges  where ecode="' + edgecode +
    '" and dprid=' + dprid;
  ado.Open;
  if self.GetRecordCount(ado) > 0 then
    if ado.FieldByName('lengthDy100').IsNull then
      Result := 0
    else
      Result := ado.FieldByName('lengthDy100').AsInteger;
end;

function TMain.getECode(pa, pb: string): string;
var
  aa, bb: string;
  a, b: integer;
begin
  Result := '';
  aa := stringreplace(pa, 'P', '', []);
  bb := stringreplace(pb, 'P', '', []);
  //if a=b
  a := StrToInt(aa);
  b := StrToInt(bb);
  if a < b then
  begin
    Result := pa + pb;
  end;
  if a > b then
  begin
    Result := pb + pa;
  end;

end;



procedure TMain.refreshClick(Sender: TObject);
begin
  //refreshFromSQLite(Sender);
  //refreshFromLineList(Sender);
  //refreshFromTwoList(Sender);
  //if ((lineList.Count) * (shapeList.Count) * (pointList.Count)) <> 0 then
  if ((shapeList.Count) * (pointList.Count)) <> 0 then
    //refreshFromTwoList(Sender)    // 不可滚动条
    refreshFromLineList(Sender)     // 可滚动条
  else
    refreshFromSQLite(Sender);

end;

procedure TMain.emptyfreeClick(Sender: TObject);
begin

end;

procedure TMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  AllPath.Free;
  tempList.Free;
  PPP.Free;
  shiftPointsL.Free;
  shiftEdgesL.Free;
  LabelsCaptions.Free;
  ResultPathEdgesRed.Free;
end;

procedure TMain.btn_seaLineClick(Sender: TObject);
var
  i, j, k, jj, jjj, iii, ii: integer;      //memo_seaLine
  minx, miny, maxx, maxy, curp, curp0: integer;//TPoint;
  pline, ppline: TlinePoint;
  pcode1, pcode2: string;
  pcode1Shape, pcode2Shape: tshape;
  pcode1Pointer, pcode2Pointer: tpoint;
  pcode00: array of string;
  pcode01: array of string;
  pcode02: array of string;
  minH: array of double;
  cc: integer;
  ss: string;
  ab, ac, bc, H, Sabc, minHH, minHHH, pp: real;
  p, t, aaa, bbb, ccc, pp1, pp2: tpoint;
  path, pathAlready: string;
  p1, p2, p11, p22, oneline: string;
  onelinelength, alllinelong: double;
  tempLineList: TFPList;//TPointerList;//TList;   // TlinePoint

  function wlog(w: string): integer;
  begin
    Result := 1;
    cc := citycount;
    //cc:=9;
    //cc:=9;
    if (iii > (cc - 2)) then
      //if (iii>(7)) then
      memo_seaLine.Lines.Add(w);
  end;

begin
  memo_seaLine.Lines.Clear;
  pcodeAndPointLineListFromSQL;

  minx := 0;//TPoint(PointList[0]);
  miny := minx;
  maxx := minx;
  maxy := minx;
  for i := 1 to PointList.Count - 1 do
    // PointList: TFPList;//TPointerList;//TList;  //TPointline
  begin
    if (TPointLine(PointList[i]).px < TPointLine(PointList[minx]).px) then
      minx := i;//  TPoint(PointList[i]);
    if (TPointLine(PointList[i]).py < TPointLine(PointList[miny]).py) then
      miny := i;//  TPoint(PointList[i]);
    if (TPointLine(PointList[i]).px > TPointLine(PointList[maxx]).px) then
      maxx := i;//  TPoint(PointList[i]);
    if (TPointLine(PointList[i]).py > TPointLine(PointList[maxy]).py) then
      maxy := i;//  TPoint(PointList[i]);
  end;
  memo_seaLine.Lines.Add('minx=' + pcodes[minx]);
  memo_seaLine.Lines.Add('miny=' + pcodes[miny]);
  memo_seaLine.Lines.Add('maxx=' + pcodes[maxx]);
  memo_seaLine.Lines.Add('maxy=' + pcodes[maxy]);
  application.ProcessMessages;
  memo_seaLine.Lines.Add('最外层围城线围墙：');
  for i := lineList.Count - 1 downto 0 do
  begin
    try
      //if tobject(shapeList.Items[i]) is TlinePoint then
      if lineList.Items[i] <> nil then
      begin
        TlinePoint(lineList.Items[i]).Free;
        lineList.Items[i] := nil;
        lineList.Count := lineList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  lineList.Clear;
  for i := TPsubpPointList.Count - 1 downto 0 do
  begin
    try
      if (TPsubpPointList.Items[i]) <> nil then
      begin
        TPsubpPoint(TPsubpPointList.Items[i]).Free;
        TPsubpPointList.Items[i] := nil;
        TPsubpPointList.Count := TPsubpPointList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  TPsubpPointList.Clear;

  image1.Refresh;
  /////////////////////////////////////////////////////////////////
  sealine000(minx, miny, maxx, maxy);
  ////////////////////////////////////////////////
  sleepli(2000);

  //cc := 10;
  cc := CityCount + 10;
  ss := '';
  for iii := 0 to CityCount - 1 do
  begin
    setlength(pcode00, CityCount);
    setlength(pcode01, CityCount);
    setlength(pcode02, CityCount);
    setlength(minH, CityCount);

    application.ProcessMessages;
    for i := 0 to CityCount - 1 do
    begin
      pcode00[i] := pcodes[i];
    end;
    for i := lineList.Count - 1 downto 0 do
    begin
      if lineList.Items[i] <> nil then
      begin
        for j := 0 to CityCount - 1 do
        begin
          if pcode00[j] = TlinePoint(lineList.Items[i]).beginPcode then
            pcode00[j] := '';
          if pcode00[j] = TlinePoint(lineList.Items[i]).endPcode then
            pcode00[j] := '';
        end;
        application.ProcessMessages;
      end;
    end;
    k := 0;
    if iii = 85 then
      application.ProcessMessages;
    for i := 0 to CityCount - 1 do
    begin
      if pcode00[i] <> '' then
      begin
        k := k + 1;
        minHH := 100000000;
        //  cc := 85;
        for j := 0 to lineList.Count - 1 do
        begin
          //pcode00[i]  //TlinePoint(lineList.Items[i]).beginPcode   //endPcode
          ccc.x := Tpointline(PointList[i]).px;
          ccc.y := Tpointline(PointList[i]).py;
          aaa := TlinePoint(lineList.Items[j]).beginPoint;
          bbb := TlinePoint(lineList.Items[j]).endPoint;

          ss := Tpointline(PointList[i]).Pcode;

          p11 := TlinePoint(lineList.Items[j]).beginPcode;
          p22 := TlinePoint(lineList.Items[j]).endPcode;

          wlog(ss + ':' + p11 + ':' + p22);
          jjj := 0;
          for jj := 0 to lineList.Count - 1 do
          begin
            p1 := TlinePoint(lineList.Items[jj]).beginPcode;
            p2 := TlinePoint(lineList.Items[jj]).endPcode;
            pp1 := TlinePoint(lineList.Items[jj]).beginPoint;
            pp2 := TlinePoint(lineList.Items[jj]).endPoint;

            if ((p1 = p11) and (p2 = p22)) then
              continue;
            if j = jj then continue;

            if 'P10:P3:P12::P3:P13' = ss + ':' + p11 + ':' + p22 +
            '::' + p1 + ':' + p2 then
              application.hint := ss;
            if 'P14:P18:P7::P5:P16' = ss + ':' + p11 + ':' + p22 +
            '::' + p1 + ':' + p2 then
              application.hint := ss;
            if 'P14:P9:P7::P5:P18' = ss + ':' + p11 + ':' + p22 +
            '::' + p1 + ':' + p2 then
              application.hint := ss;

            if 'P14:P18:P7:P5:P16' = ss + ':' + p11 + ':' + p22 +
            ':' + p1 + ':' + p2 then
              application.hint := ss;
            if 'P10:P3:P12::P3:P13' = ss + ':' + p11 + ':' + p22 +
            '::' + p1 + ':' + p2 then
              application.hint := ss;
            //if ((iscross(ccc, aaa, pp1, pp2, ss + ':' + p11 + ':' + ':' + p1 + ':' + p2)) or
            //  (iscross(ccc, bbb, pp1, pp2, ss + ':' + ':' + p22 + ':' + p1 + ':' + p2))) then
            if (ifcross(p1, p2, ss, p11) or ifcross(p1, p2, ss, p22)) then
            begin     // P12,P5       P10,P3,P13
              application.hint := ss;
              //continue;
              jjj := -1;
              wlog('iscross=' + p1 + ':' + p2 + '===' + ss + ':' + p11 + ':' + p22);

              if 'iscross=P9:P7===P3:P1:P2' = 'iscross=' + p1 + ':' +
                p2 + '===' + ss + ':' + p11 + ':' + p22 then
                application.hint := ss;
              break;
            end;

          end;
          if jjj = -1 then
            continue;

          ss := Tpointline(PointList[i]).Pcode;
          p1 := TlinePoint(lineList.Items[jj]).beginPcode;
          p2 := TlinePoint(lineList.Items[jj]).endPcode;
          p11 := TlinePoint(lineList.Items[j]).beginPcode;
          p22 := TlinePoint(lineList.Items[j]).endPcode;

          ab := sqrt((aaa.X - bbb.X) * (aaa.X - bbb.X) + (aaa.y - bbb.y) *
            (aaa.y - bbb.y));
          ac := sqrt((aaa.X - ccc.X) * (aaa.X - ccc.X) + (aaa.y - ccc.y) *
            (aaa.y - ccc.y));
          bc := sqrt((ccc.X - bbb.X) * (ccc.X - bbb.X) + (ccc.y - bbb.y) *
            (ccc.y - bbb.y));

          pp := (ab + ac + bc) / 2;
          Sabc := sqrt(pp * (pp - ab) * (pp - bc) * (pp - ac));
          H := Sabc / ab;
          wlog(ss + ':' + p11 + ':' + p22 + ':::' + p1 + ':' + p2 +
            '  H=' + floattostr(H));
          H := bc + ac - ab;
          if H < minHH then
          begin
            minHH := H;
            pcode1 := TlinePoint(lineList.Items[j]).beginPcode;
            pcode2 := TlinePoint(lineList.Items[j]).endPcode;

            wlog('H < minHH  ' + ss + ':' + p11 + ':' + p22 +
              ':::' + p1 + ':' + p2 + '  H=' + floattostr(H));
          end;
        end;
        ss := pcode00[i];
        pcode01[i] := pcode1;
        pcode02[i] := pcode2;
        minH[i] := minHH;
        wlog('minH[' + IntToStr(i) + ']  ' + ss + ':' + pcode1 + ':' + pcode2);

      end;
    end;
    if k = 0 then
    begin
      application.ProcessMessages;
      break;
    end;
    //if iii = cc then
    //  //// 终于找到BUG ，iii=3时，正确，iii=4时，否，正是要研究之处
    //  //// 终于找到BUG ，iii=8时，正确，iii=9时，否，正是要研究之处
    //  break;
    minHHH := 100000000;
    j := -1;
    for i := 0 to CityCount - 1 do
    begin
      if pcode00[i] <> '' then
        if minH[i] < minHHH then
        begin
          minHHH := minH[i];
          j := i;
        end;
    end;

    if j = -1 then
    begin
      application.ProcessMessages;
      break;
    end;

    pline := TlinePoint.Create(nil);
    pcode1 := pcode00[j];
    pcode2 := pcode01[j];
    wlog('minH[' + IntToStr(j) + ']  ' + pcode00[j] + ':' + pcode1 + ':' + pcode2);

    pcode1Shape := getpcode(pcode1);
    pcode2Shape := getpcode(pcode2);
    pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
    pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
    pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
    pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);

    pline.beginPcode := pcode1;
    pline.endPcode := pcode2;
    pline.direction := 'from1to2';
    pline.beginPoint := pcode1Pointer;
    pline.endPoint := pcode2Pointer;
    linelist.Add(pline);

    pline := TlinePoint.Create(nil);
    pcode1 := pcode00[j];
    pcode2 := pcode02[j];
    pcode1Shape := getpcode(pcode1);
    pcode2Shape := getpcode(pcode2);
    pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
    pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
    pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
    pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);

    pline.beginPcode := pcode1;
    pline.endPcode := pcode2;
    pline.direction := 'from1to2';
    pline.beginPoint := pcode1Pointer;
    pline.endPoint := pcode2Pointer;
    linelist.Add(pline);

    pcode1 := pcode01[j];
    pcode2 := pcode02[j];

    //for i := lineList.Count - 1 downto 0 do
    //  if (((TlinePoint(lineList.Items[i]).beginPcode = pcode01[j]) and
    //    (TlinePoint(lineList.Items[i]).endPcode = pcode02[j])) or
    //     ((TlinePoint(lineList.Items[i]).beginPcode = pcode02[j]) and
    //      (TlinePoint(lineList.Items[i]).endPcode = pcode01[j])) ) then
    //       if lineList.Items[i] <> nil then
    //    begin
    //      TlinePoint(lineList.Items[i]).Free;
    //      lineList.Items[i] := nil;
    //      lineList.Count := lineList.Count - 1;
    //      application.ProcessMessages;
    //      break;
    //    end;
    templinelist := TFPList.Create();
    for i := lineList.Count - 1 downto 0 do
    begin
      if (((TlinePoint(lineList.Items[i]).beginPcode = pcode1) and
        (TlinePoint(lineList.Items[i]).endPcode = pcode2)) or
        ((TlinePoint(lineList.Items[i]).beginPcode = pcode2) and
        (TlinePoint(lineList.Items[i]).endPcode = pcode1))) then
        continue;
      pline := TlinePoint.Create(nil);
      pline.beginPcode := TlinePoint(lineList.Items[i]).beginPcode;
      pline.endPcode := TlinePoint(lineList.Items[i]).endPcode;
      pline.direction := TlinePoint(lineList.Items[i]).direction;
      pline.beginPoint := TlinePoint(lineList.Items[i]).beginPoint;
      pline.endPoint := TlinePoint(lineList.Items[i]).endPoint;
      templinelist.Add(pline);
    end;
    application.ProcessMessages;
    for i := lineList.Count - 1 downto 0 do
    begin
      try
        //if tobject(shapeList.Items[i]) is TlinePoint then
        if lineList.Items[i] <> nil then
        begin
          TlinePoint(lineList.Items[i]).Free;
          lineList.Items[i] := nil;
          lineList.Count := lineList.Count - 1;
          application.ProcessMessages;
        end;
      except
      end;
      application.ProcessMessages;
    end;
    lineList.Clear;

    for i := templinelist.Count - 1 downto 0 do
    begin
      pline := TlinePoint.Create(nil);
      pline.beginPcode := TlinePoint(templinelist.Items[i]).beginPcode;
      pline.endPcode := TlinePoint(templinelist.Items[i]).endPcode;
      pline.direction := TlinePoint(templinelist.Items[i]).direction;
      pline.beginPoint := TlinePoint(templinelist.Items[i]).beginPoint;
      pline.endPoint := TlinePoint(templinelist.Items[i]).endPoint;
      linelist.Add(pline);
    end;
    path := '';
    oneline := '';
    onelinelength := 0.0;
    alllinelong := 0.0;
    application.ProcessMessages;
    oneline := '第' + IntToStr(iii + 1) + '层围城线围墙：点数:' +
      IntToStr(templinelist.Count);
    oneline := oneline + '==' + TlinePoint(templinelist.Items[0]).beginPcode;
    memo_seaLine.Lines.Add(oneline);

    oneline := '';
    //if (iii>(cc-2))  then
    ii := -1;
    pathAlready := ',0,';
    while ii <> 0 do
    begin
      if ii = -1 then ii := 0;
      pline := TlinePoint(templinelist.Items[ii]);
      pline.beginPcode := TlinePoint(templinelist.Items[ii]).beginPcode;
      pline.endPcode := TlinePoint(templinelist.Items[ii]).endPcode;
      onelinelength := sqrt((pline.beginPoint.x - pline.endPoint.x) *
        (pline.beginPoint.x - pline.endPoint.x) +
        (pline.beginPoint.y - pline.endPoint.y) *
        (pline.beginPoint.y - pline.endPoint.y));
      //if (iii > (cc - 2)) then
      if (templinelist.Count > (citycount - 2)) then
        oneline := oneline + pline.beginPcode + '-->' + pline.endPcode +
          ':==' + floattostr(onelinelength) + #13#10;
      alllinelong := alllinelong + onelinelength;
      if pos('-->' + pline.beginPcode + '-->', path) <= 0 then
        path := path + pline.beginPcode + '-->';
      if pos('-->' + pline.endPcode + '-->', path) <= 0 then
        path := path + pline.endPcode + '-->';
      for i := templinelist.Count - 1 downto 0 do
      begin
        if pos(',' + IntToStr(i) + ',', pathAlready) > 0 then
          continue;
        ppline := TlinePoint(templinelist.Items[i]);
        ppline.beginPcode := TlinePoint(templinelist.Items[i]).beginPcode;
        ppline.endPcode := TlinePoint(templinelist.Items[i]).endPcode;
        if ((ppline.beginPcode = pline.endPcode) and
          (ppline.endPcode <> pline.beginPcode)) then
          break;
        if ((ppline.endPcode = pline.endPcode) and
          (ppline.beginPcode <> pline.beginPcode)) then
          break;
        if ((ppline.beginPcode = pline.beginPcode) and
          (ppline.endPcode <> pline.endPcode)) then
          break;
        if ((ppline.endPcode = pline.beginPcode) and
          (ppline.beginPcode <> pline.endPcode)) then
          break;
      end;
      pathAlready := pathAlready + IntToStr(i) + ',';
      ii := i;

    end;

    //  if (iii > (cc - 2)) then
    if (templinelist.Count > (citycount - 2)) then
    begin
      memo_seaLine.Lines.Add(path);
    end;
    memo_seaLine.Lines.Add('路径总长：' + floattostr(alllinelong));

    //if (iii > (cc - 2)) then
    if (templinelist.Count > (citycount - 2)) then
      memo_seaLine.Lines.Add(oneline);
    //if (iii > (cc - 2)) then
    if (templinelist.Count > (citycount - 2)) then
      memo_seaLine.Lines.Add('=======================');

    for i := templinelist.Count - 1 downto 0 do
    begin
      try
        //if tobject(shapeList.Items[i]) is TlinePoint then
        if templinelist.Items[i] <> nil then
        begin
          TlinePoint(templinelist.Items[i]).Free;
          templinelist.Items[i] := nil;
          templinelist.Count := templinelist.Count - 1;
          application.ProcessMessages;
        end;
      except
      end;
      application.ProcessMessages;
    end;
    templinelist.Clear;
    templinelist.Free;

  end;

  ///////////////////////////////////////////////////////////////////
  ////非TLine控件，所以canvas.drawline在超出屏幕坐标产生滚动条时，就难看到了
  refreshFromLineList(nil);
end;



procedure TMain.btn_seaLineLineClick(Sender: TObject); //layer storey  floor
var
  i, j, k, jj, jjj, iii, ii: integer;      //memo_seaLine
  minx0, miny0, maxx0, maxy0: integer;//TPoint;
  //curp, curp0: integer;
  pline, ppline: TlinePoint;
  //pcode1, pcode2: string;
  //pcode1Shape, pcode2Shape: tshape;
  //pcode1Pointer, pcode2Pointer: tpoint;
  //pcode00: array of string;
  //pcode01: array of string;
  //pcode02: array of string;
  minH, curminH, onelong, alllong: double;
  cc: integer;
  ss: string;
  //ab, ac, bc, H, Sabc, minHH, minHHH, pp: real;
  //p, t, aaa, bbb, ccc, pp1, pp2: tpoint;
  //path, pathAlready: string;
  //p1, p2, p11, p22, oneline: string;
  //onelinelength, alllinelong: double;
  tempLineList: TFPList;//TPointerList;//TList;   // TlinePoint
  storeyLineList: array of TStringList;//TPointerList;//TList;   // TlinePoint

  function PPLong(a, b: Tpoint): double;
  begin
    Result := 0.0;
    Result := sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y));
  end;

  function wlog(w: string): integer;
  begin
    Result := 1;
    cc := citycount;
    //cc:=9;
    //cc:=9;
    if (iii > (cc - 2)) then
      //if (iii>(7)) then
      memo_seaLine.Lines.Add(w);
  end;

  function sealineLayer(minx, miny, maxx, maxy: integer): integer;
  var
    i, j, curTOPstorey: integer;      //memo_seaLine
    curp, curp0, tempnextp: integer;//TPoint;
    pline: TlinePoint;
    pcode1, pcode2: string;
    pcode1Shape, pcode2Shape: tshape;
    pcode1Pointer, pcode2Pointer: tpoint;
    path: string;
    //tempLineList: TFPList;/
    // minx, miny, maxx, maxy: integer;
  begin
    for i := 0 to PointList.Count - 1 do
      if TPointLine(PointList[i]).floor = -1 then
        break;
    minx := i;//TPoint(PointList[0]);
    miny := minx;
    maxx := minx;
    maxy := minx;
    for i := 0 to PointList.Count - 1 do
      // PointList: TFPList;//TPointerList;//TList;  //TPointline
      if TPointLine(PointList[i]).floor = -1 then
      begin
        // ss:= TPointLine(PointList[i]).pcode;
        if TPointLine(PointList[i]).pcode = 'P9' then
          application.ProcessMessages;
        if (TPointLine(PointList[i]).px < TPointLine(PointList[minx]).px) then
          minx := i;//  TPoint(PointList[i]);
        if (TPointLine(PointList[i]).py < TPointLine(PointList[miny]).py) then
          miny := i;//  TPoint(PointList[i]);
        if (TPointLine(PointList[i]).px > TPointLine(PointList[maxx]).px) then
          maxx := i;//  TPoint(PointList[i]);
        if (TPointLine(PointList[i]).py > TPointLine(PointList[maxy]).py) then
          maxy := i;//  TPoint(PointList[i]);
      end;
    memo_seaLine.Lines.Add('第' + IntToStr(length(storeyLineList) + 1) +
      '层围城线围墙：');
    memo_seaLine.Lines.Add('minx=' + pcodes[minx]);
    memo_seaLine.Lines.Add('miny=' + pcodes[miny]);
    memo_seaLine.Lines.Add('maxx=' + pcodes[maxx]);
    memo_seaLine.Lines.Add('maxy=' + pcodes[maxy]);
    application.ProcessMessages;
    //tempLineList:=TFPList.Create;//TPointerList;//TList;   // TlinePoint
    curTOPstorey := length(storeyLineList);
    setlength(storeyLineList, curTOPstorey + 1);
    storeyLineList[curTOPstorey] := TStringList.Create;
    //////////////////////////////////////
    application.ProcessMessages;
    curp := minx;
    curp0 := -1;
    path := '';
    while curp0 <> curp do
    begin
      //if curp<>-1 then
      curp0 := curp;
      for i := 0 to PointList.Count - 1 do
        if TPointLine(PointList[i]).floor = -1 then
        begin
          if (TPointLine(PointList[i]).px > TPointLine(PointList[miny]).px) then
            continue;
          if (TPointLine(PointList[i]).py > TPointLine(PointList[curp0]).py) then
            continue;
          if (TPointLine(PointList[i]).px = TPointLine(PointList[miny]).px) then
            continue;
          if (TPointLine(PointList[i]).py = TPointLine(PointList[curp0]).py) then
            continue;
          if (i = curp0) then
          begin
            //curp := i;
            continue;
          end;

          if (curp0 <> curp) then
          begin
            if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
              ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
            begin
              curp := i;

            end;
          end
          else
            curp := i;

        end;

      if curp0 <> curp then
      begin
        if pos('-->' + pcodes[curp0] + '-->', path) <= 0 then
          path := path + '-->' + pcodes[curp0] + '-->';
        if pos('-->' + pcodes[curp] + '-->', path) <= 0 then
          path := path + '-->' + pcodes[curp] + '-->';
        pline := TlinePoint.Create(nil);
        pcode1 := pcodes[curp0];
        pcode2 := pcodes[curp];
        pcode1Shape := getpcode(pcode1);
        pcode2Shape := getpcode(pcode2);
        pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
        pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
        pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
        pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
        //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

        if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
        begin
          ScrollBox1.Canvas.pen.color := clHighlight;//clred;
          ScrollBox1.Canvas.pen.Width := 4;
        end
        else
        begin
          ScrollBox1.Canvas.pen.color := clgrayText;
          ScrollBox1.Canvas.pen.Width := 2;
        end;


        self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok

        pline.beginPcode := pcode1;
        pline.endPcode := pcode2;
        pline.beginPoint := pcode1Pointer;
        pline.endPoint := pcode2Pointer;
        pline.floor := curTOPstorey;
        LineList.Add(pline);
        //storeyLineList.Add(pline);
        if storeyLineList[curTOPstorey].IndexOf(pline.beginPcode) <= 0 then
          storeyLineList[curTOPstorey].add(pline.beginPcode);
        if storeyLineList[curTOPstorey].IndexOf(pline.endPcode) <= 0 then
          storeyLineList[curTOPstorey].add(pline.endPcode);
        TPointLine(pointlist[curp]).floor := curTOPstorey;
        //TlinePoint(linelist[i]).floor:=length(storeyLineList) + 1;
      end;
    end;
    if pos('-->' + pcodes[curp] + '-->', path) <= 0 then
      path := path + '-->' + pcodes[curp] + '-->';
    if pos('-->' + pcodes[miny] + '-->', path) <= 0 then
      path := path + '-->' + pcodes[miny] + '-->';
    if miny <> curp then
    begin
      pline := TlinePoint.Create(nil);
      pcode1 := pcodes[curp];
      pcode2 := pcodes[miny];
      pcode1Shape := getpcode(pcode1);
      pcode2Shape := getpcode(pcode2);
      pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
      pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
      pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
      pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
      //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

      if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
      begin
        ScrollBox1.Canvas.pen.color := clHighlight;//clred;
        ScrollBox1.Canvas.pen.Width := 4;
      end
      else
      begin
        ScrollBox1.Canvas.pen.color := clgrayText;
        ScrollBox1.Canvas.pen.Width := 2;
      end;


      self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok

      pline.beginPcode := pcode1;
      pline.endPcode := pcode2;
      pline.beginPoint := pcode1Pointer;
      pline.endPoint := pcode2Pointer;
      pline.floor := curTOPstorey;
      linelist.Add(pline);
      if storeyLineList[curTOPstorey].IndexOf(pline.beginPcode) <= 0 then
        storeyLineList[curTOPstorey].add(pline.beginPcode);
      if storeyLineList[curTOPstorey].IndexOf(pline.endPcode) <= 0 then
        storeyLineList[curTOPstorey].add(pline.endPcode);
    end;
    TPointLine(pointlist[miny]).floor := curTOPstorey;
    memo_seaLine.Lines.Add('1:' + path);
    application.ProcessMessages;
    ///////////////////////////////////////////////////////////////////

    application.ProcessMessages;
    curp := miny;
    curp0 := -1;
    path := '';
    while curp0 <> curp do
    begin
      curp0 := curp;
      for i := 0 to PointList.Count - 1 do
        if TPointLine(PointList[i]).floor = -1 then
        begin

          if (TPointLine(PointList[i]).px < TPointLine(PointList[curp0]).px) then
            continue;
          if (TPointLine(PointList[i]).py > TPointLine(PointList[maxx]).py) then
            continue;
          if (TPointLine(PointList[i]).px = TPointLine(PointList[maxx]).px) then
            continue;
          if (TPointLine(PointList[i]).py = TPointLine(PointList[curp0]).py) then
            continue;


          if (i = curp0) then
          begin
            continue;
          end;

          if (curp0 <> curp) then
          begin
            if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
              ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
            begin
              curp := i;

            end;
          end
          else
            curp := i;

        end;
      if curp0 <> curp then
      begin
        if pos('-->' + pcodes[curp0] + '-->', path) <= 0 then
          path := path + '-->' + pcodes[curp0] + '-->';
        if pos('-->' + pcodes[curp] + '-->', path) <= 0 then
          path := path + '-->' + pcodes[curp] + '-->';
        pline := TlinePoint.Create(nil);
        pcode1 := pcodes[curp0];
        pcode2 := pcodes[curp];
        pcode1Shape := getpcode(pcode1);
        pcode2Shape := getpcode(pcode2);
        pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
        pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
        pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
        pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
        //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

        if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
        begin
          ScrollBox1.Canvas.pen.color := clHighlight;//clred;
          ScrollBox1.Canvas.pen.Width := 4;
        end
        else
        begin
          ScrollBox1.Canvas.pen.color := clgrayText;
          ScrollBox1.Canvas.pen.Width := 2;
        end;


        self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok

        pline.beginPcode := pcode1;
        pline.endPcode := pcode2;
        pline.beginPoint := pcode1Pointer;
        pline.endPoint := pcode2Pointer;
        pline.floor := curTOPstorey;
        linelist.Add(pline);
        if storeyLineList[curTOPstorey].IndexOf(pline.beginPcode) <= 0 then
          storeyLineList[curTOPstorey].add(pline.beginPcode);
        if storeyLineList[curTOPstorey].IndexOf(pline.endPcode) <= 0 then
          storeyLineList[curTOPstorey].add(pline.endPcode);
        TPointLine(pointlist[curp]).floor := curTOPstorey;
      end;

    end;
    if pos('-->' + pcodes[curp] + '-->', path) <= 0 then
      path := path + '-->' + pcodes[curp] + '-->';
    if pos('-->' + pcodes[maxx] + '-->', path) <= 0 then
      path := path + '-->' + pcodes[maxx] + '-->';
    if maxx <> curp then
    begin
      pline := TlinePoint.Create(nil);
      pcode1 := pcodes[curp];
      pcode2 := pcodes[maxx];
      pcode1Shape := getpcode(pcode1);
      pcode2Shape := getpcode(pcode2);
      pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
      pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
      pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
      pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
      //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

      if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
      begin
        ScrollBox1.Canvas.pen.color := clHighlight;//clred;
        ScrollBox1.Canvas.pen.Width := 4;
      end
      else
      begin
        ScrollBox1.Canvas.pen.color := clgrayText;
        ScrollBox1.Canvas.pen.Width := 2;
      end;


      self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok

      pline.beginPcode := pcode1;
      pline.endPcode := pcode2;
      pline.beginPoint := pcode1Pointer;
      pline.endPoint := pcode2Pointer;
      pline.floor := curTOPstorey;
      linelist.Add(pline);
      if storeyLineList[curTOPstorey].IndexOf(pline.beginPcode) <= 0 then
        storeyLineList[curTOPstorey].add(pline.beginPcode);
      if storeyLineList[curTOPstorey].IndexOf(pline.endPcode) <= 0 then
        storeyLineList[curTOPstorey].add(pline.endPcode);

    end;
    TPointLine(pointlist[maxx]).floor := curTOPstorey;
    //path := path + '-->' + pcode2;
    memo_seaLine.Lines.Add('2:' + path);
    application.ProcessMessages;
    ////////////////////////////////////////////////////////////////////
    application.ProcessMessages;
    curp := maxx;
    curp0 := -1;
    path := '';
    while curp0 <> curp do
    begin
      curp0 := curp;
      //for i := 0 to PointList.Count - 1 do
      for i := PointList.Count - 1 downto 0 do
        if TPointLine(PointList[i]).floor = -1 then
        begin

          if (TPointLine(PointList[i]).px < TPointLine(PointList[maxy]).px) then
            continue;
          if (TPointLine(PointList[i]).py < TPointLine(PointList[curp0]).py) then
            continue;
          if (TPointLine(PointList[i]).px = TPointLine(PointList[curp0]).px) then
            continue;
          if (TPointLine(PointList[i]).py = TPointLine(PointList[maxy]).py) then
            continue;


          if (i = curp0) then
          begin
            continue;
          end;

          if (curp0 <> curp) then
          begin
            if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
              ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
            begin
              curp := i;

            end;
          end
          else
            curp := i;

        end;
      if curp0 <> curp then
      begin
        if pos('-->' + pcodes[curp0] + '-->', path) <= 0 then
          path := path + '-->' + pcodes[curp0] + '-->';
        if pos('-->' + pcodes[curp] + '-->', path) <= 0 then
          path := path + '-->' + pcodes[curp] + '-->';
        pline := TlinePoint.Create(nil);
        pcode1 := pcodes[curp0];
        pcode2 := pcodes[curp];
        pcode1Shape := getpcode(pcode1);
        pcode2Shape := getpcode(pcode2);
        pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
        pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
        pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
        pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
        //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

        if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
        begin
          ScrollBox1.Canvas.pen.color := clHighlight;//clred;
          ScrollBox1.Canvas.pen.Width := 4;
        end
        else
        begin
          ScrollBox1.Canvas.pen.color := clgrayText;
          ScrollBox1.Canvas.pen.Width := 2;
        end;


        self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok

        pline.beginPcode := pcode1;
        pline.endPcode := pcode2;
        pline.beginPoint := pcode1Pointer;
        pline.endPoint := pcode2Pointer;
        pline.floor := curTOPstorey;
        linelist.Add(pline);
        if storeyLineList[curTOPstorey].IndexOf(pline.beginPcode) <= 0 then
          storeyLineList[curTOPstorey].add(pline.beginPcode);
        if storeyLineList[curTOPstorey].IndexOf(pline.endPcode) <= 0 then
          storeyLineList[curTOPstorey].add(pline.endPcode);
        TPointLine(pointlist[curp]).floor := curTOPstorey;
      end;

    end;
    if pos('-->' + pcodes[curp] + '-->', path) <= 0 then
      path := path + '-->' + pcodes[curp] + '-->';
    if pos('-->' + pcodes[maxy] + '-->', path) <= 0 then
      path := path + '-->' + pcodes[maxy] + '-->';
    if maxy <> curp then
    begin
      pline := TlinePoint.Create(nil);
      pcode1 := pcodes[curp];
      pcode2 := pcodes[maxy];
      pcode1Shape := getpcode(pcode1);
      pcode2Shape := getpcode(pcode2);
      pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
      pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
      pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
      pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
      //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

      if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
      begin
        ScrollBox1.Canvas.pen.color := clHighlight;//clred;
        ScrollBox1.Canvas.pen.Width := 4;
      end
      else
      begin
        ScrollBox1.Canvas.pen.color := clgrayText;
        ScrollBox1.Canvas.pen.Width := 2;
      end;


      self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok

      pline.beginPcode := pcode1;
      pline.endPcode := pcode2;
      pline.beginPoint := pcode1Pointer;
      pline.endPoint := pcode2Pointer;
      pline.floor := curTOPstorey;
      linelist.Add(pline);
      if storeyLineList[curTOPstorey].IndexOf(pline.beginPcode) <= 0 then
        storeyLineList[curTOPstorey].add(pline.beginPcode);
      if storeyLineList[curTOPstorey].IndexOf(pline.endPcode) <= 0 then
        storeyLineList[curTOPstorey].add(pline.endPcode);

    end;
    TPointLine(pointlist[maxy]).floor := curTOPstorey;
    //path := path + '-->' + pcode2;
    memo_seaLine.Lines.Add('3:' + path);
    application.ProcessMessages;
    //////////////////////////////////////
    application.ProcessMessages;
    curp := maxy;
    curp0 := -1;
    path := '';
    // tempnextp := -1;
    while curp0 <> curp do
    begin
      curp0 := curp;
      //for i := 0 to PointList.Count - 1 do
      for i := PointList.Count - 1 downto 0 do
        if TPointLine(PointList[i]).floor = -1 then
        begin
          //memo_seaLine.Lines.Add('i:'+TPointLine(PointList[i]).pcode);
          // memo_seaLine.Lines.Add('curp:'+TPointLine(PointList[curp]).pcode);
          //memo_seaLine.Lines.Add('minx:'+TPointLine(PointList[minx]).pcode);
          if TPointLine(PointList[i]).pcode = 'P9' then
            application.ProcessMessages;

          if (TPointLine(PointList[i]).px > TPointLine(PointList[curp0]).px) then
            continue;
          if (TPointLine(PointList[i]).px = TPointLine(PointList[curp0]).px) then
            continue;
          if (TPointLine(PointList[i]).py < TPointLine(PointList[minx]).py) then
            continue;

          if (TPointLine(PointList[i]).py = TPointLine(PointList[minx]).py) then
            continue;


          if (i = curp0) then
          begin
            continue;
          end;

          if (curp0 <> curp) then
          begin

            //memo_seaLine.Lines.Add('curp0 <> curp   i:' + TPointLine(
            //  PointList[i]).pcode + '-->' + TPointLine(PointList[curp0]).pcode);
            //memo_seaLine.Lines.Add('curp0 <> curp   curp:' +
            //  TPointLine(PointList[curp]).pcode + '-->' + TPointLine(PointList[curp0]).pcode);

            if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
              ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
            begin
              curp := i;
              //showmessage(TPointLine(PointList[curp]).pcode+'-->'+TPointLine(PointList[curp0]).pcode);
              // memo_seaLine.Lines.Add(TPointLine(PointList[curp]).pcode+'-->'+TPointLine(PointList[curp0]).pcode);
              // memo_seaLine.Lines.Add('curp0 <> curp    curp := i;');
              if TPointLine(PointList[i]).pcode = 'P9' then
                application.ProcessMessages;
            end;
          end
          else
          begin
            curp := i;
            // tempnext:=i;


            //memo_seaLine.Lines.Add('curp0 =curp  curp := i;');
          end;

        end;
      if curp0 <> curp then
      begin
        if pos('-->' + pcodes[curp0] + '-->', path) <= 0 then
          path := path + '-->' + pcodes[curp0] + '-->';
        if pos('-->' + pcodes[curp] + '-->', path) <= 0 then
          path := path + '-->' + pcodes[curp] + '-->';
        pline := TlinePoint.Create(nil);
        pcode1 := pcodes[curp0];
        pcode2 := pcodes[curp];
        pcode1Shape := getpcode(pcode1);
        pcode2Shape := getpcode(pcode2);
        pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
        pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
        pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
        pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
        //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

        if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
        begin
          ScrollBox1.Canvas.pen.color := clHighlight;//clred;
          ScrollBox1.Canvas.pen.Width := 4;
        end
        else
        begin
          ScrollBox1.Canvas.pen.color := clgrayText;
          ScrollBox1.Canvas.pen.Width := 2;
        end;


        self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok

        pline.beginPcode := pcode1;
        pline.endPcode := pcode2;
        pline.beginPoint := pcode1Pointer;
        pline.endPoint := pcode2Pointer;
        pline.floor := curTOPstorey;
        linelist.Add(pline);
        if storeyLineList[curTOPstorey].IndexOf(pline.beginPcode) <= 0 then
          storeyLineList[curTOPstorey].add(pline.beginPcode);
        if storeyLineList[curTOPstorey].IndexOf(pline.endPcode) <= 0 then
          storeyLineList[curTOPstorey].add(pline.endPcode);
        TPointLine(pointlist[curp]).floor := curTOPstorey;
        if TPointLine(PointList[curp]).pcode = 'P9' then
          application.ProcessMessages;
      end;

    end;
    if pos('-->' + pcodes[curp] + '-->', path) <= 0 then
      path := path + '-->' + pcodes[curp] + '-->';
    if pos('-->' + pcodes[minx] + '-->', path) <= 0 then
      path := path + '-->' + pcodes[minx] + '-->';
    if minx <> curp then
    begin
      pline := TlinePoint.Create(nil);
      pcode1 := pcodes[curp];
      pcode2 := pcodes[minx];
      pcode1Shape := getpcode(pcode1);
      pcode2Shape := getpcode(pcode2);
      pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
      pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
      pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
      pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
      //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

      if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
      begin
        ScrollBox1.Canvas.pen.color := clHighlight;//clred;
        ScrollBox1.Canvas.pen.Width := 4;
      end
      else
      begin
        ScrollBox1.Canvas.pen.color := clgrayText;
        ScrollBox1.Canvas.pen.Width := 2;
      end;


      self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok

      pline.beginPcode := pcode1;
      pline.endPcode := pcode2;
      pline.beginPoint := pcode1Pointer;
      pline.endPoint := pcode2Pointer;
      pline.floor := curTOPstorey;
      linelist.Add(pline);
      if storeyLineList[curTOPstorey].IndexOf(pline.beginPcode) <= 0 then
        storeyLineList[curTOPstorey].add(pline.beginPcode);
      if storeyLineList[curTOPstorey].IndexOf(pline.endPcode) <= 0 then
        storeyLineList[curTOPstorey].add(pline.endPcode);

    end;
    TPointLine(pointlist[minx]).floor := curTOPstorey;
    //path := path + '-->' + pcode2;
    memo_seaLine.Lines.Add('4:' + path);
    application.ProcessMessages;
    //////////////////////////////////////
    TPointLine(pointlist[miny]).floor := curTOPstorey;
    TPointLine(pointlist[maxx]).floor := curTOPstorey;
    TPointLine(pointlist[maxy]).floor := curTOPstorey;
    TPointLine(pointlist[minx]).floor := curTOPstorey;
    //for j := 0 to linelist.Count - 1 do
    //begin
    //  if  storeyLineList[i].IndexOf(TlinePoint(linelist[j]).beginPcode)<=0 then
    //  storeyLineList[i].add(TlinePoint(linelist[j]).beginPcode);
    //  if  storeyLineList[i].IndexOf(TlinePoint(linelist[j]).endPcode)<=0 then
    //  storeyLineList[i].add(TlinePoint(linelist[j]).endPcode);
    //end;

    ///////////////////////////////////////////////////////////////////
    //refreshFromLineList(nil);
  end;

begin
  memo_seaLine.Lines.Clear;
  pcodeAndPointLineListFromSQL;
  for i := 1 to PointList.Count - 1 do
    TPointLine(PointList[i]).floor := -1;
  for i := 1 to lineList.Count - 1 do
    TLinePoint(lineList[i]).floor := -1;
  minx0 := 0;//TPoint(PointList[0]);
  miny0 := minx0;
  maxx0 := minx0;
  maxy0 := minx0;
  for i := 1 to PointList.Count - 1 do
    // PointList: TFPList;//TPointerList;//TList;  //TPointline

  begin
    if (TPointLine(PointList[i]).px < TPointLine(PointList[minx0]).px) then
      minx0 := i;//  TPoint(PointList[i]);
    if (TPointLine(PointList[i]).py < TPointLine(PointList[miny0]).py) then
      miny0 := i;//  TPoint(PointList[i]);
    if (TPointLine(PointList[i]).px > TPointLine(PointList[maxx0]).px) then
      maxx0 := i;//  TPoint(PointList[i]);
    if (TPointLine(PointList[i]).py > TPointLine(PointList[maxy0]).py) then
      maxy0 := i;//  TPoint(PointList[i]);
  end;
  memo_seaLine.Lines.Add('minx=' + pcodes[minx0]);
  memo_seaLine.Lines.Add('miny=' + pcodes[miny0]);
  memo_seaLine.Lines.Add('maxx=' + pcodes[maxx0]);
  memo_seaLine.Lines.Add('maxy=' + pcodes[maxy0]);
  application.ProcessMessages;
  memo_seaLine.Lines.Add('最外层围城线围墙：');
  for i := lineList.Count - 1 downto 0 do
  begin
    try
      //if tobject(shapeList.Items[i]) is TlinePoint then
      if lineList.Items[i] <> nil then
      begin
        TlinePoint(lineList.Items[i]).Free;
        lineList.Items[i] := nil;
        lineList.Count := lineList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  lineList.Clear;
  for i := TPsubpPointList.Count - 1 downto 0 do
  begin
    try
      if (TPsubpPointList.Items[i]) <> nil then
      begin
        TPsubpPoint(TPsubpPointList.Items[i]).Free;
        TPsubpPointList.Items[i] := nil;
        TPsubpPointList.Count := TPsubpPointList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  TPsubpPointList.Clear;

  image1.Refresh;
  /////////////////////////////////////////////////////////////////
  sealine000(minx0, miny0, maxx0, maxy0);
  ////////////////////////////////////////////////
  setlength(storeyLineList, 1);
  storeyLineList[0] := TStringList.Create;
  for i := 0 to linelist.Count - 1 do
  begin
    if storeyLineList[0].IndexOf(TlinePoint(linelist[i]).beginPcode) <= 0 then
      storeyLineList[0].add(TlinePoint(linelist[i]).beginPcode);
    if storeyLineList[0].IndexOf(TlinePoint(linelist[i]).endPcode) <= 0 then
      storeyLineList[0].add(TlinePoint(linelist[i]).endPcode);
    TlinePoint(linelist[i]).floor := 0;
    // TPointLine(pointlist[getPcodeIndex(TlinePoint(linelist[i]).beginPcode)]).floor := 0 ;
    // TPointLine(pointlist[getPcodeIndex(TlinePoint(linelist[i]).endPcode)]).floor := 0 ;
  end;

  ss := storeyLineList[0].Text;
  //for i := 0 to pointlist.Count - 1 do
  //begin
  //  if  TPointLine(pointlist[i]).Pcode='P3' then
  //  application.ProcessMessages;
  //  ss:= TPointLine(pointlist[i]).Pcode ;
  //  j:= TPointLine(pointlist[i]).floor;
  //  application.ProcessMessages;
  ////  if storeyLineList[0].IndexOf(TPointLine(pointlist[i]).Pcode) <= 0 then
  // //   TPointLine(pointlist[i]).floor := 0
  // // else
  //  //  TPointLine(pointlist[i]).floor := -1;
  //end;
  for i := 0 to storeyLineList[0].Count - 1 do
  begin
    ss := (storeyLineList[0][i]);
    if ss = 'P1' then
      application.ProcessMessages;
    j := getPcodeIndex(ss);
    TPointLine(pointlist[j]).floor := 0;
    // ss := TlinePoint(storeyLineList[0][i]).endPcode;
    // j := getPcodeIndex(ss);
    // TPointLine(pointlist[j]).floor := 0;
  end;
  TPointLine(pointlist[miny0]).floor := 0;
  TPointLine(pointlist[maxx0]).floor := 0;
  TPointLine(pointlist[maxy0]).floor := 0;
  TPointLine(pointlist[minx0]).floor := 0;
  /////////////////////////
  i := 2;
  while i > 1 do
  begin
    i := 0;
    for j := 0 to pointlist.Count - 1 do
      if TPointLine(pointlist[j]).floor = -1 then
        I := i + 1;

    if i > 1 then
      seaLineLayer(0, 0, 0, 0);

  end;
  ////////////////////////
  // for j := low(storeyLineList) to high(storeyLineList) do
  //   storeyLineList[j].Free;


  for i := 0 to length(storeyLineList) - 2 do
  begin
    minH := 10000000;
    ii := -1;
    iii := -1;

    for j := 0 to pointList.Count - 1 do
    begin
      jjj := -1;
      for k := 0 to LineList.Count - 1 do
        if (TlinePoint(linelist[j]).floor = (i + 1)) then   //      j in   high
          if (TlinePoint(linelist[k]).floor = (i)) then     //      k  out lower
          begin
            curminH := (PPLong(TlinePoint(linelist[j]).beginPoint,
              TlinePoint(linelist[k]).beginPoint) + PPLong(
              TlinePoint(linelist[j]).beginPoint,
              TlinePoint(linelist[k]).endPoint) - PPLong(
              TlinePoint(linelist[k]).beginPoint, TlinePoint(linelist[k]).endPoint));
            if curminH < minH then
            begin
              minH := curminH;
              ii := j;    //ii  j    in   high
              iii := k;   //iii   k  out  lower
              jjj := 1;
            end;

          end;
      /////////////////////////////////////////
      if jjj = 1 then
      begin
        pline := TlinePoint.Create(nil);
        pline.beginPcode := TlinePoint(linelist[ii]).beginPcode;
        pline.endPcode := TlinePoint(linelist[iii]).beginPcode;
        pline.beginPoint := TlinePoint(linelist[ii]).beginPoint;
        pline.endPoint := TlinePoint(linelist[iii]).beginPoint;
        // pline.floor := curTOPstorey;
        linelist.Add(pline);
        //   memo_seaLine.Lines.Add('storye=' + IntToStr(jjj) + ':' + 'L' +
        //    IntToStr(ii) + 'L' + IntToStr(iii) + ':' + pline.beginPcode + pline.endPcode);
        pline := TlinePoint.Create(nil);
        pline.beginPcode := TlinePoint(linelist[iii]).endPcode;
        pline.endPcode := TlinePoint(linelist[ii]).beginPcode;
        pline.beginPoint := TlinePoint(linelist[iii]).endPoint;
        pline.endPoint := TlinePoint(linelist[ii]).beginPoint;
        // pline.floor := curTOPstorey;
        linelist.Add(pline);
        // memo_seaLine.Lines.Add('storye=' + IntToStr(jjj) + ':' + 'L' +
        //   IntToStr(ii) + 'L' + IntToStr(iii) + ':' + pline.beginPcode + pline.endPcode);
        //TlinePoint(linelist[ii]).Free;
        //TlinePoint(linelist[iii]).Free;
        memo_seaLine.Lines.Add(TlinePoint(linelist[ii]).beginPcode +
          TlinePoint(linelist[ii]).endPcode + '$$' +
          TlinePoint(linelist[iii]).beginPcode + TlinePoint(linelist[iii]).endPcode);
        TlinePoint(linelist[ii]).floor := -111;
        TlinePoint(linelist[iii]).floor := -111;
      end;


      if jjj = 2 then
      begin
        pline := TlinePoint.Create(nil);
        pline.beginPcode := TlinePoint(linelist[ii]).beginPcode;
        pline.endPcode := TlinePoint(linelist[iii]).endPcode;
        pline.beginPoint := TlinePoint(linelist[ii]).beginPoint;
        pline.endPoint := TlinePoint(linelist[iii]).endPoint;
        // pline.floor := curTOPstorey;
        linelist.Add(pline);
        //   memo_seaLine.Lines.Add('storye=' + IntToStr(jjj) + ':' + 'L' +
        //     IntToStr(ii) + 'L' + IntToStr(iii) + ':' + pline.beginPcode + pline.endPcode);
        pline := TlinePoint.Create(nil);
        pline.beginPcode := TlinePoint(linelist[ii]).endPcode;
        pline.endPcode := TlinePoint(linelist[iii]).beginPcode;
        pline.beginPoint := TlinePoint(linelist[ii]).endPoint;
        pline.endPoint := TlinePoint(linelist[iii]).beginPoint;
        // pline.floor := curTOPstorey;
        linelist.Add(pline);
        //  memo_seaLine.Lines.Add('storye=' + IntToStr(jjj) + ':' + 'L' +
        //    IntToStr(ii) + 'L' + IntToStr(iii) + ':' + pline.beginPcode + pline.endPcode);
        memo_seaLine.Lines.Add(TlinePoint(linelist[ii]).beginPcode +
          TlinePoint(linelist[ii]).endPcode + '$$' +
          TlinePoint(linelist[iii]).beginPcode + TlinePoint(linelist[iii]).endPcode);

        //          TlinePoint(linelist[ii]).Free;
        //      TlinePoint(linelist[iii]).Free;
        TlinePoint(linelist[ii]).floor := -111;
        TlinePoint(linelist[iii]).floor := -111;
      end;

    end;
    ///////////////////////////////////////////
  end;
  tempLineList := TFPList.Create;


  for i := lineList.Count - 1 downto 0 do
  begin
    try
      if TlinePoint(linelist[i]).floor <> -111 then
      begin
        pline := TlinePoint.Create(nil);
        pline.beginPcode := TlinePoint(linelist[i]).beginPcode;
        pline.endPcode := TlinePoint(linelist[i]).endPcode;
        pline.beginPoint := TlinePoint(linelist[i]).beginPoint;
        pline.endPoint := TlinePoint(linelist[i]).endPoint;
        // pline.floor := curTOPstorey;
        tempLineList.Add(pline);
      end;
    except
    end;
    application.ProcessMessages;
  end;




  for i := lineList.Count - 1 downto 0 do
  begin
    try
      // if TlinePoint(linelist[i]).floor<>-111 then
      if lineList.Items[i] <> nil then
      begin
        TlinePoint(lineList.Items[i]).Free;
        lineList.Items[i] := nil;
        lineList.Count := lineList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  lineList.Clear;
  for i := tempLineList.Count - 1 downto 0 do
  begin
    try
      // if TlinePoint(tempLineList[i]).floor<>-111 then
      begin
        pline := TlinePoint.Create(nil);
        pline.beginPcode := TlinePoint(tempLineList[i]).beginPcode;
        pline.endPcode := TlinePoint(tempLineList[i]).endPcode;
        pline.beginPoint := TlinePoint(tempLineList[i]).beginPoint;
        pline.endPoint := TlinePoint(tempLineList[i]).endPoint;
        // pline.floor := curTOPstorey;
        LineList.Add(pline);
      end;
    except
    end;
    application.ProcessMessages;
  end;

  for i := tempLineList.Count - 1 downto 0 do
  begin
    try
      // if TlinePoint(linelist[i]).floor<>-111 then
      if tempLineList.Items[i] <> nil then
      begin
        TlinePoint(tempLineList.Items[i]).Free;
        tempLineList.Items[i] := nil;
        tempLineList.Count := lineList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  tempLineList.Clear;
  tempLineList.Free;

  for i := pointList.Count - 1 downto 0 do
    TPointLine(pointList[i]).floor := -1;
  onelong := 0.0;
  alllong := 0.0;
  memo_seaLine.Lines.Add('总路径：总点数：' + IntToStr(lineList.Count));
  for i := lineList.Count - 1 downto 0 do
  begin
    try
      onelong := pplong(TlinePoint(linelist[i]).beginPoint, TlinePoint(
        linelist[i]).endPoint);
      memo_seaLine.Lines.Add(TlinePoint(linelist[i]).beginPcode +
        TlinePoint(linelist[i]).endPcode + ':' + floattostr(onelong));
      alllong := alllong + onelong;
      TPointLine(pointList[getpcodeindex(TlinePoint(linelist[i]).beginPcode)]).floor
      := 1;
      TPointLine(pointList[getpcodeindex(TlinePoint(linelist[i]).endPcode)]).floor := 1;
    except
    end;
    application.ProcessMessages;
  end;
  memo_seaLine.Lines.Add('总路长：' + floattostr(alllong));
  ss := '';
  for i := pointList.Count - 1 downto 0 do
    if TPointLine(pointList[i]).floor = -1 then
      ss := ss + TPointLine(pointList[i]).pcode + ',';
  if ss <> '' then
    ShowMessage(ss + '这些点没有被处理');
  //同心圆的中心点暂未处理，因为结果不理想，无兴趣理会
  refrash.Click;
end;

function TMain.sealine000(minx, miny, maxx, maxy: integer): integer;
var
  i, ijk: integer;      //memo_seaLine
  curp, curp0: integer;//TPoint;
  pline: TlinePoint;
  pcode1, pcode2: string;
  pcode1Shape, pcode2Shape: tshape;
  pcode1Pointer, pcode2Pointer: tpoint;
  path, ss: string;
  minpx, minpy, maxpx, maxpy: integer;
  sortlist, floorLine: TStringList;
  k1, k2, a, b, c, d: double;
begin
  sortlist := TStringList.Create;
  floorLine := TStringList.Create;
  sortlist.Clear;
  floorLine.Clear;
  //////////////////////////////////////四正     子午卯酉
  //minpx,minpy,maxpx,maxpy:integer;
  minpx := TPointLine(PointList[minx]).px;
  minpy := TPointLine(PointList[miny]).py;
  maxpx := TPointLine(PointList[maxx]).px;
  maxpy := TPointLine(PointList[maxy]).py;
  ///#####################################
  sortlist.Clear;
  for i := 0 to PointList.Count - 1 do
    //for i := PointList.Count - 1 downto 0 do
  begin
    //if    TPointLine(PointList[i]).floor<>-123 then
    if (TPointLine(PointList[i]).px = TPointLine(PointList[minx]).px) then
      // if  (TPointLine(PointList[i]).py <TPointLine(PointList[minx]).py) then
    begin
      //  minx:=i;
      // TPointLine(PointList[i]).floor:=-123;
      //sortlist.add(inttostr(TPointLine(PointList[i]).py)+'               '+TPointLine(PointList[i]).pcode);
      sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).py), 10) +
        '               ' + IntToStr(i));
      application.ProcessMessages;
    end;
  end;
  //ss:=sortlist.text;
  sortlist.sort;
  //ss:=sortlist.text;
  //for i := 0 to sortlist.Count - 1 do
  for i := sortlist.Count - 1 downto 0 do
    floorLine.add(trim(rightstr(sortlist[i], 10)));
  //四正：酉正，从酉初到酉末
  ss := floorLine.Text;
  if sortlist.Count > 0 then
    minx := StrToInt(trim(rightstr(sortlist[0], 10)));     //酉时末，顶上
  ///#####################################
  sortlist.Clear;
  for i := 0 to PointList.Count - 1 do
  begin
    if (TPointLine(PointList[i]).py = TPointLine(PointList[miny]).py) then
    begin
      sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).px), 10) +
        '               ' + IntToStr(i));
      application.ProcessMessages;
    end;
  end;
  sortlist.sort;
  if sortlist.Count > 0 then
    miny := StrToInt(trim(rightstr(sortlist[0], 10)));//子时初
  application.ProcessMessages;
  curp := minx;
  curp0 := -1;
  path := '';
  while curp0 <> curp do//八极之四隅之亥，从酉末到子初也
  begin
    //if curp<>-1 then
    application.ProcessMessages;
    curp0 := curp;
    for i := 0 to PointList.Count - 1 do
      if TPointLine(PointList[i]).floor = -1 then
      begin
        if (TPointLine(PointList[i]).px < TPointLine(PointList[curp0]).px) then
          continue;
        if (TPointLine(PointList[i]).py > TPointLine(PointList[curp0]).py) then
          continue;
        if (TPointLine(PointList[i]).py > TPointLine(PointList[minx]).py) then
          continue;
        if (TPointLine(PointList[i]).px <= TPointLine(PointList[minx]).px) then
          continue;
        if (TPointLine(PointList[i]).py <= TPointLine(PointList[miny]).py) then
          continue;
        if (TPointLine(PointList[i]).px > TPointLine(PointList[miny]).px) then
          continue;
        //if (TPointLine(PointList[i]).py = TPointLine(PointList[maxx]).py) then
        // if (TPointLine(PointList[i]).px = TPointLine(PointList[miny]).px) then
        if (i = curp0) then
          continue;
        if (i = miny) then
          continue;
        if (i = minx) then
          continue;
        if (curp0 <> curp) then  //  中间    curp0--curp   curp0--i
        begin        //k1,k2,a,b,c,d:double;
          a := (TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py);
          b := (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px);
          c := (TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py);
          d := (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px);
          //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
          //if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
          //  (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
          //  ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
          //  (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
          if ((b = 0) and (d <> 0)) then
          begin
            continue;
          end;
          if ((b <> 0) and (d = 0)) then
          begin
            curp := i;
          end;
          if ((b = 0) and (d = 0)) then
          begin           //curp0,curp,i 同为垂直时，取垂直最近curp0者
            if TPointLine(PointList[i]).py > TPointLine(PointList[curp]).py then
              //这里本可以加等号，也可不要等号
              curp := i;
          end;
          if ((b <> 0) and (d <> 0)) then
            if ((a * d) = (b * c)) then
              //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
            begin
              //curp0,curp,i 同为同一条斜率直线上时，取最近curp0者
              if TPointLine(PointList[i]).py > TPointLine(PointList[curp]).py then
                //这里本可以加等号，也可不要等号
                curp := i;
            end
            else if ((a * d) < (b * c)) then
              //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
            begin
              curp := i;
            end;
        end
        else     //第一次
          curp := i;
      end;
    if curp0 <> curp then    //跳出循环后
    begin
      if floorLine.IndexOf(IntToStr(curp0)) <= -1 then
        floorLine.add(IntToStr(curp0));
      if floorLine.IndexOf(IntToStr(curp)) <= -1 then
        floorLine.add(IntToStr(curp));
      TPointLine(PointList[curp0]).floor := 0;
      TPointLine(PointList[curp]).floor := 0;
    end;
  end;
  if floorLine.IndexOf(IntToStr(curp)) <= -1 then
    floorLine.add(IntToStr(curp));
  // memo_seaLine.Lines.Add('1:' + path);
  application.ProcessMessages;
  ///////////////////////////////////////////////////////////////////
  sortlist.Clear;
  for i := 0 to PointList.Count - 1 do
  begin
    if (TPointLine(PointList[i]).py = TPointLine(PointList[miny]).py) then
    begin
      sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).px), 10) +
        '               ' + IntToStr(i));
      application.ProcessMessages;
    end;
  end;
  ss := sortlist.Text;
  sortlist.sort;
  for i := 0 to sortlist.Count - 1 do
    // for i := sortlist.Count - 1 downto 0 do
    floorLine.add(trim(rightstr(sortlist[i], 10)));//四正：子正，从子初到子末
  // miny := StrToInt(sortlist[0]);
  // if floorLine.IndexOf(IntToStr(miny)) <= -1 then
  //   floorLine.add(IntToStr(miny));
  if sortlist.Count > 0 then
    miny := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));
  //子时末，右侧
  ///#####################################
  ///#####################################
  sortlist.Clear;
  for i := 0 to PointList.Count - 1 do
  begin
    if (TPointLine(PointList[i]).px = TPointLine(PointList[maxx]).px) then
    begin
      sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).py), 10) +
        '               ' + IntToStr(i));
      application.ProcessMessages;
    end;
  end;
  ss := sortlist.Text;
  sortlist.sort;
  if sortlist.Count > 0 then
    //maxx := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));//卯时初
    maxx := StrToInt(trim(rightstr(sortlist[0], 10)));//卯时初
  //////////////////////////////////////
  application.ProcessMessages;
  curp := miny;
  curp0 := -1;
  path := '';
  while curp0 <> curp do //八极之四隅之寅，从子末到卯初
  begin
    application.ProcessMessages;
    curp0 := curp;
    for i := 0 to PointList.Count - 1 do
      if TPointLine(PointList[i]).floor = -1 then
      begin
        if (TPointLine(PointList[i]).px < TPointLine(PointList[curp0]).px) then
          continue;
        if (TPointLine(PointList[i]).py < TPointLine(PointList[curp0]).py) then
          continue;
        if (TPointLine(PointList[i]).py > TPointLine(PointList[maxx]).py) then
          continue;
        if (TPointLine(PointList[i]).px >= TPointLine(PointList[maxx]).px) then
          continue;
        if (TPointLine(PointList[i]).py <= TPointLine(PointList[miny]).py) then
          continue;
        if (TPointLine(PointList[i]).px < TPointLine(PointList[miny]).px) then
          continue;
        //if (TPointLine(PointList[i]).py = TPointLine(PointList[maxx]).py) then
        // if (TPointLine(PointList[i]).px = TPointLine(PointList[miny]).px) then
        if (i = curp0) then
          continue;
        if (i = miny) then
          continue;
        if (i = maxx) then
          continue;
        if (curp0 <> curp) then  //  中间    curp0--curp   curp0--i
        begin        //k1,k2,a,b,c,d:double;
          a := (TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py);
          b := (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px);
          c := (TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py);
          d := (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px);
          //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
          //if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
          //  (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
          //  ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
          //  (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
          if ((b = 0) and (d <> 0)) then
          begin
            continue;
          end;
          if ((b <> 0) and (d = 0)) then
          begin
            curp := i;
          end;
          if ((b = 0) and (d = 0)) then
          begin           //curp0,curp,i 同为垂直时，取垂直最近curp0者
            if TPointLine(PointList[i]).py < TPointLine(PointList[curp]).py then
              //这里本可以加等号，也可不要等号
              curp := i;
          end;
          if ((b <> 0) and (d <> 0)) then
            if ((a * d) = (b * c)) then
              //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
            begin
              //curp0,curp,i 同为同一条斜率直线上时，取最近curp0者
              if TPointLine(PointList[i]).py < TPointLine(PointList[curp]).py then
                //这里本可以加等号，也可不要等号
                curp := i;
            end
            else if ((a * d) < (b * c)) then
              //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
            begin
              curp := i;
            end;
        end
        else     //第一次
          curp := i;
      end;
    if curp0 <> curp then    //跳出循环后
    begin
      if floorLine.IndexOf(IntToStr(curp0)) <= -1 then
        floorLine.add(IntToStr(curp0));
      if floorLine.IndexOf(IntToStr(curp)) <= -1 then
        floorLine.add(IntToStr(curp));
      TPointLine(PointList[curp0]).floor := 0;
      TPointLine(PointList[curp]).floor := 0;
    end;
  end;
  if floorLine.IndexOf(IntToStr(curp)) <= -1 then
    floorLine.add(IntToStr(curp));
  //  memo_seaLine.Lines.Add('2:' + path);
  application.ProcessMessages;
  ///////////////////////////////////////////////////////////////////
  ///#####################################
  sortlist.Clear;
  for i := 0 to PointList.Count - 1 do
  begin
    if (TPointLine(PointList[i]).px = TPointLine(PointList[maxx]).px) then
    begin
      sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).py), 10) +
        '               ' + IntToStr(i));
      application.ProcessMessages;
    end;
  end;
  ss := sortlist.Text;
  sortlist.sort;
  for i := 0 to sortlist.Count - 1 do
    // for i := sortlist.Count - 1 downto 0 do
    floorLine.add(trim(rightstr(sortlist[i], 10)));//四正：卯正，从卯初到卯末
  // maxx := StrToInt(sortlist[0]);
  // if floorLine.IndexOf(IntToStr(maxx)) <= -1 then
  //   floorLine.add(IntToStr(maxx));
  if sortlist.Count > 0 then
    maxx := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));
  //卯时末，右底

  sortlist.Clear;
  for i := 0 to PointList.Count - 1 do
  begin
    if (TPointLine(PointList[i]).py = TPointLine(PointList[maxy]).py) then
    begin
      sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).px), 10) +
        '               ' + IntToStr(i));
      application.ProcessMessages;
    end;
  end;
  sortlist.sort;
  ss := sortlist.Text;
  if sortlist.Count > 0 then
    maxy := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));//午时初
  ///#####################################
  //////////////////////////////////////
  ss := floorLine.Text;
  application.ProcessMessages;
  curp := maxx;
  curp0 := -1;
  path := '';
  while curp0 <> curp do//八极之四隅之巳，从卯末到午初
  begin
    application.ProcessMessages;
    curp0 := curp;
    //for i := 0 to PointList.Count - 1 do
    for i := 0 to PointList.Count - 1 do
      if TPointLine(PointList[i]).floor = -1 then
      begin
        if (TPointLine(PointList[i]).px > TPointLine(PointList[curp0]).px) then
          continue;
        if (TPointLine(PointList[i]).py < TPointLine(PointList[curp0]).py) then
          continue;
        if (TPointLine(PointList[i]).py < TPointLine(PointList[maxx]).py) then
          continue;
        if (TPointLine(PointList[i]).px >= TPointLine(PointList[maxx]).px) then
          continue;
        if (TPointLine(PointList[i]).py >= TPointLine(PointList[maxy]).py) then
          continue;
        if (TPointLine(PointList[i]).px < TPointLine(PointList[maxy]).px) then
          continue;
        //if (TPointLine(PointList[i]).py = TPointLine(PointList[maxx]).py) then
        // if (TPointLine(PointList[i]).px = TPointLine(PointList[miny]).px) then
        if (i = curp0) then
          continue;
        if (i = maxy) then
          continue;
        if (i = maxx) then
          continue;
        if (curp0 <> curp) then  //  中间    curp0--curp   curp0--i
        begin        //k1,k2,a,b,c,d:double;
          a := (TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py);
          b := (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px);
          c := (TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py);
          d := (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px);
          //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
          //if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
          //  (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
          //  ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
          //  (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
          if ((b = 0) and (d <> 0)) then
          begin
            continue;
          end;
          if ((b <> 0) and (d = 0)) then
          begin
            curp := i;
          end;
          if ((b = 0) and (d = 0)) then
          begin           //curp0,curp,i 同为垂直时，取垂直最近curp0者
            if TPointLine(PointList[i]).py < TPointLine(PointList[curp]).py then
              //这里本可以加等号，也可不要等号
              curp := i;
          end;
          if ((b <> 0) and (d <> 0)) then
            if ((a * d) = (b * c)) then
              //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
            begin
              //curp0,curp,i 同为同一条斜率直线上时，取最近curp0者
              if TPointLine(PointList[i]).py < TPointLine(PointList[curp]).py then
                //这里本可以加等号，也可不要等号
                curp := i;
            end
            else if ((a * d) < (b * c)) then
              //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
            begin
              curp := i;
            end;
        end
        else     //第一次
          curp := i;
      end;
    if curp0 <> curp then    //跳出循环后
    begin
      if floorLine.IndexOf(IntToStr(curp0)) <= -1 then
        floorLine.add(IntToStr(curp0));
      if floorLine.IndexOf(IntToStr(curp)) <= -1 then
        floorLine.add(IntToStr(curp));
      TPointLine(PointList[curp0]).floor := 0;
      TPointLine(PointList[curp]).floor := 0;
    end;
  end;
  if floorLine.IndexOf(IntToStr(curp)) <= -1 then
    floorLine.add(IntToStr(curp));
  //memo_seaLine.Lines.Add('3:' + path);
  application.ProcessMessages;
  //////////////////////////////////////
  ///#####################################
  sortlist.Clear;
  for i := 0 to PointList.Count - 1 do
  begin
    if (TPointLine(PointList[i]).py = TPointLine(PointList[maxy]).py) then
    begin
      sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).px), 10) +
        '               ' + IntToStr(i));
      application.ProcessMessages;
    end;
  end;
  sortlist.sort;
  //for i := 0 to sortlist.Count - 1 do
  for i := sortlist.Count - 1 downto 0 do
    floorLine.add(trim(rightstr(sortlist[i], 10)));//四正之午正（含午初）
  //  maxy := StrToInt(sortlist[0]);
  // if floorLine.IndexOf(IntToStr(maxy)) <= -1 then
  //   floorLine.add(IntToStr(maxy));
  if sortlist.Count > 0 then
    maxy := StrToInt(trim(rightstr(sortlist[0], 10)));//午末
  ss := floorLine.Text;
  application.ProcessMessages;
  sortlist.Clear;
  for i := 0 to PointList.Count - 1 do
  begin
    if (TPointLine(PointList[i]).px = TPointLine(PointList[minx]).px) then
    begin
      sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).py), 10) +
        '               ' + IntToStr(i));
      application.ProcessMessages;
    end;
  end;
  sortlist.sort;
  if sortlist.Count > 0 then
    minx := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));//酉之初

  ss := floorLine.Text;
  application.ProcessMessages;
  //////////////////////////////////////
  application.ProcessMessages;
  curp := maxy;
  curp0 := -1;
  path := '';
  while curp0 <> curp do//午末与酉初之间的四隅之申
  begin
    application.ProcessMessages;
    curp0 := curp;
    //for i := 0 to PointList.Count - 1 do
    for i := 0 to PointList.Count - 1 do
      if TPointLine(PointList[i]).floor = -1 then
      begin
        if (TPointLine(PointList[i]).px > TPointLine(PointList[curp0]).px) then
          continue;
        if (TPointLine(PointList[i]).py > TPointLine(PointList[curp0]).py) then
          continue;
        if (TPointLine(PointList[i]).py >= TPointLine(PointList[maxy]).py) then
          continue;
        if (TPointLine(PointList[i]).px > TPointLine(PointList[maxy]).px) then
          continue;
        if (TPointLine(PointList[i]).py < TPointLine(PointList[minx]).py) then
          continue;
        if (TPointLine(PointList[i]).px <= TPointLine(PointList[minx]).px) then
          continue;
        //if (TPointLine(PointList[i]).py = TPointLine(PointList[maxx]).py) then
        // if (TPointLine(PointList[i]).px = TPointLine(PointList[miny]).px) then
        if (i = curp0) then
          continue;
        if (i = minx) then
          continue;
        if (i = maxx) then
          continue;
        if (curp0 <> curp) then  //  中间    curp0--curp   curp0--i
        begin        //k1,k2,a,b,c,d:double;
          a := (TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py);
          b := (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px);
          c := (TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py);
          d := (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px);
          //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
          //if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
          //  (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
          //  ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
          //  (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
          if ((b = 0) and (d <> 0)) then
          begin
            continue;
          end;
          if ((b <> 0) and (d = 0)) then
          begin
            curp := i;
          end;
          if ((b = 0) and (d = 0)) then
          begin           //curp0,curp,i 同为垂直时，取垂直最近curp0者
            if TPointLine(PointList[i]).py > TPointLine(PointList[curp]).py then
              //这里本可以加等号，也可不要等号
              curp := i;
          end;
          if ((b <> 0) and (d <> 0)) then
            if ((a * d) = (b * c)) then
              //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
            begin
              //curp0,curp,i 同为同一条斜率直线上时，取最近curp0者
              if TPointLine(PointList[i]).py > TPointLine(PointList[curp]).py then
                //这里本可以加等号，也可不要等号
                curp := i;
            end
            else if ((a * d) < (b * c)) then
              //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
            begin
              curp := i;
            end;
        end
        else     //第一次
          curp := i;
      end;
    if curp0 <> curp then    //跳出循环后
    begin
      if floorLine.IndexOf(IntToStr(curp0)) <= -1 then
        floorLine.add(IntToStr(curp0));
      if floorLine.IndexOf(IntToStr(curp)) <= -1 then
        floorLine.add(IntToStr(curp));
      TPointLine(PointList[curp0]).floor := 0;
      TPointLine(PointList[curp]).floor := 0;
    end;
  end;
  if floorLine.IndexOf(IntToStr(curp)) <= -1 then
    floorLine.add(IntToStr(curp));
  // memo_seaLine.Lines.Add('4:' + path);
  application.ProcessMessages;
  //////////////////////////////////////
  //sortlist.Clear;
  //for i := 0 to PointList.Count - 1 do
  //begin
  //  if (TPointLine(PointList[i]).px = TPointLine(PointList[minx]).px) then
  //  begin
  //    sortlist.add(IntToStr(TPointLine(PointList[i]).py) + '               ' +
  //      IntToStr(i));
  //  end;
  //end;
  //sortlist.sort;
  //for i := 0 to sortlist.Count - 1 do
  //  // for i := sortlist.Count - 1 downto 0 do
  //  floorLine.add(trim(rightstr(sortlist[i], 10)));
  // minx := strtoint(trim(rightstr(sortlist[sortlist.Count - 1], 10)));
  //if floorLine.IndexOf(IntToStr(minx)) <= 0 then
  //  floorLine.add(IntToStr(minx));
  //###############
  ss := floorLine.Text;
  path := '';
  for i := 0 to floorLine.Count - 1 do
  begin
    TPointLine(PointList[StrToInt(floorLine[i mod floorLine.Count])]).floor := 0;
    pline := TlinePoint.Create(nil);
    pcode1 := pcodes[StrToInt(floorLine[i mod floorLine.Count])];
    pcode2 := pcodes[StrToInt(floorLine[(i + 1) mod floorLine.Count])];
    pcode1Shape := getpcode(pcode1);
    pcode2Shape := getpcode(pcode2);
    pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
    pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
    pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
    pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
    //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

    if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
    begin
      ScrollBox1.Canvas.pen.color := clHighlight;//clred;
      ScrollBox1.Canvas.pen.Width := 4;
    end
    else
    begin
      ScrollBox1.Canvas.pen.color := clgrayText;
      ScrollBox1.Canvas.pen.Width := 2;
    end;
    self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok
    application.ProcessMessages;
    pline.beginPcode := pcode1;
    pline.endPcode := pcode2;
    pline.beginPoint := pcode1Pointer;
    pline.endPoint := pcode2Pointer;
    pline.floor := 0;  ///想不到，后来修改时，少加这句，就难找不易
    linelist.Add(pline);
    if pos('-->' + pcode1, path) <= 0 then
      path := path + '-->' + pcode1;
    if pos('-->' + pcode2, path) <= 0 then
      path := path + '-->' + pcode2;
  end;
  memo_seaLine.Lines.Add(path);

  sortlist.Free;
  floorLine.Free;
  ///////////////////////////////////////////////////////////////////
  //refreshFromLineList(nil);
end;

function TMain.ifCross(pcodeA, pcodeB, pcodeC, pcodeD: string): boolean;
var
  i: integer;
  a, b, c, d: tpoint;
  //sss:tstringlist;
begin
  // sss:=tstringlist.Create;
  for i := 1 to PointList.Count - 1 do
  begin
    if TPointLine(PointList[i]).pcode = pcodeA then
    begin
      a.x := TPointLine(PointList[i]).px;
      a.y := TPointLine(PointList[i]).py;
      //  sss.add( 'a.x=' + inttostr(a.x) + '与' + 'a.y=' + inttostr(a.y));
    end;
    if TPointLine(PointList[i]).pcode = pcodeB then
    begin
      b.x := TPointLine(PointList[i]).px;
      b.y := TPointLine(PointList[i]).py;
      //  sss.add( 'b.x=' + inttostr(b.x) + '与' + 'b.y=' + inttostr(b.y));
    end;
    if TPointLine(PointList[i]).pcode = pcodeC then
    begin
      c.x := TPointLine(PointList[i]).px;
      c.y := TPointLine(PointList[i]).py;
      // sss.add( 'c.x=' + inttostr(c.x) + '与' + 'c.y=' + inttostr(c.y));
    end;
    if TPointLine(PointList[i]).pcode = pcodeD then
    begin
      d.x := TPointLine(PointList[i]).px;
      d.y := TPointLine(PointList[i]).py;
      //sss.add( 'd.x=' + inttostr(d.x) + '与' + 'd.y=' + inttostr(d.y));
    end;

  end;
  //InputQueryLiMemo('www', sss.Text, nil);
  //sss.free;
  Result := isCross(a, b, c, d);
end;

function TMain.ifCrosswww(pcodeA, pcodeB, pcodeC, pcodeD: string): boolean;
var
  i: integer;
  a, b, c, d: tpoint;
  sss: TStringList;
begin
  sss := TStringList.Create;
  for i := 1 to PointList.Count - 1 do
  begin
    if TPointLine(PointList[i]).pcode = pcodeA then
    begin
      a.x := TPointLine(PointList[i]).px;
      a.y := TPointLine(PointList[i]).py;
      sss.add(pcodeA + ':' + 'a.x=' + IntToStr(a.x) + '与' + 'a.y=' + IntToStr(a.y));
    end;
    if TPointLine(PointList[i]).pcode = pcodeB then
    begin
      b.x := TPointLine(PointList[i]).px;
      b.y := TPointLine(PointList[i]).py;
      sss.add(pcodeB + ':' + 'b.x=' + IntToStr(b.x) + '与' + 'b.y=' + IntToStr(b.y));
    end;
    if TPointLine(PointList[i]).pcode = pcodeC then
    begin
      c.x := TPointLine(PointList[i]).px;
      c.y := TPointLine(PointList[i]).py;
      sss.add(pcodeC + ':' + 'c.x=' + IntToStr(c.x) + '与' + 'c.y=' + IntToStr(c.y));
    end;
    if TPointLine(PointList[i]).pcode = pcodeD then
    begin
      d.x := TPointLine(PointList[i]).px;
      d.y := TPointLine(PointList[i]).py;
      sss.add(pcodeD + ':' + 'd.x=' + IntToStr(d.x) + '与' + 'd.y=' + IntToStr(d.y));
    end;

  end;
  InputQueryLiMemo('www', sss.Text, nil);
  sss.Free;
  Result := isCross(a, b, c, d);
end;

function TMain.getPcodeIndex(vpcode: string): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to pointlist.Count - 1 do
  begin
    if tpointline(pointlist[i]).pcode = vpcode then
    begin
      Result := i;
      break;
    end;
  end;
end;

procedure TMain.sleepli(i: integer);
var
  ii: integer;
begin
  ii := gettickcount64;
  while ((GetTickCount64 - ii) < i) do
    application.ProcessMessages;
  //application.Run;
  // application.Tag := GetTickCount64 - ii;
end;

function TMain.fromPcodeGetPoint(spcode: string): tpoint;
var
  i: integer;
begin
  for i := 0 to PointList.Count - 1 do
    if TPointLine(PointList[i]).pcode = spcode then
    begin
      Result.x := TPointLine(PointList[i]).px;
      Result.y := TPointLine(PointList[i]).py;
      break;
    end;

end;

procedure TMain.btn_sealine_testClick(Sender: TObject);
var
  i, j: integer;                                     //  P70-->P31与P54-->P70
  pline, www: TlinePoint;                            //  P63-->P88与P93-->P88
  sss: TStringList;                                  //  P49-->P52与P93-->P52
begin                                                //  P36-->P87与P46-->P87
  //P20-->P62与P20-->P82
  if (1 = 2) then                                   // P2-->P47与P9-->P2
  begin                                             // P42-->P72与P7-->P72
    //if ifcross('P5','P7','P18','P14') then
    // if ifcrosswww('P70', 'P31', 'P54', 'P70') then
    // if ifcross('P70', 'P31', 'P54', 'P70') then
    if ifcrosswww('P93', 'P52', 'P93', 'P88') then
      ShowMessage('cross')
    else
      ShowMessage('No');

    // ShowMessage(IntToStr(ScrollBox1.HorzScrollBar.Position));
    // ShowMessage(IntToStr(ScrollBox1.VertScrollBar.Position));
    //self.ScrollBox1.HorzScrollBar.Position;
    //self.ScrollBox1.VertScrollBar.Position;
  end;
  //if (1=2) then
  begin
    sss := TStringList.Create;
    pline := TlinePoint.Create(nil);
    www := TlinePoint.Create(nil);
    for i := 0 to linelist.Count - 2 do
    begin
      for j := i + 1 to linelist.Count - 1 do
      begin
        pline.beginPcode := TlinePoint(linelist.Items[i]).beginPcode;
        pline.endPcode := TlinePoint(linelist.Items[i]).endPcode;
        pline.beginPoint := TlinePoint(linelist.Items[i]).beginPoint;
        pline.endPoint := TlinePoint(linelist.Items[i]).endPoint;
        www.beginPcode := TlinePoint(linelist.Items[j]).beginPcode;
        www.endPcode := TlinePoint(linelist.Items[j]).endPcode;
        www.beginPoint := TlinePoint(linelist.Items[j]).beginPoint;
        www.endPoint := TlinePoint(linelist.Items[j]).endPoint;
        // if iscross(pline.beginPoint, pline.endPoint, www.beginPoint, www.endPoint) then
        if ifcross(pline.beginPcode, pline.endPcode, www.beginPcode, www.endPcode) then
        begin
          sss.add(pline.beginPcode + '-->' + pline.endPcode + '与' +
            www.beginPcode + '-->' + www.endPcode);
          sss.add(pline.beginPcode + ':' + 'a.x=' + IntToStr(pline.beginPoint.x) +
            '与' + 'a.y=' + IntToStr(pline.beginPoint.y) + '与' +
            pline.endPcode + ':' + 'b.x=' + IntToStr(pline.endPoint.x) +
            '与' + 'b.y=' + IntToStr(pline.endPoint.y));
          sss.add(www.beginPcode + ':' + 'c.x=' + IntToStr(www.beginPoint.x) +
            '与' + 'c.y=' + IntToStr(www.beginPoint.y) + '与' +
            www.endPcode + ':' + 'd.x=' + IntToStr(www.endPoint.x) +
            '与' + 'd.y=' + IntToStr(www.endPoint.y));
        end;
      end;
    end;
    if sss.Count > 0 then
      InputQueryLiMemo('下面共有' + IntToStr(sss.Count div 3) +
        '组的两条边相交了:', sss.Text, nil);

    if sss.Count = 0 then
      ShowMessage('全部边没有相交的');

    sss.Free;
    pline.Free;
    www.Free;
  end;
end;
{ //////
  procedure TMain.btn_seaLineFloorPointClick(Sender: TObject);


   function sealineLayer000(minx, miny, maxx, maxy: integer): integer;
  var
    i, j, curTOPstorey: integer;      //memo_seaLine
    curp, curp0, tempnextp: integer;//TPoint;
    pline: TlinePoint;
    pcode1, pcode2: string;
    pcode1Shape, pcode2Shape: tshape;
    pcode1Pointer, pcode2Pointer: tpoint;
    path, ss: string;
    minpx, minpy, maxpx, maxpy: integer;
    sortlist, floorLine: TStringList;
  begin
    sortlist := TStringList.Create;
    floorLine := TStringList.Create;
    sortlist.Clear;
    floorLine.Clear;
    //////////////////////////////////////     四正     子午卯酉
    //minpx,minpy,maxpx,maxpy:integer;
    minpx := TPointLine(PointList[minx]).px;
    minpy := TPointLine(PointList[miny]).py;
    maxpx := TPointLine(PointList[maxx]).px;
    maxpy := TPointLine(PointList[maxy]).py;
    ///#####################################
    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
      if TPointLine(PointList[i]).floor = -1 then
        break;
    minx := i;//TPoint(PointList[0]);
    miny := minx;
    maxx := minx;
    maxy := minx;
    for i := 0 to PointList.Count - 1 do
      // PointList: TFPList;//TPointerList;//TList;  //TPointline
      if TPointLine(PointList[i]).floor = -1 then
      begin
        // ss:= TPointLine(PointList[i]).pcode;
        if TPointLine(PointList[i]).pcode = 'P9' then
          application.ProcessMessages;
        if (TPointLine(PointList[i]).px < TPointLine(PointList[minx]).px) then
          minx := i;//  TPoint(PointList[i]);
        if (TPointLine(PointList[i]).py < TPointLine(PointList[miny]).py) then
          miny := i;//  TPoint(PointList[i]);
        if (TPointLine(PointList[i]).px > TPointLine(PointList[maxx]).px) then
          maxx := i;//  TPoint(PointList[i]);
        if (TPointLine(PointList[i]).py > TPointLine(PointList[maxy]).py) then
          maxy := i;//  TPoint(PointList[i]);
      end;
    memo_seaLine.Lines.Add('第' + IntToStr(length(storeyLineList) + 1) +
      '层围城线围墙：');
    memo_seaLine.Lines.Add('minx=' + pcodes[minx]);
    memo_seaLine.Lines.Add('miny=' + pcodes[miny]);
    memo_seaLine.Lines.Add('maxx=' + pcodes[maxx]);
    memo_seaLine.Lines.Add('maxy=' + pcodes[maxy]);
    application.ProcessMessages;
    //tempLineList:=TFPList.Create;//TPointerList;//TList;   // TlinePoint
    curTOPstorey := length(storeyLineList);
    setlength(storeyLineList, curTOPstorey + 1);
    storeyLineList[curTOPstorey] := TStringList.Create;

    ////////////////////////////////////// 四正     子午卯酉
    //minpx,minpy,maxpx,maxpy:integer;
    minpx := TPointLine(PointList[minx]).px;
    minpy := TPointLine(PointList[miny]).py;
    maxpx := TPointLine(PointList[maxx]).px;
    maxpy := TPointLine(PointList[maxy]).py;
    ///#####################################
    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
      //for i := PointList.Count - 1 downto 0 do
    begin
      if TPointLine(PointList[i]).floor = -1 then
        if (TPointLine(PointList[i]).px = TPointLine(PointList[minx]).px) then
        begin
          //TPointLine(PointList[i]).floor := curTOPstorey;
          //sortlist.add(inttostr(TPointLine(PointList[i]).py)+'               '+TPointLine(PointList[i]).pcode);
          sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).py),
            10) + '               ' + IntToStr(i));
        end;
    end;
    //ss:=sortlist.text;
    sortlist.sort;
    //ss:=sortlist.text;
    //for i := 0 to sortlist.Count - 1 do
    for i := sortlist.Count - 1 downto 0 do
    begin
      floorLine.add(trim(rightstr(sortlist[i], 10)));
      //四正：酉正，从酉初到酉末
      TPointLine(PointList[StrToInt(trim(rightstr(sortlist[i], 10)))]).floor :=
        curTOPstorey;
    end;
    ss := floorLine.Text;
    if sortlist.Count > 0 then
      minx := StrToInt(trim(rightstr(sortlist[0], 10)));  //酉时末，顶上
    ///#####################################
    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
    begin
      if TPointLine(PointList[i]).floor = -1 then
        if (TPointLine(PointList[i]).py = TPointLine(PointList[miny]).py) then
        begin
          sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).px),
            10) + '               ' + IntToStr(i));
        end;
    end;
    sortlist.sort;
    if sortlist.Count > 0 then
      miny := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));//子时初
    application.ProcessMessages;
    curp := minx;
    curp0 := -1;
    path := '';
    while curp0 <> curp do    //八极之四隅之亥，从酉末到子初也
    begin
      application.ProcessMessages;
      //if curp<>-1 then
      curp0 := curp;
      for i := 0 to PointList.Count - 1 do
        if TPointLine(PointList[i]).floor = -1 then
        begin
          if (TPointLine(PointList[i]).px > TPointLine(PointList[miny]).px) then
            continue;
          if (TPointLine(PointList[i]).py > TPointLine(PointList[curp0]).py) then
            continue;
          if (TPointLine(PointList[i]).px = TPointLine(PointList[miny]).px) then
            continue;
          if (TPointLine(PointList[i]).py = TPointLine(PointList[curp0]).py) then
            continue;
          if (i = curp0) then
          begin
            //curp := i;
            continue;
          end;
          if (curp0 <> curp) then
          begin
            if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
              ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
            begin
              curp := i;
            end;
          end
          else
            curp := i;
        end;
      if curp0 <> curp then
      begin
        if floorLine.IndexOf(IntToStr(curp0)) <= -1 then
        begin
          floorLine.add(IntToStr(curp0));
          TPointLine(pointlist[curp0]).floor := curTOPstorey;
        end;
        if floorLine.IndexOf(IntToStr(curp)) <= -1 then
        begin
          floorLine.add(IntToStr(curp));
          TPointLine(pointlist[curp]).floor := curTOPstorey;
        end;
      end;
    end;
    if miny <> curp then
    begin
      if floorLine.IndexOf(IntToStr(curp)) <= -1 then
      begin
        floorLine.add(IntToStr(curp));
        TPointLine(pointlist[curp]).floor := curTOPstorey;
      end;
    end;
    //TPointLine(pointlist[miny]).floor := curTOPstorey;
    //memo_seaLine.Lines.Add('1:' + path);
    ss := floorLine.Text;
    application.ProcessMessages;
    ///////////////////////////////////////////////////////////////////
    ///#####################################
    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
    begin
      if TPointLine(PointList[i]).floor = -1 then
        if (TPointLine(PointList[i]).py = TPointLine(PointList[miny]).py) then
        begin
          sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).px),
            10) + '               ' + IntToStr(i));
        end;
    end;
    sortlist.sort;
    for i := 0 to sortlist.Count - 1 do
      // for i := sortlist.Count - 1 downto 0 do
    begin
      floorLine.add(trim(rightstr(sortlist[i], 10)));
      //四正：子正，从子初到子末
      TPointLine(PointList[StrToInt(trim(rightstr(sortlist[i], 10)))]).floor :=
        curTOPstorey;
    end;
    ss := sortlist.Text;
    if sortlist.Count > 0 then
      miny := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));
    //子时末，右侧
    ///#####################################
    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
    begin
      if TPointLine(PointList[i]).floor = -1 then
        if (TPointLine(PointList[i]).px = TPointLine(PointList[maxx]).px) then
        begin
          sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).py),
            10) + '               ' + IntToStr(i));
        end;
    end;
    sortlist.sort;
    if sortlist.Count > 0 then
      // maxx := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));//卯时初
      maxx := StrToInt(trim(rightstr(sortlist[0], 10)));//卯时初
    //////////////////////////////////////
    application.ProcessMessages;
    curp := miny;
    curp0 := -1;
    path := '';
    while curp0 <> curp do     //八极之四隅之寅，从子末到卯初
    begin
      application.ProcessMessages;
      curp0 := curp;
      for i := 0 to PointList.Count - 1 do
        if TPointLine(PointList[i]).floor = -1 then
        begin
          if (TPointLine(PointList[i]).px < TPointLine(PointList[curp0]).px) then
            continue;
          if (TPointLine(PointList[i]).py > TPointLine(PointList[maxx]).py) then
            continue;
          if (TPointLine(PointList[i]).px = TPointLine(PointList[maxx]).px) then
            continue;
          if (TPointLine(PointList[i]).py = TPointLine(PointList[curp0]).py) then
            continue;
          if (i = curp0) then
          begin
            continue;
          end;
          if (curp0 <> curp) then
          begin
            if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
              ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
            begin
              curp := i;

            end;
          end
          else
            curp := i;
        end;
      if curp0 <> curp then
      begin
        if floorLine.IndexOf(IntToStr(curp0)) <= -1 then
        begin
          floorLine.add(IntToStr(curp0));
          TPointLine(pointlist[curp0]).floor := curTOPstorey;
        end;
        if floorLine.IndexOf(IntToStr(curp)) <= -1 then
        begin
          floorLine.add(IntToStr(curp));
          TPointLine(pointlist[curp]).floor := curTOPstorey;
        end;
      end;
    end;
    if maxx <> curp then
    begin
      if floorLine.IndexOf(IntToStr(curp)) <= -1 then
      begin
        floorLine.add(IntToStr(curp));
        TPointLine(pointlist[curp]).floor := curTOPstorey;
      end;
    end;
    // memo_seaLine.Lines.Add('2:' + path);
    ss := floorLine.Text;
    application.ProcessMessages;
    ////////////////////////////////////////////////////////////////////
    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
    begin
      if TPointLine(PointList[i]).floor = -1 then
        if (TPointLine(PointList[i]).px = TPointLine(PointList[maxx]).px) then
        begin
          sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).py),
            10) + '               ' + IntToStr(i));
        end;
    end;
    sortlist.sort;
    for i := 0 to sortlist.Count - 1 do
      // for i := sortlist.Count - 1 downto 0 do
    begin
      floorLine.add(trim(rightstr(sortlist[i], 10)));
      //四正：卯正，从卯初到卯末
      TPointLine(PointList[StrToInt(trim(rightstr(sortlist[i], 10)))]).floor :=
        curTOPstorey;
    end;
    if sortlist.Count > 0 then
      maxx := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));
    //卯时末，右底

    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
    begin
      if TPointLine(PointList[i]).floor = -1 then
        if (TPointLine(PointList[i]).py = TPointLine(PointList[maxy]).py) then
        begin
          sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).px),
            10) + '               ' + IntToStr(i));
        end;
    end;
    sortlist.sort;
    ss := sortlist.Text;
    if sortlist.Count > 0 then
      maxy := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));//午时初

    ///#####################################
    ss := floorLine.Text;
    application.ProcessMessages;
    curp := maxx;
    curp0 := -1;
    path := '';
    while curp0 <> curp do//八极之四隅之巳，从卯末到午初
    begin
      application.ProcessMessages;
      curp0 := curp;
      //for i := 0 to PointList.Count - 1 do
      for i := PointList.Count - 1 downto 0 do
        if TPointLine(PointList[i]).floor = -1 then
        begin
          if (TPointLine(PointList[i]).px < TPointLine(PointList[maxy]).px) then
            continue;
          if (TPointLine(PointList[i]).py < TPointLine(PointList[curp0]).py) then
            continue;
          if (TPointLine(PointList[i]).px = TPointLine(PointList[curp0]).px) then
            continue;
          if (TPointLine(PointList[i]).py = TPointLine(PointList[maxy]).py) then
            continue;
          if (i = curp0) then
          begin
            continue;
          end;
          if (curp0 <> curp) then
          begin
            if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
              ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
            begin
              curp := i;
            end;
          end
          else
            curp := i;
        end;
      if curp0 <> curp then
      begin
        if floorLine.IndexOf(IntToStr(curp0)) <= -1 then
        begin
          floorLine.add(IntToStr(curp0));
          TPointLine(pointlist[curp0]).floor := curTOPstorey;
        end;
        if floorLine.IndexOf(IntToStr(curp)) <= -1 then
        begin
          floorLine.add(IntToStr(curp));
          TPointLine(pointlist[curp]).floor := curTOPstorey;
        end;
        ss := floorLine.Text;
      end;
    end;
    if maxy <> curp then
    begin
      if floorLine.IndexOf(IntToStr(curp)) <= -1 then
      begin
        floorLine.add(IntToStr(curp));
        TPointLine(pointlist[curp]).floor := curTOPstorey;
      end;
    end;
    //  memo_seaLine.Lines.Add('3:' + path);
    ss := floorLine.Text;
    application.ProcessMessages;
    //////////////////////////////////////
    ///#####################################
    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
    begin
      if TPointLine(PointList[i]).floor = -1 then
        if (TPointLine(PointList[i]).py = TPointLine(PointList[maxy]).py) then
        begin
          sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).px),
            10) + '               ' + IntToStr(i));
        end;
    end;
    sortlist.sort;
    //for i := 0 to sortlist.Count - 1 do
    for i := sortlist.Count - 1 downto 0 do
    begin
      floorLine.add(trim(rightstr(sortlist[i], 10)));  //四正之午正（含午初）
      TPointLine(PointList[StrToInt(trim(rightstr(sortlist[i], 10)))]).floor :=
        curTOPstorey;
    end;
    //  maxy := StrToInt(sortlist[0]);
    // if floorLine.IndexOf(IntToStr(maxy)) <= -1 then
    //   floorLine.add(IntToStr(maxy));
    if sortlist.Count > 0 then
      maxy := StrToInt(trim(rightstr(sortlist[0], 10)));//午末
    ss := floorLine.Text;
    application.ProcessMessages;
    //sortlist.Clear;
    //for i := 0 to PointList.Count - 1 do
    //begin
    //  if TPointLine(PointList[i]).floor = -1 then  //这里又产生BUG，如果为floor = -1，则没有数据，下标-1报错
    //    if (TPointLine(PointList[i]).px = TPointLine(PointList[minx]).px) then
    //    begin
    //      sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).py), 10) +
    //        '               ' + IntToStr(i));
    //    end;
    //end;
    //sortlist.sort;
    // minx := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));//酉之初
    minx := StrToInt(floorLine[0]);//酉之初
    //////////////////////////////////////
    application.ProcessMessages;
    curp := maxy;
    curp0 := -1;
    path := '';
    // tempnextp := -1;
    while curp0 <> curp do//午末与酉初之间的四隅之申
    begin
      application.ProcessMessages;
      curp0 := curp;
      //for i := 0 to PointList.Count - 1 do
      for i := PointList.Count - 1 downto 0 do
        if TPointLine(PointList[i]).floor = -1 then
        begin
          if TPointLine(PointList[i]).pcode = 'P9' then
            application.ProcessMessages;
          if (TPointLine(PointList[i]).px > TPointLine(PointList[curp0]).px) then
            continue;
          if (TPointLine(PointList[i]).px = TPointLine(PointList[curp0]).px) then
            continue;
          if (TPointLine(PointList[i]).py < TPointLine(PointList[minx]).py) then
            continue;
          if (TPointLine(PointList[i]).py = TPointLine(PointList[minx]).py) then
            continue;
          if (i = curp0) then
          begin
            continue;
          end;
          if (curp0 <> curp) then
          begin
            if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
              ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
              (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
            begin
              curp := i;
            end;
          end
          else
          begin
            curp := i;
          end;
        end;
      if curp0 <> curp then
      begin
        if floorLine.IndexOf(IntToStr(curp0)) <= -1 then
        begin
          floorLine.add(IntToStr(curp0));
          TPointLine(pointlist[curp0]).floor := curTOPstorey;
        end;
        if floorLine.IndexOf(IntToStr(curp)) <= -1 then
        begin
          floorLine.add(IntToStr(curp));
          TPointLine(pointlist[curp]).floor := curTOPstorey;
        end;
      end;
    end;
    if minx <> curp then
    begin
      if floorLine.IndexOf(IntToStr(curp)) <= -1 then
      begin
        floorLine.add(IntToStr(curp));
        TPointLine(pointlist[curp]).floor := curTOPstorey;
      end;
    end;
    // memo_seaLine.Lines.Add('4:' + path);
    application.ProcessMessages;
    //////////////////////////////////////
    TPointLine(pointlist[miny]).floor := curTOPstorey;
    TPointLine(pointlist[maxx]).floor := curTOPstorey;
    TPointLine(pointlist[maxy]).floor := curTOPstorey;
    TPointLine(pointlist[minx]).floor := curTOPstorey;

    if storeyLineList[curTOPstorey].Count = 0 then
      //这是仅剩下最后一点圆心的情况
    begin
      //ss := TPointLine(pointlist[minx]).Pcode;
      //storeyLineList[curTOPstorey].add(ss);
      //storeyLineList[curTOPstorey].add(ss);
    end;

    //for j := 0 to linelist.Count - 1 do
    //begin
    //  if  storeyLineList[i].IndexOf(TlinePoint(linelist[j]).beginPcode)<=0 then
    //  storeyLineList[i].add(TlinePoint(linelist[j]).beginPcode);
    //  if  storeyLineList[i].IndexOf(TlinePoint(linelist[j]).endPcode)<=0 then
    //  storeyLineList[i].add(TlinePoint(linelist[j]).endPcode);
    //end;

    ///////////////////////////////////////////////////////////////////
    //refreshFromLineList(nil);
    ss := floorLine.Text;
    path := '';
    for i := 0 to floorLine.Count - 1 do
    begin

      pline := TlinePoint.Create(nil);
      pcode1 := pcodes[StrToInt(floorLine[i mod floorLine.Count])];
      pcode2 := pcodes[StrToInt(floorLine[(i + 1) mod floorLine.Count])];
      pcode1Shape := getpcode(pcode1);
      pcode2Shape := getpcode(pcode2);
      pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
      pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
      pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
      pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
      //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

      if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
      begin
        ScrollBox1.Canvas.pen.color := clHighlight;//clred;
        ScrollBox1.Canvas.pen.Width := 4;
      end
      else
      begin
        ScrollBox1.Canvas.pen.color := clgrayText;
        ScrollBox1.Canvas.pen.Width := 2;
      end;
      self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok
      pline.beginPcode := pcode1;
      pline.endPcode := pcode2;
      pline.beginPoint := pcode1Pointer;
      pline.endPoint := pcode2Pointer;
      pline.floor := curTOPstorey;
      ///想不到，后来修改时，少加这句，就难找不易
      linelist.Add(pline);
      if pos('-->' + pcode1, path) <= 0 then
        path := path + '-->' + pcode1;
      if pos('-->' + pcode2, path) <= 0 then
        path := path + '-->' + pcode2;

      TPointLine(pointlist[StrToInt(floorLine[i mod floorLine.Count])]).floor :=
        curTOPstorey;
      if storeyLineList[curTOPstorey].IndexOf(
        TPointLine(pointlist[StrToInt(floorLine[i mod floorLine.Count])]).Pcode) <=
        -1 then
        storeyLineList[curTOPstorey].add(
          TPointLine(pointlist[StrToInt(floorLine[i mod floorLine.Count])]).Pcode);
    end;
    storeyLineList[curTOPstorey].add(
      TPointLine(pointlist[StrToInt(floorLine[0])]).Pcode);
    memo_seaLine.Lines.Add(path);

    sortlist.Free;
    floorLine.Free;
    ///////////////////////////////////////////////////////////////////
    //refreshFromLineList(nil);
  end;


 /////}

procedure TMain.btn_seaLineFloorPointClick(Sender: TObject);
var
  i, j, k, jj, jjj, ij, ik, lmn: integer;      //memo_seaLine
  minx0, miny0, maxx0, maxy0: integer;//TPoint;
  //curp, curp0: integer;
  pline, ppline: TlinePoint;
  //pcode1, pcode2: string;
  //pcode1Shape, pcode2Shape: tshape;
  //pcode1Pointer, pcode2Pointer: tpoint;
  //pcode00: array of string;
  //pcode01: array of string;
  //pcode02: array of string;
  minH, curminH, onelong, alllong: double;
  cc: integer;
  ss: string;
  //ab, ac, bc, H, Sabc, minHH, minHHH, pp: real;
  //p, t, aaa, bbb, ccc, pp1, pp2: tpoint;
  //path, pathAlready: string;
  //p1, p2, p11, p22, oneline: string;
  //onelinelength, alllinelong: double;
  tempLineList: TFPList;//TPointerList;//TList;   // TlinePoint
  storeyLineList: array of TStringList;//TPointerList;//TList;   // TlinePoint

  floorSumCurminH: double;
  floorSumCurminHto: double;
  floorSumCurminHdownto: double;

//////////////////////////////////////////////////////
  function PPLong(a, b: Tpoint): double;
  begin
    Result := 0.0;
    Result := sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y));
  end;

  function wlog(w: string): integer;
  begin
    Result := 1;
    cc := citycount;
    //cc:=9;
    //cc:=9;
    if (ik > (cc - 2)) then
      //if (iii>(7)) then
      memo_seaLine.Lines.Add(w);
  end;


  function sealineLayer(minx, miny, maxx, maxy: integer): integer;
  var
    i, j, curTOPstorey: integer;      //memo_seaLine
    curp, curp0, tempnextp: integer;//TPoint;
    pline: TlinePoint;
    pcode1, pcode2: string;
    pcode1Shape, pcode2Shape: tshape;
    pcode1Pointer, pcode2Pointer: tpoint;
    path, ss: string;
    minpx, minpy, maxpx, maxpy: integer;
    sortlist, floorLine: TStringList;
    k1, k2, a, b, c, d: double;
  begin
    sortlist := TStringList.Create;
    floorLine := TStringList.Create;
    sortlist.Clear;
    floorLine.Clear;
    //////////////////////////////////////     四正     子午卯酉
    //minpx,minpy,maxpx,maxpy:integer;
    minpx := TPointLine(PointList[minx]).px;
    minpy := TPointLine(PointList[miny]).py;
    maxpx := TPointLine(PointList[maxx]).px;
    maxpy := TPointLine(PointList[maxy]).py;
    ///#####################################
    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
      if TPointLine(PointList[i]).floor = -1 then
        break;
    minx := i;//TPoint(PointList[0]);
    miny := minx;
    maxx := minx;
    maxy := minx;
    for i := 0 to PointList.Count - 1 do
      // PointList: TFPList;//TPointerList;//TList;  //TPointline
      if TPointLine(PointList[i]).floor = -1 then
      begin
        // ss:= TPointLine(PointList[i]).pcode;
        if TPointLine(PointList[i]).pcode = 'P9' then
          application.ProcessMessages;
        if (TPointLine(PointList[i]).px < TPointLine(PointList[minx]).px) then
          minx := i;//  TPoint(PointList[i]);
        if (TPointLine(PointList[i]).py < TPointLine(PointList[miny]).py) then
          miny := i;//  TPoint(PointList[i]);
        if (TPointLine(PointList[i]).px > TPointLine(PointList[maxx]).px) then
          maxx := i;//  TPoint(PointList[i]);
        if (TPointLine(PointList[i]).py > TPointLine(PointList[maxy]).py) then
          maxy := i;//  TPoint(PointList[i]);
      end;
    memo_seaLine.Lines.Add('第' + IntToStr(length(storeyLineList) + 1) +
      '层围城线围墙：');
    memo_seaLine.Lines.Add('minx=' + pcodes[minx]);
    memo_seaLine.Lines.Add('miny=' + pcodes[miny]);
    memo_seaLine.Lines.Add('maxx=' + pcodes[maxx]);
    memo_seaLine.Lines.Add('maxy=' + pcodes[maxy]);
    application.ProcessMessages;
    //tempLineList:=TFPList.Create;//TPointerList;//TList;   // TlinePoint
    curTOPstorey := length(storeyLineList);
    setlength(storeyLineList, curTOPstorey + 1);
    storeyLineList[curTOPstorey] := TStringList.Create;

    ////////////////////////////////////// 四正     子午卯酉
    //minpx,minpy,maxpx,maxpy:integer;
    minpx := TPointLine(PointList[minx]).px;
    minpy := TPointLine(PointList[miny]).py;
    maxpx := TPointLine(PointList[maxx]).px;
    maxpy := TPointLine(PointList[maxy]).py;
    ///#####################################
    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
      //for i := PointList.Count - 1 downto 0 do
    begin
      if TPointLine(PointList[i]).floor = -1 then
        if (TPointLine(PointList[i]).px = TPointLine(PointList[minx]).px) then
        begin
          //TPointLine(PointList[i]).floor := curTOPstorey;
          //sortlist.add(inttostr(TPointLine(PointList[i]).py)+'               '+TPointLine(PointList[i]).pcode);
          sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).py),
            10) + '               ' + IntToStr(i));
        end;
    end;
    //ss:=sortlist.text;
    sortlist.sort;
    //ss:=sortlist.text;
    //for i := 0 to sortlist.Count - 1 do
    for i := sortlist.Count - 1 downto 0 do
    begin
      floorLine.add(trim(rightstr(sortlist[i], 10)));
      //四正：酉正，从酉初到酉末
      TPointLine(PointList[StrToInt(trim(rightstr(sortlist[i], 10)))]).floor :=
        curTOPstorey;
    end;
    ss := floorLine.Text;
    if sortlist.Count > 0 then
      minx := StrToInt(trim(rightstr(sortlist[0], 10)));  //酉时末，顶上
    ///#####################################
    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
    begin
      if TPointLine(PointList[i]).floor = -1 then
        if (TPointLine(PointList[i]).py = TPointLine(PointList[miny]).py) then
        begin
          sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).px),
            10) + '               ' + IntToStr(i));
        end;
    end;
    sortlist.sort;
    if sortlist.Count > 0 then
      //miny := StrToInt(trim(rightstr(sortlist[sortlist.Count-1], 10)));//子时初
      miny := StrToInt(trim(rightstr(sortlist[0], 10)));//子时初
    application.ProcessMessages;
    curp := minx;
    curp0 := -1;
    path := '';
    while curp0 <> curp do//八极之四隅之亥，从酉末到子初也
    begin
      //if curp<>-1 then
      application.ProcessMessages;
      curp0 := curp;
      for i := 0 to PointList.Count - 1 do
        if TPointLine(PointList[i]).floor = -1 then
        begin
          if (TPointLine(PointList[i]).px < TPointLine(PointList[curp0]).px) then
            continue;
          if (TPointLine(PointList[i]).py > TPointLine(PointList[curp0]).py) then
            continue;
          if (TPointLine(PointList[i]).py > TPointLine(PointList[minx]).py) then
            continue;
          if (TPointLine(PointList[i]).px <= TPointLine(PointList[minx]).px) then
            continue;
          if (TPointLine(PointList[i]).py <= TPointLine(PointList[miny]).py) then
            continue;
          if (TPointLine(PointList[i]).px > TPointLine(PointList[miny]).px) then
            continue;
          //if (TPointLine(PointList[i]).py = TPointLine(PointList[maxx]).py) then
          // if (TPointLine(PointList[i]).px = TPointLine(PointList[miny]).px) then
          if (i = curp0) then
            continue;
          if (i = miny) then
            continue;
          if (i = minx) then
            continue;
          if (curp0 <> curp) then  //  中间    curp0--curp   curp0--i
          begin        //k1,k2,a,b,c,d:double;
            a := (TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py);
            b := (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px);
            c := (TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py);
            d := (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px);
            //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
            //if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
            //  (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
            //  ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
            //  (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
            if ((b = 0) and (d <> 0)) then
            begin
              continue;
            end;
            if ((b <> 0) and (d = 0)) then
            begin
              curp := i;
            end;
            if ((b = 0) and (d = 0)) then
            begin           //curp0,curp,i 同为垂直时，取垂直最近curp0者
              if TPointLine(PointList[i]).py > TPointLine(PointList[curp]).py then
                //这里本可以加等号，也可不要等号
                curp := i;
            end;
            if ((b <> 0) and (d <> 0)) then
              if ((a * d) = (b * c)) then
                //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
              begin
                //curp0,curp,i 同为同一条斜率直线上时，取最近curp0者
                if TPointLine(PointList[i]).py > TPointLine(PointList[curp]).py then
                  //这里本可以加等号，也可不要等号
                  curp := i;
              end
              else if ((a * d) < (b * c)) then
                //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
              begin
                curp := i;
              end;
          end
          else     //第一次
            curp := i;
        end;
      if curp0 <> curp then    //跳出循环后
      begin
        if floorLine.IndexOf(IntToStr(curp0)) <= -1 then
          floorLine.add(IntToStr(curp0));
        if floorLine.IndexOf(IntToStr(curp)) <= -1 then
          floorLine.add(IntToStr(curp));
        TPointLine(PointList[curp0]).floor := curTOPstorey;
        TPointLine(PointList[curp]).floor := curTOPstorey;
      end;
    end;


    if miny <> curp then
    begin
      if floorLine.IndexOf(IntToStr(curp)) <= -1 then
      begin
        floorLine.add(IntToStr(curp));
        TPointLine(pointlist[curp]).floor := curTOPstorey;
      end;
    end;
    //TPointLine(pointlist[miny]).floor := curTOPstorey;
    //memo_seaLine.Lines.Add('1:' + path);
    ss := floorLine.Text;
    application.ProcessMessages;
    ///////////////////////////////////////////////////////////////////
    ///#####################################
    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
    begin
      if TPointLine(PointList[i]).floor = -1 then
        if (TPointLine(PointList[i]).py = TPointLine(PointList[miny]).py) then
        begin
          sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).px),
            10) + '               ' + IntToStr(i));
        end;
    end;
    sortlist.sort;
    for i := 0 to sortlist.Count - 1 do
      // for i := sortlist.Count - 1 downto 0 do
    begin
      floorLine.add(trim(rightstr(sortlist[i], 10)));
      //四正：子正，从子初到子末
      TPointLine(PointList[StrToInt(trim(rightstr(sortlist[i], 10)))]).floor :=
        curTOPstorey;
    end;
    ss := sortlist.Text;
    if sortlist.Count > 0 then
      miny := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));
    //子时末，右侧
    ///#####################################
    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
    begin
      if TPointLine(PointList[i]).floor = -1 then
        if (TPointLine(PointList[i]).px = TPointLine(PointList[maxx]).px) then
        begin
          sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).py),
            10) + '               ' + IntToStr(i));
        end;
    end;
    sortlist.sort;
    if sortlist.Count > 0 then
      // maxx := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));//卯时初
      maxx := StrToInt(trim(rightstr(sortlist[0], 10)));//卯时初
    //////////////////////////////////////
    application.ProcessMessages;
    curp := miny;
    curp0 := -1;
    path := '';
    while curp0 <> curp do //八极之四隅之寅，从子末到卯初
    begin
      application.ProcessMessages;
      curp0 := curp;
      for i := 0 to PointList.Count - 1 do
        if TPointLine(PointList[i]).floor = -1 then
        begin
          if (TPointLine(PointList[i]).px < TPointLine(PointList[curp0]).px) then
            continue;
          if (TPointLine(PointList[i]).py < TPointLine(PointList[curp0]).py) then
            continue;
          if (TPointLine(PointList[i]).py > TPointLine(PointList[maxx]).py) then
            continue;
          if (TPointLine(PointList[i]).px >= TPointLine(PointList[maxx]).px) then
            continue;
          if (TPointLine(PointList[i]).py <= TPointLine(PointList[miny]).py) then
            continue;
          if (TPointLine(PointList[i]).px < TPointLine(PointList[miny]).px) then
            continue;
          //if (TPointLine(PointList[i]).py = TPointLine(PointList[maxx]).py) then
          // if (TPointLine(PointList[i]).px = TPointLine(PointList[miny]).px) then
          if (i = curp0) then
            continue;
          if (i = miny) then
            continue;
          if (i = maxx) then
            continue;
          if (curp0 <> curp) then  //  中间    curp0--curp   curp0--i
          begin        //k1,k2,a,b,c,d:double;
            a := (TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py);
            b := (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px);
            c := (TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py);
            d := (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px);
            //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
            //if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
            //  (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
            //  ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
            //  (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
            if ((b = 0) and (d <> 0)) then
            begin
              continue;
            end;
            if ((b <> 0) and (d = 0)) then
            begin
              curp := i;
            end;
            if ((b = 0) and (d = 0)) then
            begin           //curp0,curp,i 同为垂直时，取垂直最近curp0者
              if TPointLine(PointList[i]).py < TPointLine(PointList[curp]).py then
                //这里本可以加等号，也可不要等号
                curp := i;
            end;
            if ((b <> 0) and (d <> 0)) then
              if ((a * d) = (b * c)) then
                //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
              begin
                //curp0,curp,i 同为同一条斜率直线上时，取最近curp0者
                if TPointLine(PointList[i]).py < TPointLine(PointList[curp]).py then
                  //这里本可以加等号，也可不要等号
                  curp := i;
              end
              else if ((a * d) < (b * c)) then
                //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
              begin
                curp := i;
              end;
          end
          else     //第一次
            curp := i;
        end;
      if curp0 <> curp then    //跳出循环后
      begin
        if floorLine.IndexOf(IntToStr(curp0)) <= -1 then
          floorLine.add(IntToStr(curp0));
        if floorLine.IndexOf(IntToStr(curp)) <= -1 then
          floorLine.add(IntToStr(curp));
        TPointLine(PointList[curp0]).floor := curTOPstorey;
        TPointLine(PointList[curp]).floor := curTOPstorey;
      end;
    end;
    if maxx <> curp then
    begin
      if floorLine.IndexOf(IntToStr(curp)) <= -1 then
      begin
        floorLine.add(IntToStr(curp));
        TPointLine(pointlist[curp]).floor := curTOPstorey;
      end;
    end;
    // memo_seaLine.Lines.Add('2:' + path);
    ss := floorLine.Text;
    application.ProcessMessages;
    ////////////////////////////////////////////////////////////////////
    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
    begin
      if TPointLine(PointList[i]).floor = -1 then
        if (TPointLine(PointList[i]).px = TPointLine(PointList[maxx]).px) then
        begin
          sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).py),
            10) + '               ' + IntToStr(i));
        end;
    end;
    sortlist.sort;
    for i := 0 to sortlist.Count - 1 do
      // for i := sortlist.Count - 1 downto 0 do
    begin
      floorLine.add(trim(rightstr(sortlist[i], 10)));
      //四正：卯正，从卯初到卯末
      TPointLine(PointList[StrToInt(trim(rightstr(sortlist[i], 10)))]).floor :=
        curTOPstorey;
    end;
    if sortlist.Count > 0 then
      maxx := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));
    //卯时末，右底

    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
    begin
      if TPointLine(PointList[i]).floor = -1 then
        if (TPointLine(PointList[i]).py = TPointLine(PointList[maxy]).py) then
        begin
          sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).px),
            10) + '               ' + IntToStr(i));
        end;
    end;
    sortlist.sort;
    ss := sortlist.Text;
    if sortlist.Count > 0 then
      maxy := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));//午时初

    ///#####################################
    ss := floorLine.Text;
    application.ProcessMessages;
    curp := maxx;
    curp0 := -1;
    path := '';
    while curp0 <> curp do//八极之四隅之巳，从卯末到午初
    begin
      application.ProcessMessages;
      curp0 := curp;
      //for i := 0 to PointList.Count - 1 do
      for i := 0 to PointList.Count - 1 do
        if TPointLine(PointList[i]).floor = -1 then
        begin
          if (TPointLine(PointList[i]).px > TPointLine(PointList[curp0]).px) then
            continue;
          if (TPointLine(PointList[i]).py < TPointLine(PointList[curp0]).py) then
            continue;
          if (TPointLine(PointList[i]).py < TPointLine(PointList[maxx]).py) then
            continue;
          if (TPointLine(PointList[i]).px >= TPointLine(PointList[maxx]).px) then
            continue;
          if (TPointLine(PointList[i]).py >= TPointLine(PointList[maxy]).py) then
            continue;
          if (TPointLine(PointList[i]).px < TPointLine(PointList[maxy]).px) then
            continue;
          //if (TPointLine(PointList[i]).py = TPointLine(PointList[maxx]).py) then
          // if (TPointLine(PointList[i]).px = TPointLine(PointList[miny]).px) then
          if (i = curp0) then
            continue;
          if (i = maxy) then
            continue;
          if (i = maxx) then
            continue;
          if (curp0 <> curp) then  //  中间    curp0--curp   curp0--i
          begin        //k1,k2,a,b,c,d:double;
            a := (TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py);
            b := (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px);
            c := (TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py);
            d := (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px);
            //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
            //if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
            //  (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
            //  ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
            //  (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
            if ((b = 0) and (d <> 0)) then
            begin
              continue;
            end;
            if ((b <> 0) and (d = 0)) then
            begin
              curp := i;
            end;
            if ((b = 0) and (d = 0)) then
            begin           //curp0,curp,i 同为垂直时，取垂直最近curp0者
              if TPointLine(PointList[i]).py < TPointLine(PointList[curp]).py then
                //这里本可以加等号，也可不要等号
                curp := i;
            end;
            if ((b <> 0) and (d <> 0)) then
              if ((a * d) = (b * c)) then
                //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
              begin
                //curp0,curp,i 同为同一条斜率直线上时，取最近curp0者
                if TPointLine(PointList[i]).py < TPointLine(PointList[curp]).py then
                  //这里本可以加等号，也可不要等号
                  curp := i;
              end
              else if ((a * d) < (b * c)) then
                //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
              begin
                curp := i;
              end;
          end
          else     //第一次
            curp := i;
        end;
      if curp0 <> curp then    //跳出循环后
      begin
        if floorLine.IndexOf(IntToStr(curp0)) <= -1 then
          floorLine.add(IntToStr(curp0));
        if floorLine.IndexOf(IntToStr(curp)) <= -1 then
          floorLine.add(IntToStr(curp));
        TPointLine(PointList[curp0]).floor := curTOPstorey;
        TPointLine(PointList[curp]).floor := curTOPstorey;
      end;
    end;
    if maxy <> curp then
    begin
      if floorLine.IndexOf(IntToStr(curp)) <= -1 then
      begin
        floorLine.add(IntToStr(curp));
        TPointLine(pointlist[curp]).floor := curTOPstorey;
      end;
    end;
    //  memo_seaLine.Lines.Add('3:' + path);
    ss := floorLine.Text;
    application.ProcessMessages;
    //////////////////////////////////////
    ///#####################################
    sortlist.Clear;
    for i := 0 to PointList.Count - 1 do
    begin
      if TPointLine(PointList[i]).floor = -1 then
        if (TPointLine(PointList[i]).py = TPointLine(PointList[maxy]).py) then
        begin
          sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).px),
            10) + '               ' + IntToStr(i));
        end;
    end;
    sortlist.sort;
    //for i := 0 to sortlist.Count - 1 do
    for i := sortlist.Count - 1 downto 0 do
    begin
      floorLine.add(trim(rightstr(sortlist[i], 10)));  //四正之午正（含午初）
      TPointLine(PointList[StrToInt(trim(rightstr(sortlist[i], 10)))]).floor :=
        curTOPstorey;
    end;
    //  maxy := StrToInt(sortlist[0]);
    // if floorLine.IndexOf(IntToStr(maxy)) <= -1 then
    //   floorLine.add(IntToStr(maxy));
    if sortlist.Count > 0 then
      maxy := StrToInt(trim(rightstr(sortlist[0], 10)));//午末
    ss := floorLine.Text;
    application.ProcessMessages;
    //sortlist.Clear;
    //for i := 0 to PointList.Count - 1 do
    //begin
    //  if TPointLine(PointList[i]).floor = -1 then  //这里又产生BUG，如果为floor = -1，则没有数据，下标-1报错
    //    if (TPointLine(PointList[i]).px = TPointLine(PointList[minx]).px) then
    //    begin
    //      sortlist.add(rightstr('0000000000' + IntToStr(TPointLine(PointList[i]).py), 10) +
    //        '               ' + IntToStr(i));
    //    end;
    //end;
    //sortlist.sort;
    // minx := StrToInt(trim(rightstr(sortlist[sortlist.Count - 1], 10)));//酉之初
    minx := StrToInt(floorLine[0]);//酉之初
    //////////////////////////////////////
    application.ProcessMessages;
    curp := maxy;
    curp0 := -1;
    path := '';
    // tempnextp := -1;
    while curp0 <> curp do//午末与酉初之间的四隅之申
    begin
      application.ProcessMessages;
      curp0 := curp;
      //for i := 0 to PointList.Count - 1 do
      for i := 0 to PointList.Count - 1 do
        if TPointLine(PointList[i]).floor = -1 then
        begin
          if (TPointLine(PointList[i]).px > TPointLine(PointList[curp0]).px) then
            continue;
          if (TPointLine(PointList[i]).py > TPointLine(PointList[curp0]).py) then
            continue;
          if (TPointLine(PointList[i]).py >= TPointLine(PointList[maxy]).py) then
            continue;
          if (TPointLine(PointList[i]).px > TPointLine(PointList[maxy]).px) then
            continue;
          if (TPointLine(PointList[i]).py < TPointLine(PointList[minx]).py) then
            continue;
          if (TPointLine(PointList[i]).px <= TPointLine(PointList[minx]).px) then
            continue;
          //if (TPointLine(PointList[i]).py = TPointLine(PointList[maxx]).py) then
          // if (TPointLine(PointList[i]).px = TPointLine(PointList[miny]).px) then
          if (i = curp0) then
            continue;
          if (i = minx) then
            continue;
          if (i = maxx) then
            continue;
          if (curp0 <> curp) then  //  中间    curp0--curp   curp0--i
          begin        //k1,k2,a,b,c,d:double;
            a := (TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py);
            b := (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px);
            c := (TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py);
            d := (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px);
            //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
            //if ((TPointLine(PointList[i]).py - TPointLine(PointList[curp0]).py) /
            //  (TPointLine(PointList[i]).px - TPointLine(PointList[curp0]).px)) <
            //  ((TPointLine(PointList[curp]).py - TPointLine(PointList[curp0]).py) /
            //  (TPointLine(PointList[curp]).px - TPointLine(PointList[curp0]).px)) then
            if ((b = 0) and (d <> 0)) then
            begin
              continue;
            end;
            if ((b <> 0) and (d = 0)) then
            begin
              curp := i;
            end;
            if ((b = 0) and (d = 0)) then
            begin           //curp0,curp,i 同为垂直时，取垂直最近curp0者
              if TPointLine(PointList[i]).py > TPointLine(PointList[curp]).py then
                //这里本可以加等号，也可不要等号
                curp := i;
            end;
            if ((b <> 0) and (d <> 0)) then
              if ((a * d) = (b * c)) then
                //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
              begin
                //curp0,curp,i 同为同一条斜率直线上时，取最近curp0者
                if TPointLine(PointList[i]).py > TPointLine(PointList[curp]).py then
                  //这里本可以加等号，也可不要等号
                  curp := i;
              end
              else if ((a * d) < (b * c)) then
                //  k1:=a/b ;  k2:=c/d;      k1<k2    a/b<c/d   ad<bc
              begin
                curp := i;
              end;
          end
          else     //第一次
            curp := i;
        end;
      if curp0 <> curp then    //跳出循环后
      begin
        if floorLine.IndexOf(IntToStr(curp0)) <= -1 then
        begin
          floorLine.add(IntToStr(curp0));
          TPointLine(PointList[curp0]).floor := curTOPstorey;
        end;
        if floorLine.IndexOf(IntToStr(curp)) <= -1 then
        begin
          floorLine.add(IntToStr(curp));
          TPointLine(PointList[curp]).floor := curTOPstorey;
        end;
      end;
    end;
    if minx <> curp then
    begin
      if floorLine.IndexOf(IntToStr(curp)) <= -1 then
      begin
        floorLine.add(IntToStr(curp));
        TPointLine(pointlist[curp]).floor := curTOPstorey;
      end;
    end;
    // memo_seaLine.Lines.Add('4:' + path);
    application.ProcessMessages;
    //////////////////////////////////////
    TPointLine(pointlist[miny]).floor := curTOPstorey;
    TPointLine(pointlist[maxx]).floor := curTOPstorey;
    TPointLine(pointlist[maxy]).floor := curTOPstorey;
    TPointLine(pointlist[minx]).floor := curTOPstorey;

    if storeyLineList[curTOPstorey].Count = 0 then
      //这是仅剩下最后一点圆心的情况
    begin
      //ss := TPointLine(pointlist[minx]).Pcode;
      //storeyLineList[curTOPstorey].add(ss);
      //storeyLineList[curTOPstorey].add(ss);
    end;

    //for j := 0 to linelist.Count - 1 do
    //begin
    //  if  storeyLineList[i].IndexOf(TlinePoint(linelist[j]).beginPcode)<=0 then
    //  storeyLineList[i].add(TlinePoint(linelist[j]).beginPcode);
    //  if  storeyLineList[i].IndexOf(TlinePoint(linelist[j]).endPcode)<=0 then
    //  storeyLineList[i].add(TlinePoint(linelist[j]).endPcode);
    //end;

    ///////////////////////////////////////////////////////////////////
    //refreshFromLineList(nil);
    ss := floorLine.Text;
    path := '';
    //if curTOPstorey>=2 then
    // exit;
    for i := 0 to floorLine.Count - 1 do
    begin

      pline := TlinePoint.Create(nil);
      pcode1 := pcodes[StrToInt(floorLine[i mod floorLine.Count])];
      pcode2 := pcodes[StrToInt(floorLine[(i + 1) mod floorLine.Count])];
      pcode1Shape := getpcode(pcode1);
      pcode2Shape := getpcode(pcode2);
      pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
      pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
      pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
      pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
      //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

      if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
      begin
        ScrollBox1.Canvas.pen.color := clHighlight;//clred;
        ScrollBox1.Canvas.pen.Width := 4;
      end
      else
      begin
        ScrollBox1.Canvas.pen.color := clgrayText;
        ScrollBox1.Canvas.pen.Width := 2;
      end;
      self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok
      pline.beginPcode := pcode1;
      pline.endPcode := pcode2;
      pline.beginPoint := pcode1Pointer;
      pline.endPoint := pcode2Pointer;
      pline.floor := curTOPstorey;
      ///想不到，后来修改时，少加这句，就难找不易
      linelist.Add(pline);
      if pos('-->' + pcode1, path) <= 0 then
        path := path + '-->' + pcode1;
      if pos('-->' + pcode2, path) <= 0 then
        path := path + '-->' + pcode2;

      TPointLine(pointlist[StrToInt(floorLine[i mod floorLine.Count])]).floor :=
        curTOPstorey;
      if storeyLineList[curTOPstorey].IndexOf(
        TPointLine(pointlist[StrToInt(floorLine[i mod floorLine.Count])]).Pcode) <=
        -1 then
        storeyLineList[curTOPstorey].add(
          TPointLine(pointlist[StrToInt(floorLine[i mod floorLine.Count])]).Pcode);
    end;
    storeyLineList[curTOPstorey].add(
      TPointLine(pointlist[StrToInt(floorLine[0])]).Pcode);
    memo_seaLine.Lines.Add(path);

    sortlist.Free;
    floorLine.Free;
    ///////////////////////////////////////////////////////////////////
    //refreshFromLineList(nil);
  end;

begin
  memo_seaLine.Lines.Clear;
  pcodeAndPointLineListFromSQL;

  //for i := 1 to PointList.Count - 2 do
  //  for j := i + 1 to PointList.Count - 1 do
  //    if TPointLine(PointList[i]).px = TPointLine(PointList[j]).px then
  //      if TPointLine(PointList[i]).py = TPointLine(PointList[j]).py then
  //      begin
  //        ss := TPointLine(PointList[i]).Pcode + '坐标相同' +
  //          TPointLine(PointList[j]).Pcode + '暂将' +
  //          TPointLine(PointList[j]).Pcode +
  //          '的x与y坐标像素值各加1像素临时处理';
  //        ShowMessage(ss);    //P229
  //         // TPointLine(PointList[j]).px := TPointLine(PointList[j]).px + 1;
  //          TPointLine(PointList[j]).py := TPointLine(PointList[j]).py + 1;
  //      end;

  for i := 1 to PointList.Count - 1 do
    TPointLine(PointList[i]).floor := -1;
  for i := 1 to lineList.Count - 1 do
    TLinePoint(lineList[i]).floor := -1;
  minx0 := 0;//TPoint(PointList[0]);
  miny0 := minx0;
  maxx0 := minx0;
  maxy0 := minx0;

  for i := 1 to PointList.Count - 1 do
    // PointList: TFPList;//TPointerList;//TList;  //TPointline
  begin
    if (TPointLine(PointList[i]).px < TPointLine(PointList[minx0]).px) then
      minx0 := i;//  TPoint(PointList[i]);
    if (TPointLine(PointList[i]).py < TPointLine(PointList[miny0]).py) then
      miny0 := i;//  TPoint(PointList[i]);
    if (TPointLine(PointList[i]).px > TPointLine(PointList[maxx0]).px) then
      maxx0 := i;//  TPoint(PointList[i]);
    if (TPointLine(PointList[i]).py > TPointLine(PointList[maxy0]).py) then
      maxy0 := i;//  TPoint(PointList[i]);
  end;
  memo_seaLine.Lines.Add('minx=' + pcodes[minx0]);
  memo_seaLine.Lines.Add('miny=' + pcodes[miny0]);
  memo_seaLine.Lines.Add('maxx=' + pcodes[maxx0]);
  memo_seaLine.Lines.Add('maxy=' + pcodes[maxy0]);
  application.ProcessMessages;
  memo_seaLine.Lines.Add('最外层围城线围墙：');
  for i := lineList.Count - 1 downto 0 do
  begin
    try
      //if tobject(shapeList.Items[i]) is TlinePoint then
      if lineList.Items[i] <> nil then
      begin
        TlinePoint(lineList.Items[i]).Free;
        lineList.Items[i] := nil;
        lineList.Count := lineList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  lineList.Clear;
  for i := TPsubpPointList.Count - 1 downto 0 do
  begin
    try
      if (TPsubpPointList.Items[i]) <> nil then
      begin
        TPsubpPoint(TPsubpPointList.Items[i]).Free;
        TPsubpPointList.Items[i] := nil;
        TPsubpPointList.Count := TPsubpPointList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  TPsubpPointList.Clear;

  image1.Refresh;
  /////////////////////////////////////////////////////////////////
  sealine000(minx0, miny0, maxx0, maxy0);        //最外层，另外计算
  //exit;
  ////////////////////////////////////////////////
  setlength(storeyLineList, 1);
  storeyLineList[0] := TStringList.Create;
  for i := 0 to linelist.Count - 1 do
  begin
    if storeyLineList[0].IndexOf(TlinePoint(linelist[i]).beginPcode) <= -1 then
      storeyLineList[0].add(TlinePoint(linelist[i]).beginPcode);
    if storeyLineList[0].IndexOf(TlinePoint(linelist[i]).endPcode) <= -1 then
      storeyLineList[0].add(TlinePoint(linelist[i]).endPcode);
    TlinePoint(linelist[i]).floor := 0;
    // TPointLine(pointlist[getPcodeIndex(TlinePoint(linelist[i]).beginPcode)]).floor := 0 ;
    // TPointLine(pointlist[getPcodeIndex(TlinePoint(linelist[i]).endPcode)]).floor := 0 ;
  end;
  // storeyLineList[0].add(tstringlist(storeyLineList[0])[0]);
  ss := storeyLineList[0].Text;    //第一层，已是首尾相接
  //for i := 0 to pointlist.Count - 1 do
  //begin
  //  if  TPointLine(pointlist[i]).Pcode='P3' then
  //  application.ProcessMessages;
  //  ss:= TPointLine(pointlist[i]).Pcode ;
  //  j:= TPointLine(pointlist[i]).floor;
  //  application.ProcessMessages;
  ////  if storeyLineList[0].IndexOf(TPointLine(pointlist[i]).Pcode) <= 0 then
  // //   TPointLine(pointlist[i]).floor := 0
  // // else
  //  //  TPointLine(pointlist[i]).floor := -1;
  //end;
  for i := 0 to storeyLineList[0].Count - 1 do
  begin
    ss := (storeyLineList[0][i]);
    j := getPcodeIndex(ss);
    TPointLine(pointlist[j]).floor := 0;
  end;
  TPointLine(pointlist[miny0]).floor := 0;
  TPointLine(pointlist[maxx0]).floor := 0;
  TPointLine(pointlist[maxy0]).floor := 0;
  TPointLine(pointlist[minx0]).floor := 0;
  /////////////////////////
  i := 1;
  while i > 0 do
  begin
    i := 0;
    for j := 0 to pointlist.Count - 1 do
      //pointlist所有点集，未分层的全点集
      if TPointLine(pointlist[j]).floor = -1 then
        I := i + 1;
    if i = 1 then
      application.ProcessMessages;
    if i > 0 then
      seaLineLayer(0, 0, 0, 0);    //求出所有层
    //seaLineLayer000(0, 0, 0, 0);    //求出所有层
    //sealineLayerTEST(0, 0, 0, 0);    //求出所有层
  end;
  ////////////////////////
  //exit;
  for i := 0 to length(storeyLineList) - 1 do  //每一层点集
    memo_seaLine.Lines.Add(IntToStr(i) + '=' + storeyLineList[i].Text);
  //  exit;
  for i := 0 to length(storeyLineList) - 2 do  //每一层点集
    //for i := 0 to length(storeyLineList) - 3 do  //每一层点集 for test
  begin
    // for j := 0 to pointList.Count - 1 do   //pointlist所有点集，未分层的全点集
    //正是这种循环不行，要用层内的for j := 0 to storeyLineList[i].Count - 1 do
    //  for j := 0 to storeyLineList[i].Count - 1 do
    //  begin
    //    jjj := -1;
    //  for k := 0 to LineList.Count - 1 do     //pointlist所有点集，未分层的全点集
    //正是这种循环不行，要用层内的for k := 0 to storeyLineList[i+1].Count - 1 do
    // lmn := storeyLineList[i + 1].Count;
    //  ss:= storeyLineList[i].text;
    //  ss:= storeyLineList[i + 1].text;

    /////////////////////////////////////////////
    if TButton(Sender).Caption = '海岸线算法(逐层且再逐点)或顺时或逆时'
    then
      // if 1 = 2 then
    begin
      floorSumCurminH := 0;
      for k := 0 to storeyLineList[i + 1].Count - 2 do
        // j  out lower  k要高层内层，j在低层外层
        //for k :=  storeyLineList[i+1].Count - 2 downto 0 do     //  k in   high  k要高层内层，j在低层外层
      begin
        for lmn := pointList.Count - 1 downto 0 do
          if TPointLine(pointList[lmn]).pcode = ((storeyLineList[i + 1])[k]) then
            break;
        if TPointLine(pointList[lmn]).floor = -111 then
          continue;
        minH := 10000000;
        ij := -1;
        ik := -1;
        jjj := -1;
        for j := 0 to storeyLineList[i].Count - 2 do
          // j  out lower  k要高层内层，j在低层外层
          //for j :=  storeyLineList[i].Count - 2 downto 0 do           //  k in   high  k要高层内层，j在低层外层
        begin
          curminH := (PPLong(fromPcodeGetPoint((storeyLineList[i + 1])
            [k]), fromPcodeGetPoint((storeyLineList[i])[j])) +
            PPLong(fromPcodeGetPoint((storeyLineList[i + 1])[k]),
            fromPcodeGetPoint((storeyLineList[i])
            [(j + 1) mod storeyLineList[i].Count])) - PPLong(fromPcodeGetPoint(
            (storeyLineList[i])[j]), fromPcodeGetPoint((storeyLineList[i])
            [(j + 1) mod storeyLineList[i].Count])));
          if curminH <= minH then
            //if curminH < minH then
            //此处加上等号，在三种坐标中，在坐标点是十分规则的矩形分布坐标轴一样整点时，也比原先的解优胜了
          begin   //此处未处理是不是相交线，所以可能时或偶有相交线出现乎
            minH := curminH;
            ij := j;    //ii  j    in   high
            ik := k;   //iii   k  out  lower
            jjj := 1;
          end;
        end;  //for j
        /////////////////////////////////////////

        if jjj = 1 then
        begin
          floorSumCurminH := floorSumCurminH + minH;
          for jjj := pointList.Count - 1 downto 0 do
            //将原先内层高层的点，先标记，到时全删除乎
            if TPointLine(pointList[jjj]).pcode = ((storeyLineList[i + 1])[ik]) then
              TPointLine(pointList[jjj]).floor := -111;
        end;
      end;  //for k

      floorSumCurminHto := floorSumCurminH;


      for jjj := pointList.Count - 1 downto 0 do
        for ik := (storeyLineList[i + 1]).Count - 1 downto 0 do
          if TPointLine(pointList[jjj]).pcode = ((storeyLineList[i + 1])[ik]) then
            TPointLine(pointList[jjj]).floor := i + 1;

      floorSumCurminH := 0;
      //for k := 0 to storeyLineList[i + 1].Count - 2 do       // j  out lower  k要高层内层，j在低层外层
      for k := storeyLineList[i + 1].Count - 2 downto 0 do
        //  k in   high  k要高层内层，j在低层外层
      begin
        for lmn := pointList.Count - 1 downto 0 do
          if TPointLine(pointList[lmn]).pcode = ((storeyLineList[i + 1])[k]) then
            break;
        if TPointLine(pointList[lmn]).floor = -111 then
          continue;
        minH := 10000000;
        ij := -1;
        ik := -1;
        jjj := -1;
        for j := 0 to storeyLineList[i].Count - 2 do
          // j  out lower  k要高层内层，j在低层外层
          //for j :=  storeyLineList[i].Count - 2 downto 0 do           //  k in   high  k要高层内层，j在低层外层
        begin
          curminH := (PPLong(fromPcodeGetPoint((storeyLineList[i + 1])
            [k]), fromPcodeGetPoint((storeyLineList[i])[j])) +
            PPLong(fromPcodeGetPoint((storeyLineList[i + 1])[k]),
            fromPcodeGetPoint((storeyLineList[i])
            [(j + 1) mod storeyLineList[i].Count])) - PPLong(fromPcodeGetPoint(
            (storeyLineList[i])[j]), fromPcodeGetPoint((storeyLineList[i])
            [(j + 1) mod storeyLineList[i].Count])));
          if curminH <= minH then
            //if curminH < minH then
            //此处加上等号，在三种坐标中，在坐标点是十分规则的矩形分布坐标轴一样整点时，也比原先的解优胜了
          begin   //此处未处理是不是相交线，所以可能时或偶有相交线出现乎
            minH := curminH;
            ij := j;    //ii  j    in   high
            ik := k;   //iii   k  out  lower
            jjj := 1;
          end;
        end;  //for j
        /////////////////////////////////////////

        if jjj = 1 then
        begin
          floorSumCurminH := floorSumCurminH + minH;
          for jjj := pointList.Count - 1 downto 0 do
            //将原先内层高层的点，先标记，到时全删除乎
            if TPointLine(pointList[jjj]).pcode = ((storeyLineList[i + 1])[ik]) then
              TPointLine(pointList[jjj]).floor := -111;
        end;
      end;  //for k

      floorSumCurminHdownto := floorSumCurminH;

      for jjj := pointList.Count - 1 downto 0 do
        for ik := (storeyLineList[i + 1]).Count - 1 downto 0 do
          if TPointLine(pointList[jjj]).pcode = ((storeyLineList[i + 1])[ik]) then
            TPointLine(pointList[jjj]).floor := i + 1;

      if floorSumCurminHto < floorSumCurminHdownto then
      begin
        for k := 0 to storeyLineList[i + 1].Count - 2 do
          // j  out lower  k要高层内层，j在低层外层
          //for k := storeyLineList[i + 1].Count - 2 downto 0 do      // k in   high k要高层内层，j在低层外层
          //  k in   high  k要高层内层，j在低层外层
          // if (TlinePoint(linelist[j]).floor = (i)) then
          //   if (TlinePoint(linelist[k]).floor = (i+1)) then
          //if (TlinePoint(linelist[k]).floor <>-111) then
        begin
          for lmn := pointList.Count - 1 downto 0 do
            if TPointLine(pointList[lmn]).pcode = ((storeyLineList[i + 1])[k]) then
              break;
          if TPointLine(pointList[lmn]).floor = -111 then
            continue;
          minH := 10000000;
          ij := -1;
          ik := -1;
          jjj := -1;
          for j := 0 to storeyLineList[i].Count - 2 do
            // j  out lower  k要高层内层，j在低层外层
            //for j :=  storeyLineList[i].Count - 2 downto 0 do           //  k in   high  k要高层内层，j在低层外层
          begin
            curminH := (PPLong(fromPcodeGetPoint((storeyLineList[i + 1])
              [k]), fromPcodeGetPoint((storeyLineList[i])[j])) +
              PPLong(fromPcodeGetPoint((storeyLineList[i + 1])[k]),
              fromPcodeGetPoint((storeyLineList[i])
              [(j + 1) mod storeyLineList[i].Count])) -
              PPLong(fromPcodeGetPoint((storeyLineList[i])[j]),
              fromPcodeGetPoint((storeyLineList[i])
              [(j + 1) mod storeyLineList[i].Count])));
            if curminH <= minH then
              //if curminH < minH then
              //此处加上等号，在三种坐标中，在坐标点是十分规则的矩形分布坐标轴一样整点时，也比原先的解优胜了
            begin   //此处未处理是不是相交线，所以可能时或偶有相交线出现乎
              minH := curminH;
              ij := j;    //ii  j    in   high
              ik := k;   //iii   k  out  lower
              jjj := 1;
            end;
          end;  //for j
          /////////////////////////////////////////
          if jjj = 1 then
          begin
            pline := TlinePoint.Create(nil);
            pline.beginPcode := ((storeyLineList[i])[ij]);
            pline.endPcode := ((storeyLineList[i + 1])[ik]);
            pline.beginPoint := fromPcodeGetPoint((storeyLineList[i])[ij]);
            pline.endPoint := fromPcodeGetPoint((storeyLineList[i + 1])[ik]);
            pline.floor := i;
            linelist.Add(pline);

            pline := TlinePoint.Create(nil);
            pline.beginPcode := ((storeyLineList[i])
              [(ij + 1) mod storeyLineList[i].Count]);
            pline.endPcode := ((storeyLineList[i + 1])[ik]);
            pline.beginPoint := fromPcodeGetPoint((storeyLineList[i])
              [(ij + 1) mod storeyLineList[i].Count]);
            pline.endPoint := fromPcodeGetPoint((storeyLineList[i + 1])[ik]);
            pline.floor := i;
            linelist.Add(pline);
            // 三角形中两边替换一边，一种类似最短路径算法中的弗洛伊德算法中的松弛操作relax operation
            //memo_seaLine.Lines.Add(((storeyLineList[i])[ij]) +
            //  ((storeyLineList[i + 1])[ik]) + '和' + ((storeyLineList[i])
            //  [(ij + 1) mod storeyLineList[i].Count]) + ((storeyLineList[i + 1])
            //  [ik]) + '替换' + ((storeyLineList[i])[ij]) + ((storeyLineList[i])
            //  [(ij + 1) mod storeyLineList[i].Count]));

            for jjj := lineList.Count - 1 downto 0 do
            begin
              //三角形中两边替换一边，将另一边先标记，到时统一删除，系统功能限制，不能立即删除乎
              if (TlinePoint(linelist[jjj]).beginPcode + TlinePoint(
                linelist[jjj]).endPcode) = ((storeyLineList[i])
                [ij]) + ((storeyLineList[i])[(ij + 1) mod storeyLineList[i].Count]) then
                TlinePoint(linelist[jjj]).floor := -111;
              if (TlinePoint(linelist[jjj]).endPcode + TlinePoint(
                linelist[jjj]).beginPcode) = ((storeyLineList[i])
                [ij]) + ((storeyLineList[i])[(ij + 1) mod storeyLineList[i].Count]) then
                TlinePoint(linelist[jjj]).floor := -111;
            end;
            for jjj := pointList.Count - 1 downto 0 do
              //将原先内层高层的点，先标记，到时全删除乎
              if TPointLine(pointList[jjj]).pcode = ((storeyLineList[i + 1])[ik]) then
                TPointLine(pointList[jjj]).floor := -111;

            //tstringlist(storeyLineList[i])[ij+1].Delete;
            //tstringlist(storeyLineList[i])[ij].Delete;
            TStringList(storeyLineList[i]).insert(ij + 1,
              TStringList(storeyLineList[i + 1])[ik]);
            //三角形中两边替换一边，实际相当于在原来的两点路径中插入一个新点
          end;
          //if jjj = 2 then
          begin
          end;
        end;  //for k
      end;
      if floorSumCurminHdownto <= floorSumCurminHto then
      begin
        //     for k := 0 to storeyLineList[i + 1].Count - 2 do       // j  out lower  k要高层内层，j在低层外层
        for k := storeyLineList[i + 1].Count - 2 downto 0 do
          // k in   high k要高层内层，j在低层外层
          //  k in   high  k要高层内层，j在低层外层
          // if (TlinePoint(linelist[j]).floor = (i)) then
          //   if (TlinePoint(linelist[k]).floor = (i+1)) then
          //if (TlinePoint(linelist[k]).floor <>-111) then
        begin
          for lmn := pointList.Count - 1 downto 0 do
            if TPointLine(pointList[lmn]).pcode = ((storeyLineList[i + 1])[k]) then
              break;
          if TPointLine(pointList[lmn]).floor = -111 then
            continue;
          minH := 10000000;
          ij := -1;
          ik := -1;
          jjj := -1;
          for j := 0 to storeyLineList[i].Count - 2 do
            // j  out lower  k要高层内层，j在低层外层
            //for j :=  storeyLineList[i].Count - 2 downto 0 do           //  k in   high  k要高层内层，j在低层外层
          begin
            curminH := (PPLong(fromPcodeGetPoint((storeyLineList[i + 1])
              [k]), fromPcodeGetPoint((storeyLineList[i])[j])) +
              PPLong(fromPcodeGetPoint((storeyLineList[i + 1])[k]),
              fromPcodeGetPoint((storeyLineList[i])
              [(j + 1) mod storeyLineList[i].Count])) -
              PPLong(fromPcodeGetPoint((storeyLineList[i])[j]),
              fromPcodeGetPoint((storeyLineList[i])
              [(j + 1) mod storeyLineList[i].Count])));
            if curminH <= minH then
              //if curminH < minH then
              //此处加上等号，在三种坐标中，在坐标点是十分规则的矩形分布坐标轴一样整点时，也比原先的解优胜了
            begin   //此处未处理是不是相交线，所以可能时或偶有相交线出现乎
              minH := curminH;
              ij := j;    //ii  j    in   high
              ik := k;   //iii   k  out  lower
              jjj := 1;
            end;
          end;  //for j
          /////////////////////////////////////////
          if jjj = 1 then
          begin
            pline := TlinePoint.Create(nil);
            pline.beginPcode := ((storeyLineList[i])[ij]);
            pline.endPcode := ((storeyLineList[i + 1])[ik]);
            pline.beginPoint := fromPcodeGetPoint((storeyLineList[i])[ij]);
            pline.endPoint := fromPcodeGetPoint((storeyLineList[i + 1])[ik]);
            pline.floor := i;
            linelist.Add(pline);

            pline := TlinePoint.Create(nil);
            pline.beginPcode := ((storeyLineList[i])
              [(ij + 1) mod storeyLineList[i].Count]);
            pline.endPcode := ((storeyLineList[i + 1])[ik]);
            pline.beginPoint := fromPcodeGetPoint((storeyLineList[i])
              [(ij + 1) mod storeyLineList[i].Count]);
            pline.endPoint := fromPcodeGetPoint((storeyLineList[i + 1])[ik]);
            pline.floor := i;
            linelist.Add(pline);
            // 三角形中两边替换一边，一种类似最短路径算法中的弗洛伊德算法中的松弛操作relax operation
            //memo_seaLine.Lines.Add(((storeyLineList[i])[ij]) +
            //  ((storeyLineList[i + 1])[ik]) + '和' + ((storeyLineList[i])
            //  [(ij + 1) mod storeyLineList[i].Count]) + ((storeyLineList[i + 1])
            //  [ik]) + '替换' + ((storeyLineList[i])[ij]) + ((storeyLineList[i])
            //  [(ij + 1) mod storeyLineList[i].Count]));

            for jjj := lineList.Count - 1 downto 0 do
            begin
              //三角形中两边替换一边，将另一边先标记，到时统一删除，系统功能限制，不能立即删除乎
              if (TlinePoint(linelist[jjj]).beginPcode + TlinePoint(
                linelist[jjj]).endPcode) = ((storeyLineList[i])
                [ij]) + ((storeyLineList[i])[(ij + 1) mod storeyLineList[i].Count]) then
                TlinePoint(linelist[jjj]).floor := -111;
              if (TlinePoint(linelist[jjj]).endPcode + TlinePoint(
                linelist[jjj]).beginPcode) = ((storeyLineList[i])
                [ij]) + ((storeyLineList[i])[(ij + 1) mod storeyLineList[i].Count]) then
                TlinePoint(linelist[jjj]).floor := -111;
            end;
            for jjj := pointList.Count - 1 downto 0 do
              //将原先内层高层的点，先标记，到时全删除乎
              if TPointLine(pointList[jjj]).pcode = ((storeyLineList[i + 1])[ik]) then
                TPointLine(pointList[jjj]).floor := -111;

            //tstringlist(storeyLineList[i])[ij+1].Delete;
            //tstringlist(storeyLineList[i])[ij].Delete;
            TStringList(storeyLineList[i]).insert(ij + 1,
              TStringList(storeyLineList[i + 1])[ik]);
            //三角形中两边替换一边，实际相当于在原来的两点路径中插入一个新点
          end;
          //if jjj = 2 then
          begin
          end;
        end;  //for k
      end;
    end;



    //////////////////////////////////////////////
    if TButton(Sender).Caption = '海岸线算法(逐层且再逐点)全顺时' then
      //if 1 = 2 then
      for k := 0 to storeyLineList[i + 1].Count - 2 do
        // j  out lower  k要高层内层，j在低层外层
        // for k := storeyLineList[i + 1].Count - 2 downto 0 do
        // k in   high k要高层内层，j在低层外层
        //  k in   high  k要高层内层，j在低层外层
        // if (TlinePoint(linelist[j]).floor = (i)) then
        //   if (TlinePoint(linelist[k]).floor = (i+1)) then
        //if (TlinePoint(linelist[k]).floor <>-111) then
      begin
        for lmn := pointList.Count - 1 downto 0 do
          if TPointLine(pointList[lmn]).pcode = ((storeyLineList[i + 1])[k]) then
            break;
        if TPointLine(pointList[lmn]).floor = -111 then
          continue;
        minH := 10000000;
        ij := -1;
        ik := -1;
        jjj := -1;
        for j := 0 to storeyLineList[i].Count - 2 do
          // j  out lower  k要高层内层，j在低层外层
          //for j :=  storeyLineList[i].Count - 2 downto 0 do           //  k in   high  k要高层内层，j在低层外层
        begin
          curminH := (PPLong(fromPcodeGetPoint((storeyLineList[i + 1])
            [k]), fromPcodeGetPoint((storeyLineList[i])[j])) +
            PPLong(fromPcodeGetPoint((storeyLineList[i + 1])[k]),
            fromPcodeGetPoint((storeyLineList[i])
            [(j + 1) mod storeyLineList[i].Count])) -
            PPLong(fromPcodeGetPoint((storeyLineList[i])[j]),
            fromPcodeGetPoint((storeyLineList[i])
            [(j + 1) mod storeyLineList[i].Count])));
          if curminH <= minH then
            //if curminH < minH then
            //此处加上等号，在三种坐标中，在坐标点是十分规则的矩形分布坐标轴一样整点时，也比原先的解优胜了
          begin   //此处未处理是不是相交线，所以可能时或偶有相交线出现乎
            minH := curminH;
            ij := j;    //ii  j    in   high
            ik := k;   //iii   k  out  lower
            jjj := 1;
          end;
        end;  //for j
        /////////////////////////////////////////
        if jjj = 1 then
        begin
          pline := TlinePoint.Create(nil);
          pline.beginPcode := ((storeyLineList[i])[ij]);
          pline.endPcode := ((storeyLineList[i + 1])[ik]);
          pline.beginPoint := fromPcodeGetPoint((storeyLineList[i])[ij]);
          pline.endPoint := fromPcodeGetPoint((storeyLineList[i + 1])[ik]);
          pline.floor := i;
          linelist.Add(pline);

          pline := TlinePoint.Create(nil);
          pline.beginPcode := ((storeyLineList[i])
            [(ij + 1) mod storeyLineList[i].Count]);
          pline.endPcode := ((storeyLineList[i + 1])[ik]);
          pline.beginPoint := fromPcodeGetPoint((storeyLineList[i])
            [(ij + 1) mod storeyLineList[i].Count]);
          pline.endPoint := fromPcodeGetPoint((storeyLineList[i + 1])[ik]);
          pline.floor := i;
          linelist.Add(pline);
          // 三角形中两边替换一边，一种类似最短路径算法中的弗洛伊德算法中的松弛操作relax operation
          //memo_seaLine.Lines.Add(((storeyLineList[i])[ij]) +
          //  ((storeyLineList[i + 1])[ik]) + '和' + ((storeyLineList[i])
          //  [(ij + 1) mod storeyLineList[i].Count]) + ((storeyLineList[i + 1])
          //  [ik]) + '替换' + ((storeyLineList[i])[ij]) + ((storeyLineList[i])
          //  [(ij + 1) mod storeyLineList[i].Count]));

          for jjj := lineList.Count - 1 downto 0 do
          begin
            //三角形中两边替换一边，将另一边先标记，到时统一删除，系统功能限制，不能立即删除乎
            if (TlinePoint(linelist[jjj]).beginPcode + TlinePoint(
              linelist[jjj]).endPcode) = ((storeyLineList[i])
              [ij]) + ((storeyLineList[i])[(ij + 1) mod storeyLineList[i].Count]) then
              TlinePoint(linelist[jjj]).floor := -111;
            if (TlinePoint(linelist[jjj]).endPcode + TlinePoint(
              linelist[jjj]).beginPcode) = ((storeyLineList[i])
              [ij]) + ((storeyLineList[i])[(ij + 1) mod storeyLineList[i].Count]) then
              TlinePoint(linelist[jjj]).floor := -111;
          end;
          for jjj := pointList.Count - 1 downto 0 do
            //将原先内层高层的点，先标记，到时全删除乎
            if TPointLine(pointList[jjj]).pcode = ((storeyLineList[i + 1])[ik]) then
              TPointLine(pointList[jjj]).floor := -111;

          //tstringlist(storeyLineList[i])[ij+1].Delete;
          //tstringlist(storeyLineList[i])[ij].Delete;
          TStringList(storeyLineList[i]).insert(ij + 1,
            TStringList(storeyLineList[i + 1])[ik]);
          //三角形中两边替换一边，实际相当于在原来的两点路径中插入一个新点
        end;
        //if jjj = 2 then
        begin
        end;
      end;  //for k




    if TButton(Sender).Caption = '海岸线算法(逐层且再逐点)全逆时' then
      //if 1 = 2 then
      //for k := 0 to storeyLineList[i + 1].Count - 2 do       // j  out lower  k要高层内层，j在低层外层
      for k := storeyLineList[i + 1].Count - 2 downto 0 do
        // k in   high k要高层内层，j在低层外层
        //  k in   high  k要高层内层，j在低层外层
        // if (TlinePoint(linelist[j]).floor = (i)) then
        //   if (TlinePoint(linelist[k]).floor = (i+1)) then
        //if (TlinePoint(linelist[k]).floor <>-111) then
      begin
        for lmn := pointList.Count - 1 downto 0 do
          if TPointLine(pointList[lmn]).pcode = ((storeyLineList[i + 1])[k]) then
            break;
        if TPointLine(pointList[lmn]).floor = -111 then
          continue;
        minH := 10000000;
        ij := -1;
        ik := -1;
        jjj := -1;
        for j := 0 to storeyLineList[i].Count - 2 do
          // j  out lower  k要高层内层，j在低层外层
          //for j :=  storeyLineList[i].Count - 2 downto 0 do           //  k in   high  k要高层内层，j在低层外层
        begin
          curminH := (PPLong(fromPcodeGetPoint((storeyLineList[i + 1])
            [k]), fromPcodeGetPoint((storeyLineList[i])[j])) +
            PPLong(fromPcodeGetPoint((storeyLineList[i + 1])[k]),
            fromPcodeGetPoint((storeyLineList[i])
            [(j + 1) mod storeyLineList[i].Count])) -
            PPLong(fromPcodeGetPoint((storeyLineList[i])[j]),
            fromPcodeGetPoint((storeyLineList[i])
            [(j + 1) mod storeyLineList[i].Count])));
          if curminH <= minH then
            //if curminH < minH then
            //此处加上等号，在三种坐标中，在坐标点是十分规则的矩形分布坐标轴一样整点时，也比原先的解优胜了
          begin   //此处未处理是不是相交线，所以可能时或偶有相交线出现乎
            minH := curminH;
            ij := j;    //ii  j    in   high
            ik := k;   //iii   k  out  lower
            jjj := 1;
          end;
        end;  //for j
        /////////////////////////////////////////
        if jjj = 1 then
        begin
          pline := TlinePoint.Create(nil);
          pline.beginPcode := ((storeyLineList[i])[ij]);
          pline.endPcode := ((storeyLineList[i + 1])[ik]);
          pline.beginPoint := fromPcodeGetPoint((storeyLineList[i])[ij]);
          pline.endPoint := fromPcodeGetPoint((storeyLineList[i + 1])[ik]);
          pline.floor := i;
          linelist.Add(pline);

          pline := TlinePoint.Create(nil);
          pline.beginPcode := ((storeyLineList[i])
            [(ij + 1) mod storeyLineList[i].Count]);
          pline.endPcode := ((storeyLineList[i + 1])[ik]);
          pline.beginPoint := fromPcodeGetPoint((storeyLineList[i])
            [(ij + 1) mod storeyLineList[i].Count]);
          pline.endPoint := fromPcodeGetPoint((storeyLineList[i + 1])[ik]);
          pline.floor := i;
          linelist.Add(pline);
          // 三角形中两边替换一边，一种类似最短路径算法中的弗洛伊德算法中的松弛操作relax operation
          //memo_seaLine.Lines.Add(((storeyLineList[i])[ij]) +
          //  ((storeyLineList[i + 1])[ik]) + '和' + ((storeyLineList[i])
          //  [(ij + 1) mod storeyLineList[i].Count]) + ((storeyLineList[i + 1])
          //  [ik]) + '替换' + ((storeyLineList[i])[ij]) + ((storeyLineList[i])
          //  [(ij + 1) mod storeyLineList[i].Count]));

          for jjj := lineList.Count - 1 downto 0 do
          begin
            //三角形中两边替换一边，将另一边先标记，到时统一删除，系统功能限制，不能立即删除乎
            if (TlinePoint(linelist[jjj]).beginPcode + TlinePoint(
              linelist[jjj]).endPcode) = ((storeyLineList[i])
              [ij]) + ((storeyLineList[i])[(ij + 1) mod storeyLineList[i].Count]) then
              TlinePoint(linelist[jjj]).floor := -111;
            if (TlinePoint(linelist[jjj]).endPcode + TlinePoint(
              linelist[jjj]).beginPcode) = ((storeyLineList[i])
              [ij]) + ((storeyLineList[i])[(ij + 1) mod storeyLineList[i].Count]) then
              TlinePoint(linelist[jjj]).floor := -111;
          end;
          for jjj := pointList.Count - 1 downto 0 do
            //将原先内层高层的点，先标记，到时全删除乎
            if TPointLine(pointList[jjj]).pcode = ((storeyLineList[i + 1])[ik]) then
              TPointLine(pointList[jjj]).floor := -111;

          //tstringlist(storeyLineList[i])[ij+1].Delete;
          //tstringlist(storeyLineList[i])[ij].Delete;
          TStringList(storeyLineList[i]).insert(ij + 1,
            TStringList(storeyLineList[i + 1])[ik]);
          //三角形中两边替换一边，实际相当于在原来的两点路径中插入一个新点
        end;
        //if jjj = 2 then
        begin
        end;
      end;  //for k
    ///////////////////////////////////////////
    // for j := 0 to storeyLineList[i+1].Count - 1 do
    for j := lineList.Count - 1 downto 0 do
      if TlinePoint(linelist[j]).floor = i + 1 then
        //将原先内层高层的边，先标记，到时全删除乎
        TlinePoint(linelist[j]).floor := -111;
    TStringList(storeyLineList[i + 1]).Clear;
    for j := 0 to TStringList(storeyLineList[i]).Count - 1 do
      TStringList(storeyLineList[i + 1]).add(TStringList(storeyLineList[i])[j]);
    TStringList(storeyLineList[i]).Clear;
  end;   //i
  //新线立即加上，原线标记下次删除之，下面的就是互换的代码，替代不能直接删除而已
  tempLineList := TFPList.Create;
  // for i := lineList.Count - 1 downto 0 do
  //for j := i-1 downto 0 do
  //if TlinePoint(linelist[i]).floor <> -111 then
  //if TlinePoint(linelist[j]).floor <> -111 then
  //if   TlinePoint(linelist[i]).beginPcode+TlinePoint(linelist[i]).endPcode=
  //TlinePoint(linelist[j]).beginPcode+TlinePoint(linelist[j]).endPcode  then
  //     TlinePoint(linelist[i]).floor:=-111;
  //    memo_seaLine.Lines.Add(    TlinePoint(linelist[i]).beginPcode+TlinePoint(linelist[i]).endPcode);
  //P91P91:0   P1P1:0  P10P10:0    P100P100:0  如此造成统计点数出错的

  for i := lineList.Count - 1 downto 0 do
    if TlinePoint(linelist[i]).floor <> -111 then
      if TlinePoint(linelist[i]).beginPcode = TlinePoint(linelist[i]).endPcode then
        TlinePoint(linelist[i]).floor := -111;
  //P91P91:0   P1P1:0  P10P10:0    P100P100:0  如此造成统计点数出错的
  for i := lineList.Count - 1 downto 0 do
  begin
    try
      if TlinePoint(linelist[i]).floor <> -111 then
      begin
        pline := TlinePoint.Create(nil);
        pline.beginPcode := TlinePoint(linelist[i]).beginPcode;
        pline.endPcode := TlinePoint(linelist[i]).endPcode;
        pline.beginPoint := TlinePoint(linelist[i]).beginPoint;
        pline.endPoint := TlinePoint(linelist[i]).endPoint;
        pline.floor := TlinePoint(linelist[i]).floor;
        tempLineList.Add(pline);
      end;
    except
    end;
    application.ProcessMessages;
  end;
  for i := lineList.Count - 1 downto 0 do
  begin
    try
      // if TlinePoint(linelist[i]).floor<>-111 then
      if lineList.Items[i] <> nil then
      begin
        TlinePoint(lineList.Items[i]).Free;
        lineList.Items[i] := nil;
        lineList.Count := lineList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  lineList.Clear;
  for i := tempLineList.Count - 1 downto 0 do
  begin
    try
      // if TlinePoint(tempLineList[i]).floor<>-111 then
      begin
        pline := TlinePoint.Create(nil);
        pline.beginPcode := TlinePoint(tempLineList[i]).beginPcode;
        pline.endPcode := TlinePoint(tempLineList[i]).endPcode;
        pline.beginPoint := TlinePoint(tempLineList[i]).beginPoint;
        pline.endPoint := TlinePoint(tempLineList[i]).endPoint;
        pline.floor := TlinePoint(tempLineList[i]).floor;
        LineList.Add(pline);
      end;
    except
    end;
    application.ProcessMessages;
  end;
  for i := tempLineList.Count - 1 downto 0 do
  begin
    try
      // if TlinePoint(linelist[i]).floor<>-111 then
      if tempLineList.Items[i] <> nil then
      begin
        TlinePoint(tempLineList.Items[i]).Free;
        tempLineList.Items[i] := nil;
        tempLineList.Count := lineList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  tempLineList.Clear;
  tempLineList.Free;
  for i := pointList.Count - 1 downto 0 do
    TPointLine(pointList[i]).floor := -1;
  onelong := 0.0;
  alllong := 0.0;
  memo_seaLine.Lines.Add('总路径：总点数：' + IntToStr(lineList.Count));
  //P91P91:0   P1P1:0  P10P10:0    P100P100:0  如此造成统计点数出错的
  for i := lineList.Count - 1 downto 0 do
  begin
    try
      onelong := pplong(TlinePoint(linelist[i]).beginPoint, TlinePoint(
        linelist[i]).endPoint);
      memo_seaLine.Lines.Add(TlinePoint(linelist[i]).beginPcode +
        TlinePoint(linelist[i]).endPcode + ':' + floattostr(onelong));
      alllong := alllong + onelong;
      TPointLine(pointList[getpcodeindex(TlinePoint(linelist[i]).beginPcode)]).floor
      := 1;
      TPointLine(pointList[getpcodeindex(TlinePoint(linelist[i]).endPcode)]).floor := 1;
    except
    end;
    application.ProcessMessages;
  end;

  memo_seaLine.Lines.Add('总路长：' + floattostr(alllong));
  ss := '';
  for i := pointList.Count - 1 downto 0 do
    if TPointLine(pointList[i]).floor = -1 then
      ss := ss + TPointLine(pointList[i]).pcode + ',';
  if ss <> '' then
    ShowMessage(ss + '这些点没有被处理');
  //同心圆的中心点暂未处理，因为结果不理想，无兴趣理会

  //sleepli(2);
  //refreshFromLineList(nil);
  refrash.Click;
  //refreshClick(sender);
end;
{ TPsubpPoint }

constructor TPsubpPoint.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  subPcode := TStringList.Create;
end;

destructor TPsubpPoint.Destroy;
var
  i: integer;
begin
  subPcode.Free;
  subPcode := nil;
  inherited Destroy;

end;

end.
