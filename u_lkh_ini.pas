unit U_LKH_ini;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Spin, ComCtrls;

type

  { TfrmLKH_ini }

  TfrmLKH_ini = class(TForm)
    Button11111: TButton;
    Button11112: TButton;
    Button11113: TButton;
    Label11111: TLabel;
    Panel111111: TCoolBar;
ScrollBox1: TScrollBox;
    Panel2: TCoolBar;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    Panel3: TCoolBar;
    Label3: TLabel;
    Label4: TLabel;
    SpinEdit2: TSpinEdit;
    Panel4: TCoolBar;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboBox1: TComboBox;
    Panel5: TCoolBar;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit11: TEdit;
    Panel6: TCoolBar;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Panel7: TCoolBar;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Panel8: TCoolBar;
    EXTRA_CANDIDATE111S: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    SpinEdit3: TSpinEdit;
    SpinEdit5: TSpinEdit;
    Panel9: TCoolBar;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Panel10: TCoolBar;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Panel11: TCoolBar;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Panel12: TCoolBar;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    SpinEdit9: TSpinEdit;
    Panel13: TCoolBar;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    SpinEdit10: TSpinEdit;
    Panel14: TCoolBar;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Panel15: TCoolBar;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Panel16: TCoolBar;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Panel17: TCoolBar;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
        Panel18: TCoolBar;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    SpinEdit15: TSpinEdit;
    Panel19: TCoolBar;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    SpinEdit16: TSpinEdit;
    Panel20: TCoolBar;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    SpinEdit17: TSpinEdit;
    Panel21: TCoolBar;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    SpinEdit18: TSpinEdit;
    Panel22: TCoolBar;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    SpinEdit19: TSpinEdit;
    Panel23: TCoolBar;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    SpinEdit20: TSpinEdit;
    Panel24: TCoolBar;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Panel25: TCoolBar;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    SpinEdit22: TSpinEdit;
    Panel26: TCoolBar;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    SpinEdit23: TSpinEdit;
    Panel27: TCoolBar;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    SpinEdit24: TSpinEdit;
    Panel30: TCoolBar;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Panel31: TCoolBar;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Panel32: TCoolBar;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Panel33: TCoolBar;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Panel34: TCoolBar;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    SpinEdit31: TSpinEdit;
    Panel35: TCoolBar;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Panel36: TCoolBar;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    SpinEdit33: TSpinEdit;
    Panel37: TCoolBar;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Panel38: TCoolBar;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    SpinEdit35: TSpinEdit;
    Panel39: TCoolBar;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Panel40: TCoolBar;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Panel41: TCoolBar;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Panel42: TCoolBar;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Panel43: TCoolBar;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    SpinEdit40: TSpinEdit;
    Panel44: TCoolBar;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    SpinEdit41: TSpinEdit;
    Panel45: TCoolBar;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Panel46: TCoolBar;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    SpinEdit43: TSpinEdit;
    Panel47: TCoolBar;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    SpinEdit44: TSpinEdit;
    Panel48: TCoolBar;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    SpinEdit45: TSpinEdit;
    Panel49: TCoolBar;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Panel50: TCoolBar;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    SpinEdit47: TSpinEdit;
    Panel51: TCoolBar;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    ComboBox11: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
Edit22: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    ComboBox12: TComboBox;
    ComboBox13: TComboBox;
    Label76: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button11112Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Panel13Change(Sender: TObject);
  private

  public

  end;

var
  frmLKH_ini: TfrmLKH_ini;

implementation

{$R *.lfm}

{ TfrmLKH_ini }

procedure TfrmLKH_ini.Button1Click(Sender: TObject);
begin
   close;
end;

procedure TfrmLKH_ini.Button11112Click(Sender: TObject);
begin
   close;
end;

procedure TfrmLKH_ini.Button3Click(Sender: TObject);
begin
  begin
  showmessage('请查看本软件附带的原作者开源代码中的DOC文件夹下的四个PDF文件'+#13#10+'→LKH与concorde算法，或要修改其开源的源码再编译，才可以实现点与边权数值和自定义边长等功能，或它自带这功能却不会用，未完成');
end;
end;

procedure TfrmLKH_ini.Panel13Change(Sender: TObject);
begin

end;

end.

