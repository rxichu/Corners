unit Unit3;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Inifiles;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToggleBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  Razm:integer;
implementation
uses Unit1, Unit6;
{$R *.lfm}

procedure TForm3.Button1Click(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile:= TIniFile.Create('settings.ini');
  IniFile.WriteBool('Bool', 'CheckBox2', Form3.CheckBox2.checked);
  IniFile.WriteBool('Bool', 'CheckBox1', Form3.CheckBox1.checked);
  if RadioButton1 .Checked=True then razm:=6 else razm:=8;
  if checkbox1.checked then mode[1]:=Attack else mode[1]:=User;
  Form3.close;
end;

procedure TForm3.CheckBox2Change(Sender: TObject);
begin

end;

procedure TForm3.FormActivate(Sender: TObject);
begin
  Form3.BorderStyle := bsSingle
end;

procedure TForm3.ToggleBox1Click(Sender: TObject);
begin

end;

end.
