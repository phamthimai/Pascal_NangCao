Program P121101;  {Ban co 7 o}
Uses Crt;
{$i p1211\mouse.pas}
Var a : array [0..7] of byte;
    fc: byte;

Procedure hien;
Var i: byte; s: string;
Begin
 HideMouse;
 For i:=1 to 7 do
 Begin
   If i=fc then s:='  X  ' Else s:='     ';
   Case a[i] of
     1: TextBackground(2);
     2: TextBackground(4);
     0: TextBackground(7);
   End;
   Gotoxy(i*6,1);
   Write(s);
 End;
 ShowMouse;
End;

Procedure Swap(Var a,b: byte);
Var tg: byte;
Begin
 tg:=a; a:=b; b:=tg;
End;

Procedure Init;
Var i: byte;
Begin
 a[4]:=0; a[0]:=0;
 fc:=3;
 For i:=1 to 3 do
 Begin
   a[i]:=1; a[8-i]:=2;
 End;
End;

Function  Test: boolean;
Var i: byte;
Begin
 test:=false;
 For i:=1 to 3 do If a[i]<>2 then exit;
 For i:=5 to 7 do If a[i]<>1 then exit;
 test:=true;
End;

Procedure Play;
label l1;
Var i,t: byte; x: word;
Begin
 ShowMouse;
 Hien;
 Repeat
   If MouseEvent and MouseL and (mouseY=1) then
   Begin
     x:=mouseX;
     t:=0;
     For i:=1 to 7 do
       If (x>=i*6)and(x<(i+1)*6) then
       Begin
         t:=i;
         break;
       End;
     If a[t]<>0 then Begin fc:=t; End;
     If (a[t]=0)and(t<>0)and(abs(t-fc)<3) then
     Begin
       Swap(a[t],a[fc]);
       fc:=t;
     End;
     Hien;
   End;
 Until test or KeyPressed;
 If not Test then exit;
 Writeln;
 TextBackground(0);
 Writeln(' Ban da hoan thanh tro choi ');
 Readln;
End;

BEGIN
 Clrscr;
 Init;
 Play;
END.