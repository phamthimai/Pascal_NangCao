Program P110822;      {Duong cong Conhoid Nicomed}
Uses  Crt,Graph;
Const i0=300; j0=240; E=70;
      a=0.1; l=0.9;
Var   Gd,Gm,i,j,il,jl,tt: Integer;
      x,y,t: real;
      S: string;

Function xx(t: real): real;  {tinh x theo t}
Begin
 xx:=a+l*cos(t);
End;

Function yy(t: real): real;  {tinh y theo t}
Begin
 yy:=a*sin(t)/cos(t)+l*sin(t);
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
     If y<>0 then OutTextXY(i0-20,j,S);
   end;
 For tt:=-1570 to 1570 do   {nhanh trai}
 begin
   t:=tt/1000; x:=xx(t); y:=yy(t);
   i:=Round(x*e+i0); j:=Round(y*e+j0);
   If (i>70)and(j>70)and(i<600)and(j<400) then PutPixel(i,j,2);
 end;
 SetColor(2);
 For tt:=1580 to 4700 do   {nhanh phai}
 begin
   t:=tt/1000; x:=xx(t); y:=yy(t);
   i:=Round(x*e+i0); j:=Round(y*e+j0);
   If (tt>1580)and(i>70)and(j>70)and(i<600)and(j<400) then Line(i,j,il,jl);
   il:=i; jl:=j;
 end;
 Readln;
 CloseGraph;
END.
