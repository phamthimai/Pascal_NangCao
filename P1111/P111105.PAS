Program P111105;      {Duong cong Bong hoa}
Uses  Crt,Graph;
Const i0=300; j0=240; E=20;
      D=1; B=2; A=7;
Var   Gd,Gm,i,j,tt,n: Integer;
      x,y,t,u: real;
      S: string;

Function xx(t: real): real;  {tinh x theo t}
Begin
 xx:=(A-B)*cos(t)-D*cos(u);
End;

Function yy(t: real): real;  {tinh y theo t}
Begin
 yy:=(A-B)*sin(t)-D*sin(u);
End;

Function USCLN(a,b: integer): integer;
Var r: integer;
Begin
  While b<>0 do begin r:=a mod b; a:=b; b:=r; end;
  USCLN:=a;
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
 n:=B div USCLN(A,B);
 For tt:=0 to n*6300 do     {t:0..n*2pi}
 begin
   t:=tt/1000; u:=A*t/B; x:=xx(t); y:=yy(t);
   i:=Round(x*e+i0); j:=Round(y*e+j0);
   If (i>70)and(j>70)and(i<600)and(j<400) then PutPixel(i,j,2);
 end;
 Readln;
 CloseGraph;
END.
