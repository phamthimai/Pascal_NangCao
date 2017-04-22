Program P100912;{Ve nguoi di}
Uses crt,graph;
Var x,dx:integer;

Procedure init;
Var gd,gm:integer;
Begin
 gd:=0;
 Initgraph(gd,gm,'');
End;

Procedure p1(x:integer);
Begin
 Fillellipse(x,100,10,10);
 Bar(x-5,111,x+5,140);
 Line(x,140,x-9,180);
 Line(x,140,x+9,160);
 Line(x+9,160,x+9,180);
End;

Procedure p2(x:integer);
Begin
 Fillellipse(x,100,10,10);
 Bar(x-5,111,x+5,140);
 Line(x,140,x-4,180);
 Line(x,140,x+4,160);
 Line(x+4,160,x+4,180);
End;

Procedure p3(x:integer);
Begin
 Fillellipse(x,100,10,10);
 Bar(x-5,111,x+5,140);
 Line(x,140,x,180);
End;

Begin
 init;
 x:=20;
 dx:=5;
 Repeat
   Setcolor(15);
   SetFillstyle(1,15);
   p1(x);
   Delay(100);
   Setcolor(0);
   SetFillstyle(0,0);
   p1(x);
   Setcolor(15);
   SetFillstyle(1,15);
   x:=x+dx;
   p2(x);
   Delay(100);
   Setcolor(0);
   SetFillstyle(0,0);
   p2(x);
   Setcolor(15);
   SetFillstyle(1,15);
   x:=x+dx;
   p3(x);
   Delay(100);
   Setcolor(0);
   SetFillstyle(0,0);
   p3(x);
   Setcolor(15);
   SetFillstyle(1,15);
   x:=x+dx;
   p2(x);
   Delay(100);
   Setcolor(0);
   SetFillstyle(0,0);
   p2(x);
   If x>600 then x:=15;
 Until keypressed;
 closegraph;
End.