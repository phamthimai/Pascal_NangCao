Program P110813;        {ve do thi ham x=rcost+a, y=rsint+b}
Uses  Crt,Graph;
Const i0=300; j0=200; E=60;
      x0=1; y0=0; a=3; b=2;
Var   Gd,Gm,i,j,t: Integer;
      x,y: real;
      S: string;

Function yy(t: real): real;   {tinh y theo t}
Begin
 yy:=b*sin(t)+y0;
End;

Function xx(t: real): real;    {tinh x theo t}
Begin
 xx:=a*cos(t)+x0;
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
 For t:=0 to 1000 do
 begin
   i:=round(xx(t)*E+i0);
   j:=round(-yy(t)*E+j0);
   SetColor(2);
   If (i>70)and(i<600)and(j>70)and(j<380) then PutPixel(i,j,2);
 end;
 Readln;
 CloseGraph;
END.
