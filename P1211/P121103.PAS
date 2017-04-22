Program P121103; {xep mang 2x3}
Uses  Crt;
{$i P1211\mouse.pas}
Const px: array [1..4] of shortint = (0,1,0,-1);
      py: array [1..4] of shortint = (-1,0,1,0);
Var   a : array [1..2,1..3] of byte;

Procedure Hien;
Var i,j: byte;
Begin
 HideMouse;
 For i:=1 to 2 do
   For j:=1 to 3 do
   begin
     GotoXY(35+j*2,i+10);
     TextColor(a[i,j]);
     Write('лл');
   end;
 ShowMouse;
End;

Procedure Init;
Begin
 a[1,1]:=2; a[1,2]:=12; a[1,3]:=1;
 a[2,1]:=0; a[2,2]:=15; a[2,3]:=4;
 Hien;
End;

Procedure Swap(Var a,b: byte);
Var tg: byte;
Begin
 tg:=a; a:=b; b:=tg;
End;

function Test: boolean;
Var i: byte;
Begin
 Test:=false;
 If a[1,1]<>2  then exit;
 If a[1,2]<>12 then exit;
 If a[2,1]<>0  then exit;
 If a[2,2]<>15 then exit;
 If a[1,3]<>4  then exit;
 If a[2,3]<>1  then exit;
 Test:=true;
End;

Procedure Play;
Var x,y,i,j,i1,j1,k: word;
Begin
 ShowMouse;
 Hien;
 Repeat
   If MouseEvent and mouseL then
   Begin
     x:=mouseX;
     y:=mouseY;
     For i:=1 to 4 do
       If (x>=35+i*2) and (x<37+i*2) then break;
     For j:=1 to 3 do If (y=10+j) then break;
     If (i in [1..3])and(j in [1..2]) then
       For k:=1 to 4 do
       begin
         i1:=i+px[k]; j1:=j+py[k];
         If (i1 in [1..3]) and (j1 in [1..2]) and (a[j1,i1]=15) then
         begin
           Swap(a[j,i],a[j1,i1]);
           break;
         end;
       end;
     Hien;
   End;
 Until Test or KeyPressed;
 If not Test then exit;
 Writeln;
 Writeln(' Ban da hoan thanh tro choi');
 Readln;
End;

BEGIN
 TextBackground(7);
 Clrscr;
 Init;
 Play;
END.