unit Digit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    K: TComboBox;
    Label3: TLabel;
    Default: TCheckBox;
    Go: TButton;
    YourPurpose: TLabeledEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Label4: TLabel;
    Protokol: TMemo;
    Quit: TButton;
    procedure FormActivate(Sender: TObject);
    procedure DefaultClick(Sender: TObject);
    procedure QuitClick(Sender: TObject);
    procedure KChange(Sender: TObject);
    procedure GoClick(Sender: TObject);
    procedure YourPurposeKeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
 const ussr='Твой ход            Мой ход';
{$R *.dfm}
Var kdig:byte;
F:textfile;
c:char;
a:array of boolean;
MyNum:integer;
Last:boolean;
BegValue:integer;
NumHid:integer=0;

Function power10(const i:byte):integer;
 Var j:integer;
  Begin
   Result:=1;
   For j:=1 to i do Result:=Result*10;
  End;

Function Podhodit(const n:longint):boolean;
Var i,j:byte;s:string;
Begin
 str(n,s);
 Result:=true;
 For i:=1 to length(s)-1 do
   For j:=i+1 to length(s) do
    If s[i]=s[j] then
      Begin result:=false;exit;end;
End;

Procedure poriv(a,b:integer;Var c,d:byte);
Var i,j:byte;s1,s2:string;
Begin
c:=0;d:=0;
str(a,s1);str(b,s2);
For i:=1 to length(s1) do
   For j:=1 to length(s2) do
      If s1[i]=s2[j] then
        Begin
          If i=j then inc(d);
          inc(c);
        End;
End;

Procedure newgame;
Begin;
form1.FormActivate(form1.edit1);
form1.Panel1.Enabled:=true;
form1.panel2.Enabled:=false;
form1.K.SetFocus;
form1.Edit1.Text:='';
form1.Edit2.Text:='';
form1.YourPurpose.Text:='';
numhid:=0;
end;


Procedure obrobka;
Var s:string;i:integer;c,d:byte;
Begin
With form1 do
Begin
  If (Edit1.text[1]<edit2.text[1])or (strtoint(edit1.Text)>kdig)or(strtoint(edit2.Text)>kdig)
     then
       Begin
        Edit1.text:='';edit2.Text:='';edit1.SetFocus;exit;
       End
     Else
       For i:=0 to High(a) do
        If a[i]=true then
        Begin
          poriv(BegValue,i+power10(kdig-1),c,d);
          If (c<>strtoint(edit1.text))or (d<>strtoint(edit2.text)) then a[i]:=false;
        End;
s:=protokol.Lines[numhid];
protokol.Lines.Delete(numhid);
s:=s+'  '+edit1.Text+' '+edit2.text;
protokol.Lines.Add(s);
If (edit1.Text=inttostr(kdig))and(edit1.Text=edit2.Text)then
     If Last Then
              If application.MessageBox(pchar('Наша партия закончилась вничью за '+inttostr(numhid)+' ходов, хотите сыграть заново?'),'Конец игры',MB_YESNOCANCEL+MB_ICONQUESTION)<>idyes
                then close else
                Begin
                newgame;
                exit
                end
              else If application.MessageBox(pchar('К сожалению вы проиграли за '+inttostr(numhid)+' ходов, хотите сыграть заново?'),'Конец игры',MB_YESNOCANCEL+MB_ICONQUESTION)<>idyes
                   then close  else
                   Begin
                    newgame;
                    exit;
                   end;
If last and(edit2.Text<>inttostr(kdig))then
If application.MessageBox(pchar('Поздравляю, вы выиграли за '+inttostr(numhid)+' ходов, хотите сыграть заново?'),'Конец игры',MB_YESNOCANCEL+MB_ICONQUESTION)<>idyes
then close else
Begin
newgame;
exit;
end;
edit1.ReadOnly:=true;
edit2.ReadOnly:=true;
yourpurpose.ReadOnly:=false;
yourpurpose.SetFocus;
yourpurpose.Text:='';
end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
Last := false;
   If fileexists ( 'opt.opt' ) then
         Begin
                AssignFile ( f , 'opt.opt' );
                Reset ( f );
                Read (f , c);
                If c in ['4'..'9'] then k.Text:=c
                else k.Text:='3';
                CloseFile(f);
         End else k.Text:='3';
Kdig:=strtoint(k.Text);
end;

procedure TForm1.DefaultClick(Sender: TObject);
begin
        If default.Checked then
         Begin
           AssignFile(f,'opt.opt');
           Rewrite(f);
           write(f,k.Text);
           CloseFile(f);
         End;
end;

procedure TForm1.QuitClick(Sender: TObject);
begin
close
end;

procedure TForm1.KChange(Sender: TObject);
begin
If (k.Text<>'')and(k.Text[1] in ['3'..'9']) then
Kdig:=strtoint(k.Text)
end;

procedure TForm1.GoClick(Sender: TObject);
Var i:integer;
begin
If not (k.Text='')or(k.Text[1] in['3'..'9']) then k.Text:=inttostr(kdig);
BegValue:=power10(kdig-1)-1;
SetLength(a,9*power10(Kdig-1));
For i:=0 to high(a) do
//If (i mod 10000)=0 then Application.ProcessMessages;
If podhodit (i+power10(kdig-1)) then a[i]:=true else a[i]:=false;
Randomize;
 Repeat
   MyNum:=Trunc(random(9*power10(kdig-1))+power10(kdig-1));
 Until podhodit(Mynum);
 panel1.Enabled:=false;
 Panel2.Enabled:=true;
 protokol.Clear;
 protokol.lines.add(ussr);
 Yourpurpose.SetFocus;
 Yourpurpose.ReadOnly:=false;
 yourpurpose.MaxLength:=kdig;
 edit1.readonly:=true;
 edit2.readonly:=true;
end;

procedure TForm1.YourPurposeKeyPress(Sender: TObject; var Key: Char);
Var c,d,j:byte; s:string;
begin
  If (key='0') and (length(yourpurpose.Text)=0) then key:=#0;
  If not (key in ['0'..'9',#13,#8]) then key:=#0;
  If (yourpurpose.text<>'')and(not(key in [#13,#8]))and(not podhodit(strtoint(yourpurpose.Text+key))) then key:=#0;
  If (key=#13)and(length(yourpurpose.Text)=kdig) then
     Begin
      inc(numhid);
      poriv(mynum,strtoint(yourpurpose.Text),c,d);
      If (c=kdig) and (D=kdig) then last:=true;
      Repeat
       inc(BegValue);
      Until (a[BegValue-power10(kdig-1)]=true)or (begvalue>power10(kdig)-1);
      If begvalue>power10(kdig)-1 then
       If application.MessageBox('Вы проиграли из-за ошибки, хотите начать заново?','Аварийный конец игры',MB_YESNOCANCEL+MB_ICONWARNING)<>idyes then close else
        Begin
         newgame;
         exit;
        end;
 s:=inttostr(numhid)+'. '+yourpurpose.text;
 For j:= length(s)+1 to 14 do s:=s+' ';
 s:=s+inttostr(c)+':'+inttostr(d)+'   '+#5+inttostr(begvalue);
 For j:=length(s)+1 to 29 do s:=s+' ';
 Protokol.Lines.Add(s);
 Yourpurpose.readonly:=true;
 edit1.readonly:=false;
 edit2.readonly:=false;
 edit1.SetFocus;
end;

end;


procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
If not( key in['0'..'9',#13,#8]) then Key :=#0;
If key=#13 then If edit1.Text='' then edit1.setfocus
 else obrobka;

end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
If not( key in['0'..'9',#13,#8]) then Key :=#0;
If key=#13 then edit2.setfocus;
end;

end.
