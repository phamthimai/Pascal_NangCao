Program P110803;        {ve do thi ham y = sqr(x)/2}
Uses  Crt,Graph;
Const i0=300; j0=250; E=50;
Var   Gd,Gm,i,j,c: Integer;
      x,y: real;
      S: string;

Function f(x: real): real;
Begin
 f:=Sqr(x)/2;
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd, Gm,' ');
 Line(i0,50,i0,400);
 Line(50,j0,600,j0);
 OutTextXY(600-3,j0+5,'x');
 OutTextXY(i0+5,50,'y');
 For i:=51 to 599 do
   If(i mod E=0) then
   begin
     Bar (i-1,j0-1,i+1,j0+1);
     x:=(i-i0)/E;
     Str(x:0:0,S);
     If x<>0 then OutTextXY(i-3,j0+5,S);
   end;
 For j:=51 to 399 do
   If(j mod E=0) then
   begin
     Bar (i0-1,j-1,i0+1,j+1);
     y:=-(j-j0)/E;
     Str(y:0:0,S);
     If y<>0 then OutTextXY(i0+5,j,S);
   end;
 For i:=70 to 580 do
 begin
   x:=(i-i0)/E;
   y:=f(x);
   j:=round(-y*e+j0);
   If (j>70)and(j<380) then PutPixel(i,j,2);
 end;
 Readln;
 CloseGraph;
END.
