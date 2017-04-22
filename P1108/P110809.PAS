Program P110809;        {ve do thi ham y = (sqr(x)-x+1)/(x-1)}
Uses  Crt,Graph;
Const i0=300; j0=250; E=30;
Var   Gd,Gm,i,j,il,jl: Integer;
      x,y: real;
      S: string;

Function f(x: real): real;
Begin
 f:=(sqr(x)-x+1)/(x-1);
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
 x:=1; {tiem can dung}
 i:=round(x*E+i0);
 Line(i,50,i,400);
 {tiem can xien}
 i:=170; y:=(i-i0)/E;  {y=x}
 j:=round(-y*E+j0);
 il:=480; y:=(il-i0)/E;  {y=x}
 jl:=round(-y*E+j0);
 Line(i,j,il,jl);
 For i:=70 to 580 do
 begin
   x:=(i-i0)/E;
   If (x-1)<>0 then
   begin
     y:=f(x);
     j:=round(-y*e+j0);
     SetColor(2);
     If (i<>70)and(j>70)and(j<380) then Line(i,j,il,jl);
     il:=i; jl:=j;
   end;
 end;
 Readln;
 CloseGraph;
END.
