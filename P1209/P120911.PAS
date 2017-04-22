Program P120911;    {Mo phong chyen dong cua n qua cau}
Uses  Crt,Graph;
Const fi = 'P1209\INPUT.DAT';
Var   t,d        : real;
      f          : text;
      a          : array [1..100,1..3] of real;
      Gd,Gm,n,i,j: integer;

BEGIN
 Assign(f,fi); Reset(f);
 Readln(f,n);
 For i:=1 to n do Read(f,a[i,1]); Readln(f);
 For i:=1 to n do Read(f,a[i,2]); Readln(f);
 Close(f);
 Gd:=Detect;
 InitGraph(Gd,Gm,'c:\turbo\graph');
 t:=0.05;
 Repeat
   For i:=1 to n do
   begin
     Circle(Round(a[i,1]),240,10);
     a[i,3]:=a[i,1];
     a[i,1]:=a[i,1]+t*a[i,2];
   end;
   For i:=1 to n-1 do
     For j:=i+1 to n do
       If Abs(a[i,1]-a[j,1])<20 then
       begin
         d:=a[i,2]; a[i,2]:=a[j,2]; a[j,2]:=d;
       end;
   SetColor(0);
   For i:=1 to n do Circle(Round(a[i,3]),240,10);
   Setcolor(15);
 Until KeyPressed;
 CloseGraph;
END.