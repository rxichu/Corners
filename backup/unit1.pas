unit Unit1;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, Buttons, MMSystem, Inifiles;

type


  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    MenuItem1: TMenuItem;
    settings: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Image1: TImage;
    Image2: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Lstate: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckAutoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StrategNapad1;
    procedure StrategNapad2;
    procedure StrategZashit1;
    procedure StrategZashit2;
    procedure settingsClick(Sender: TObject);
    procedure PoleClik(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
     procedure Draw;
     procedure run;
    { Private declarations }
  public
    { Public declarations }
  end;


const wes6:array [0..5,0..5] of Integer =
     (
       (01, 00, 03,  00, 15, 00),
       (00, 02, 00,  08, 00, 16),
       (03, 00, 03,  00, 10, 00),

       (00, 08, 00,  14, 00, 16),
       (15, 00, 10,  00, 15, 00),
       (00, 16, 00,  16, 00, 16)
     );


const wes8:array [0..7,0..7] of Integer =
     (
       (01, 00, 03, 00,  15, 00, 17, 00),
       (00, 02, 00, 04,  00, 16, 00, 18),
       (03, 00, 03, 00,  15, 00, 17, 00),
       (00, 04, 00, 04,  00, 06, 00, 18),

       (15, 00, 15, 00,  15, 00, 17, 00),
       (00, 16, 00, 16,  00, 16, 00, 18),
       (17, 00, 17, 00,  17, 00, 17, 00),
       (00, 18, 00, 18,  00, 18, 00, 18)
     );
     MAXLEVEL =4;
type int=ShortInt;
     DoskArr=array[0..7,0..7] of Int;

     stepinf =record
       fi,fj,ti,tj:int;
     end;


  tStrategMode = (Defense,Attack,User); // не работает


var
  Form1: TForm1;
  B: array of array of TPanel;
  Doska, tmpa:DoskArr; // текущая и временная доски
  mode: array[1..2] of  tStrategMode;    // две стратегии у каждого из игроков
  curgamer:int;     // текущий игрок
  UserModeStep:Integer; // шаг выбора хода пользователя
  UserStep :stepinf;
  activegame : Boolean = False;

implementation
uses Unit3, unit6;
{$R *.lfm}

function OtherGamer:int;
begin
  if curgamer=1 then result:=2 else result:=1;

end;


procedure TForm1.N4Click(Sender: TObject);
var a,b:integer;
  IniFile:TIniFile;
begin
  Form3.ShowModal;
 with Form3 do
 begin
   b:= IniFile.Readinteger('Bool', 'CheckBox1', 0);
  if b=1 then mode[1]:=Attack else mode[1]:=User;

end;

end;

procedure TForm1.CheckAutoChange(Sender: TObject);
begin

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Form1.BorderStyle := bsSingle
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;



procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  form5.showmodal
end;

procedure TForm1.N1Click(Sender: TObject);
begin

end;



procedure TForm1.N3Click(Sender: TObject);
var i,j,b:integer;
  IniFile:TIniFile;
begin
  b:= IniFile.Readinteger('Bool', 'CheckBox1', 0);
  if b=1 then mode[1]:=Attack else mode[1]:=User;
  for i:=0 to Length(b)-1 do
    for j:=0 to Length(b)-1 do
     if Assigned(b[i,j]) then b[i,j].Free;

  SetLength(B, razm,razm);
  for i:=0 to (razm-1) do
    for j:=0 to (razm-1) do
    begin
      B[i,j]:=TPanel.Create(Form1);
      B[i,j].Parent:=Form1;
      B[i,j].Width:=50;
      B[i,j].OnClick := PoleClik;
      B[i,j].Tag := i;
      B[i,j].HelpKeyword := IntToStr(j);
      B[i,j].Height:=50;
      B[i,j].Left:=50*(j+1);
      B[i,j].Top:=50*(i+1);
      Doska[i,j] := 0;   // внутренняя матрица
      if (i<(razm/2)) and (j<(razm/2))and (((i mod 2 =0) and (j mod 2 =0)) or ((i mod 2 =1) and (j mod 2 =1))) then
         begin
          B[i,j].Color:=clTeal;
          Doska[i,j] := 1;
         end;
      if (i>(razm/2-1)) and (j>(razm/2)-1)and (((i mod 2 =0) and (j mod 2 =0)) or ((i mod 2 =1) and (j mod 2 =1))) then
          begin
          B[i,j].Color:=clPurple;
          Doska[i,j] := 2;
          end;
    end;

curgamer := 2;
activegame := True;

 mode[curgamer]:= User;
 mode[1]:=User;
 begin

 end;

end;


procedure TForm1.Button2Click(Sender: TObject);
var
  IniFile:TIniFile;
begin
 with form3 do
  IniFile:= TIniFile.Create('settings.ini');
  Form3.Checkbox2.checked:= IniFile.ReadBool('Bool', 'CheckBox2', true);
 Form3.ShowModal;
 inifile.free;
end;

procedure TForm1.N5Click(Sender: TObject);
var
  IniFile:TIniFile;
begin
 with form3 do
  IniFile:= TIniFile.Create('settings.ini');
  Form3.Checkbox2.checked:= IniFile.ReadBool('Bool', 'CheckBox2', true);
 Form3.ShowModal;
 inifile.free;
end;

procedure TForm1.Button3Click(Sender: TObject);
var i,j:integer;
begin
  for i:=0 to Length(b)-1 do
    for j:=0 to Length(b)-1 do
     if Assigned(b[i,j]) then b[i,j].Free;

  SetLength(B, razm,razm);
  for i:=0 to (razm-1) do
    for j:=0 to (razm-1) do
    begin
      button3.visible:=false;
      button2.visible:=false;
      button4.visible:=false;
      settings.visible:=false;
      image1.visible:=false;
      B[i,j]:=TPanel.Create(Form1);
      B[i,j].Parent:=Form1;
      B[i,j].Width:=50;
      B[i,j].OnClick := PoleClik;
      B[i,j].Tag := i;
      B[i,j].HelpKeyword := IntToStr(j);
      B[i,j].Height:=50;
      B[i,j].Left:=50*(j+1);
      B[i,j].Top:=50*(i+1);
      Doska[i,j] := 0;   // внутренняя матрица
      if (i<(razm/2)) and (j<(razm/2))and (((i mod 2 =0) and (j mod 2 =0)) or ((i mod 2 =1) and (j mod 2 =1))) then
         begin
          B[i,j].Color:=clTeal;
          Doska[i,j] := 1;
         end;
      if (i>(razm/2-1)) and (j>(razm/2)-1)and (((i mod 2 =0) and (j mod 2 =0)) or ((i mod 2 =1) and (j mod 2 =1))) then
          begin
          B[i,j].Color:=clPurple;
          Doska[i,j] := 2;
          end;
    end;

curgamer := 2;
activegame := True;

 mode[curgamer]:= User;
 mode[1]:=User;
 begin

 end;    

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Close;
end;



procedure TForm1.FormCreate(Sender: TObject);
//var
//IniFile:TIniFile;
//programIsRunning : boolean;
begin
     //form3.

//IniFile:= TIniFile.Create('settings.ini');
//IniFile.ReadInteger('Radio', 'razm', 0);
//Form3.CheckBox2.checked:= IniFile.ReadBool('Bool', 'CheckBox2', true);
razm:=8;
curgamer := 1;
end;
//inifile.free;
//end;


function CalcWes(arr:DoskArr; main:int):Integer;
var i,j,w,dr:integer;
     fin:Boolean;
 function wesij(i,j,p:int):Integer;
 begin
   if p=2 then
   begin
     if Razm=6 then Result:=wes6[i,j]
      else Result:=wes8[i,j];
   end else
   begin
     if Razm=6 then Result:=wes6[5-i,5-j]
      else Result:=wes8[7-i,7-j];
   end;
 end;
begin
  Result:=0;
  for i:=0 to Razm-1 do
  for j:=0 to Razm-1 do
  begin
    if arr[i,j]<>main then Continue;
    w:=wesij(i,j,main);
    Inc(Result,w);
  end;
end;


function NewXY(var i,j:int;
                len:int;
                l,t:Boolean
                ):Boolean;
begin
  if l then Dec(j,len) else Inc(j,len);
  if t then Dec(i,len) else Inc(i,len);

  Result:=False;
  if (i<0) or (j<0) then Exit;
  if (i>Razm-1) or (j>Razm-1) then Exit;
  Result:=true;

end;


function ValidStep(arr:DoskArr;
                i,j,
                ti,tj:int):
                Boolean;
var x,y, mainnapr, back:int;
 function Centr:Integer;

 begin
   Result:= arr[ (i+ti)div 2, (j+tj) div 2];
 end;
begin
 Result:=False;
 if (arr[i,j]=1) then mainnapr:=1 else mainnapr:=2;
 if (arr[i,j]=1) then back:=2 else back:=1;

 if (i=ti) or (j=tj) then Exit;

 Result:=true;
   x:=i;y:=j;
   if NewXY(x,y, 1, True,true) then       // влево вверх 1
     if (arr[ti,tj]=0) and (mainnapr=2) and (x=ti) and (y=tj) then Exit;

   x:=i;y:=j;
   if NewXY(x,y, 1, False,true) then       // вправо ввех 1
     if (arr[ti,tj]=0) and(x=ti) and (y=tj) then Exit;


   x:=i;y:=j;
   if NewXY(x,y, 1, True,false) then       // влево вниз  1
     if (arr[ti,tj]=0) and (x=ti) and (y=tj) then Exit;

   x:=i;y:=j;
   if NewXY(x,y, 1, false,false) then       // впарво вниз  1
     if (arr[ti,tj]=0) and (mainnapr=1) and (x=ti) and (y=tj) then Exit;

 //////////
   x:=i;y:=j;
   if NewXY(x,y, 2, True,true) then       // влево вверх 2
     if mainnapr=2 then
     if (arr[ti,tj]=0) and (Centr<>0) and (x=ti) and (y=tj) then Exit
     else
     if (arr[ti,tj]=0) and (Centr=back) and (x=ti) and (y=tj) then Exit;

   x:=i;y:=j;
   if NewXY(x,y, 2, False,true) then       // вправо ввех 2
     if (arr[ti,tj]=0) and (Centr<>0) and(x=ti) and (y=tj) then Exit;


   x:=i;y:=j;
   if NewXY(x,y, 2, True,false) then       // влево вниз  1
     if (arr[ti,tj]=0)and (Centr<>0) and (x=ti) and (y=tj) then Exit;

   x:=i;y:=j;
   if NewXY(x,y, 2, false,false) then       // впарво вниз  2
     if mainnapr=1 then
     if (arr[ti,tj]=0) and (Centr<>0) and (x=ti) and (y=tj) then Exit
     else
     if (arr[ti,tj]=0) and (Centr=back) and (x=ti) and (y=tj) then Exit ;

  Result:=False;

end;


procedure copyarr(from:DoskArr;var toc:DoskArr); {копирование массивов}
var i,j:int;
begin
 for i:=0 to 7 do
   for j:=0 to 7 do
     toc[i,j]:=from[i,j];
end;


function Final(arr:DoskArr;main:int):boolean ;
var i,j:integer;
begin
  Result:=false;
 for i:=0 to razm-1 do
   for j:=0 to razm-1 do
   begin
     if arr[i,j]<>main then Continue;
     if main=1 then
     begin
        if (i< Razm div 2)or(j< Razm div 2) then Exit
     end
     else
        if (i> (Razm div 2)-1)or(j> (Razm div 2)-1) then Exit
   end;


  Result:=true;

end;

{поиск оптимального хода путем полного перебора}
function  find(arr:DoskArr;
                    main,
                    level,maxlevel:int;
                    napad:Boolean;
                    var stinf: stepinf
                    ):integer;
var tmpa:DoskArr;
 i,j,i1,j1,back:int;
 min,tmp, cur,tt:Integer;
 stinfo: stepinf;
// mp:int=2;

  procedure Updmin;
  begin
       if (tmp<=min) then  // если лучше
       begin
           min:=tmp;       //           , то сохранить этот ход
           stinf.fi := i;  // сохранить откуда он сделан
           stinf.fj := j;
           stinf.ti := i1;  // и куда
           stinf.tj := j1;
       end;

  end;
begin
  if main=1 then back :=2 else back:=1;
  cur :=CalcWes(arr,main);   // вес текущего состояний
  if cur =0 then
  begin
    Result:=0;
    Exit;
  end;
   if (level=maxlevel) and not napad THen
   begin
    Result:=cur*level;
    Exit;
   end;
  min := 2147483647;

 for i:=0 to Razm-1 do
 begin
  for j:=0 to Razm-1 do
  begin
   if (arr[i,j]<>main) then continue;
   if (level=1) and(i=StrToInt(Form1.Edit1.Text)) and (j=StrToInt(Form1.Edit2.Text)) then
   begin
     tt:=tt+1;
   end;

   for i1:=0 to Razm-1 do
   begin
     for j1:=0 to Razm-1 do
     begin
       if (arr[i1,j1]<>0) then  continue;
       if not ValidStep(arr,i,j,i1,j1) then Continue;
       copyarr(arr,tmpa);
       tmpa[i1,j1] := tmpa[i,j];
       tmpa[i,j] := 0;
       if napad then
       begin
         tmp:=CalcWes(tmpa,main)*level;


         Updmin;

         if level<maxlevel then
         begin
           // вызов рекурсивно для поиска следующего хода
           tmp := find(tmpa,main,level+1,maxlevel,napad,stinfo);
           //  в новой мотрице. на новом уровне.
           Updmin; //обновить
         end;
       end else  // защита
       begin

         if level<maxlevel then
         begin
           tmp := -find(tmpa,back,level+1,maxlevel,true,stinfo);
           Updmin; // обновить
         end;
       end;
     end
   end
  end
 end;
 find := min; // вернуть что получилось
end;


procedure TForm1.StrategNapad1;
var stinfo: stepinf;
begin
  stinfo.fi :=-1;
  // запуск
  find(doska, // игровая матрица
                1, //номер игрока
                1,
                MAXLEVEL, // всего уровней
                True, // стратегия нападения
                stinfo);
  if Final(Doska,1) then  // а не выиграл ли игрок
  begin
    MessageDlg('Игрок 1 выиграл', mtInformation, [mbOK], 0);
    activegame:=False;
    Exit;
  end;
  if stinfo.fi =-1 then
  begin
    MessageDlg('Нет доступных ходов', mtError, [mbOK], 0);
    Exit;
  end;

  with stinfo do
  begin
    doska[ti,tj ] :=doska[fi,fj ];
    doska[fi,fj ] :=0;
  end;
  Draw;    //выовд на экран
  ////
end;

procedure TForm1.StrategNapad2;
var stinfo: stepinf;
begin
  stinfo.fi :=-1;
  find(doska,2,1,MAXLEVEL,True,stinfo);
  if Final(Doska,2) then
  begin
    MessageDlg('Игрок 2 выиграл', mtInformation, [mbOK], 0);
    activegame:=False;
    Exit;
  end;
  if stinfo.fi =-1 then
  begin
    MessageDlg('Нет доступных ходов', mtError, [mbOK], 0);
    Exit;
  end;

  with stinfo do
  begin
    doska[ti,tj ] :=doska[fi,fj ];
    doska[fi,fj ] :=0;
  end;
  Draw;
  //  стратегия нападения
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
 run;
end;

procedure TForm1.StrategZashit1;  // защита для первого
var stinfo: stepinf;
begin
  stinfo.fi :=-1;
  find(doska,1,1,MAXLEVEL,false,stinfo);
  if Final(Doska,1) then
  begin
    MessageDlg('Игрок 1 выиграл', mtInformation, [mbOK], 0);
    activegame:=False;
    Exit;
  end;
  if stinfo.fi =-1 then
  begin
    MessageDlg('Нет доступных ходов', mtError, [mbOK], 0);
    activegame:=False;
    Exit;
  end;

  with stinfo do
  begin
    doska[ti,tj ] :=doska[fi,fj ];
    doska[fi,fj ] :=0;
  end;
  Draw;
  ////
end;

procedure TForm1.StrategZashit2;

var stinfo: stepinf;
begin
  stinfo.fi :=-1;
  find(doska,2,1,MAXLEVEL,false,stinfo);
  if Final(Doska,2) then
  begin
    MessageDlg('Игрок 1 выиграл', mtInformation, [mbOK], 0);
    Exit;
  end;
  if stinfo.fi =-1 then
  begin
    MessageDlg('Нет доступных ходов', mtError, [mbOK], 0);
    Exit;
  end;

  with stinfo do
  begin
    doska[ti,tj ] :=doska[fi,fj ];
    doska[fi,fj ] :=0;
  end;
  Draw;
end;
procedure TForm1.settingsClick(Sender: TObject);
begin
 Form5.ShowModal;
end;



procedure TForm1.Draw; // из матрицы на экран
var i,j:integer;

begin
  for i:=0 to (razm-1) do
    for j:=0 to (razm-1) do // по всей матрице
    begin
      case Doska[i,j]  of  // установка цветов панелей
       0: B[i,j].Color:= clBtnFace;
       1: B[i,j].Color:= clTeal;
       2: B[i,j].Color:= clPurple;
      end;
    end;

  label2.Caption:=IntToStr(CalcWes(Doska,1));
  label3.Caption:=IntToStr(CalcWes(Doska,2));
    
end;

procedure TForm1.run;
begin
  if not activegame then Exit;
  case mode[curgamer] of // по стратегии текущего игрока
    Attack:begin // нападение
             if curgamer=1 then StrategNapad1 else StrategNapad2;
           end;
    Defense:begin // защита
             if curgamer=1 then StrategZashit1 else StrategZashit2;
           end;
    User : begin // ход игрока
    Button1.Hide;
              UserModeStep:=1; // шаг 1
              Lstate.Caption := 'Ход пользователя. Выберите шашку для хода';
              Lstate.Show;
              Exit; // выход
           end;

  end;
  if curgamer=1 then curgamer:=2 else curgamer:=1;
  if mode[curgamer]=User then run
   else begin
     Button1.Show;

     begin
       Application.ProcessMessages;
       Button1Click(nil);
     end;
  end; 
end;


procedure TForm1.PoleClik(Sender: TObject); // клик на шашке
var
 IniFile:TIniFile;
 i,j:integer;
 b,c,d:integer;
begin
  with form3 do
  IniFile:= TIniFile.Create('settings.ini');
  b:= IniFile.Readinteger('Bool', 'CheckBox2', 0);
  if b=1 then sndPlaysound('hitsound.wav', SND_ASYNC );


   if not activegame then Exit;
  if  mode[curgamer]<>User then Exit;
  i:=TPanel(Sender).Tag;
  j:=StrToInt(TPanel(Sender).HelpKeyword);

  if   Doska[i,j]=curgamer then
  begin
    UserModeStep:=2;
    UserStep.fi:=i;
    UserStep.fj:=j;
    Lstate.Caption := format('Ход из %d:%d в ... выбери место куда ходить',[i,j])
  end;


  if (UserModeStep=2) and  (Doska[i,j]=0) then
  begin
         UserStep.ti:=i;
         UserStep.tj:=j;
         with UserStep do
         if ValidStep(Doska,fi,fj,ti,tj) then // если ход допустим
         begin
            Doska[ti,tj]:=Doska[fi,fj];
            Doska[fi,fj]:=0; // делаем ход
            Draw(); // вывод
            if Final(Doska,curgamer) then // проверка на выигрыш
            begin
              Button1.Visible:=False;
              MessageDlg(format('Игрок %d выиграл!',[curgamer]), mtInformation, [mbOK], 0);
              Lstate.hide;
              activegame:=False;
              Exit;
            end;
            UserModeStep:=0;
            if curgamer=1 then curgamer:=2 else curgamer:=1;
            Lstate.hide;
            if mode[curgamer]=User then run else
            begin
              Button1.Show;
                begin
                  Application.ProcessMessages;
                  Sleep(300);
                  Application.ProcessMessages;
                  Button1Click(nil);
                end;

            end;


         end;
       end;

end;


procedure TForm1.N2Click(Sender: TObject);
 var IniFile:TIniFile;
begin
IniFile:= TIniFile.Create('settings.ini');
IniFile.WriteBool('Bool', 'CheckBox2', Form3.CheckBox2.checked);
IniFile.WriteInteger ('Главные', 'razm', 0);
  Form1.close
end;




end.
