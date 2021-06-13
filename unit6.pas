unit Unit6;

{$mode delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons;

type

  { TForm5 }

  TForm5 = class(TForm)
    BitBtn1: TBitBtn;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form5: TForm5;

implementation
uses unit1;

{$R *.lfm}

{ TForm5 }

procedure TForm5.Label1Click(Sender: TObject);
begin

end;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
  form5.close
end;

procedure TForm5.FormActivate(Sender: TObject);
begin
  Form5.BorderStyle := bsSingle
end;

end.

