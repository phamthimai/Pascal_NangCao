Program P110817;      {Duong cong Pascal}
Uses  Crt,Graph;
Const i0=200; j0=240; E=80;
      a=2; b=1;
Var   Gd,Gm,i,j,tt: Integer;
      x,y,t: real;
      S: string;

Function yy(t: real): real;  {tinh y theo t}
Begin
 yy:=a*sin(t)*cos(t)+b*sin(t);
End;

Function xx(t: real): real;  {tinh x theo t}
Begin
 xx:=a*sqr(cos(t))+b*cos(t);
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd, Gm,' ');
 Line(i0,50,i0,400);       {Oy}
 Line(50,j0,600,j0);       {Ox}
 OutTextXY(i0+5,j0+5,'0');
 OutTextXY(600-3,j0+5,'x');
 OutTextXY(i0+5,50,'y');
 For i:=51 to 599 do
   If((i-i0) mod E=0) then
   begin
     Bar (i-1,j0-1,i+1,j0+1);
     x:=(i-i0)/E;
     Str(x:0:0,S);
     If x<>0 then OutTextXY(i+2,j0+5,S);
   end;
 For j:=51 to 399 do
   If((j-j0) mod E=0) then
   begin
     y:=-(j-j0)/E;
     Bar (i0-1,j-1,i0+1,j+1);
     Str(y:0:0,S);
     If y<>0 then OutTextXY(i0+5,j,S);
   end;
 For tt:=0 to 6300 do     {tt:0..2pi}
 begin
   t:=tt/1000; x:=xx(t); y:=yy(t);
   i:=Round(x*e+i0); j:=Round(y*e+j0);
   If (i>70)and(j>70)and(i<600)and(j<400) then PutPixel(i,j,2);
 end;
 Readln;
 CloseGraph;
END.
