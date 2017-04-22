Program P120904;   {Robin Hud}
Uses Crt,Graph;
Var  l1,l2,l3,s1,s2,h1,h2,a,b,x2,y2,x3,y3,d,x4,vy,vx: real;
     Gd,Gm: integer;
Label 1;

Procedure tinhab;
Var d,da,db: real;
Begin
 d:=x2*x2*x3-x3*x3*x2;
 da:=y2*x3-y3*x2; db:=x2*x2*y3-x3*x3*y2;
 a:=da/d; b:=db/d;
End;

Function kt: boolean;
Var y,x: real;
Begin
 kt:=false;
 y:=a*x4*x4+b*x4;
 If (y<h1)or(y>s1+h1) then exit;
 x:=-b/(2*a);
 If (x>x2)and(x<x4) then
 begin
   y:=-b*b/(4*a);
   If y>h1+s1 then exit;
 end;
 kt:=true;
End;

Procedure Linet(x1,y1,x2,y2: real);
Begin
 Line(Round(x1),240-Round(y1),Round(x2),240-Round(y2));
End;

Procedure ve;
Var x,y: real;
Begin
 Linet(l1,h1+s1,l1+l2,h1+s1);
 Linet(x2,0,x2,h1);
 Linet(x4,0,x4,h1);
 Linet(x3,0,x3,h2);
 x:=0;
 Repeat
   y:=a*x*x+b*x;
   PutPixel(Round(x),240-Round(y),15);
   x:=x+0.5;
 Until y<0;
End;

BEGIN
 Clrscr;
 Write(' L1 = '); Readln(l1);
 Write(' L2 = '); Readln(l2);
 Write(' L3 = '); Readln(l3);
 Write(' H1 = '); Readln(h1);
 Write(' H2 = '); Readln(h2);
 Write(' S1 = '); Readln(s1);
 Write(' S2 = '); Readln(s2);
 x2:=l1;
 x3:=l1+l2+l3;
 y2:=h1;
 d:=5;
 x4:=l1+l2;
 gd:=detect;
 InitGraph(Gd,Gm,'c:\turbo\graph');
 Repeat
   y3:=h2;
   Repeat
     tinhab;
     ve;
     If kt then goto 1;
     y3:=y3+d;
   Until y3>h2+s2;
   y2:=y2+d;
 Until y2>h1+s1;
 CloseGraph;
 Write('Khong the nem duoc');
 Readln;
 Exit;
1:
 Readln;
 CloseGraph;
 Writeln(' Nem voi goc co tg = ',b:3:2);
 vy:=-10*b/(2*a);
 vx:=b*vy;
 Writeln(' Nem voi van toc = ',sqrt((vy*vy)+(vx*vx)):3:2);
 Readln;
END.