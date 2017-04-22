Program P110808;        {ve do thi ham y = (x-1)/(x+1)}
Uses  Crt,Graph;
Const i0=300; j0=250; E=50;
Var   Gd,Gm,i,j,il,jl: Integer;
      x,y: real;
      S: string;

Function f(x: real): real;
Begin
 f:=(x-1)/(x+1);
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd, Gm,' ');
 Line(i0,50,i0,400);
 Line(50,j0,600,j0);
 OutTextXY(i0+5,j0+5,'0');
 OutTextXY(600-3,j0+5,'x');
 OutTextXY(i0+5,50,'y');
 For i:=51 to 599 do
   If(i mod E=0) then
   begin
     Bar (i-1,j0-1,i+1,j0+1);
     x:=(i-i0)/E;
     Str(x:0:0,S);
     If x<>0 then OutTextXY(i+2,j0+5,S);
   end;
 For j:=51 to 399 do
   If(j mod E=0) then
   begin
     Bar (i0-1,j-1,i0+1,j+1);
     y:=-(j-j0)/E;
     Str(y:0:0,S);
     If y<>0 then OutTextXY(i0+5,j+5,S);
   end;
 x:=-1; {tiem can dung}
 i:=round(x*E+i0);
 Line(i,50,i,400);
 y:=-1; {tiem can ngang}
 j:=round(y*E+j0);
 Line(50,j,600,j);
 For i:=70 to 580 do
 begin
   x:=(i-i0)/E;
   If (x+1)<>0 then
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
