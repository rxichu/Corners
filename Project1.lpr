program Project1;

{$mode objfpc}{$H+}

uses
  Forms, Interfaces,
  Unit1 in 'Unit1.pas' {Form1},
  Unit3 in 'Unit3.pas' {Form3},
  Unit6 in 'Unit6.pas' {Form5};



{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
