Program P110811;        {ve do thi ham x=at+x0, y=bt+y0}
Uses  Crt,Graph;
Const i0=300; j0=200; E=80;
      x0=1; y0=-1; a=2; b=1;
Var   Gd,Gm,i,j,il,jl: Integer;
      x,yy: real;
      S: string;

Function y(tt: real): real;   {tinh y theo t}
Begin
 y:=b*tt+y0;
End;

Function t(x: real): real;    {tinh t theo x}
Begin
 t:=(x-x0)/a;
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
     yy:=-(j-j0)/E;
     Bar (i0-1,j-1,i0+1,j+1);
     Str(yy:0:0,S);
     If yy<>0 then OutTextXY(i0+5,j,S);
   end;
 For i:=70 to 580 do
 begin
   x:=(i-i0)/E;
   j:=round(-y(t(x))*e+j0);
   SetColor(2);
   If (i<>70)and(j>70)and(j<380) then Line(i,j,il,jl);
   il:=i; jl:=j;
 end;
 Readln;
 CloseGraph;
END.
