Program P100815;       {To mau cac hinh tron}
Uses Crt,Graph;
Var  Gd,Gm,n,i,j: Integer;
     a: array [1..3,1..100] of Integer;
     Pattern : FillPatternType;

BEGIN
 Write('Nhap so tu nhien n: '); Readln(n);
 Writeln('Nhap X Y R cua n hinh tron: ');
 For i:=1 to n do
 begin
   For j:=1 to 3 do Read(a[j,i]); Readln;
 end;
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 GetFillPattern(Pattern);
 For i:=1 to n do
 begin
   Circle(a[1,i],a[2,i],a[3,i]);
   Delay(500);
 end;
 For i:=n downto 1 do
 begin
   SetColor(i);
   Circle(a[1,i],a[2,i],a[3,i]);
   SetFillPattern(Pattern,i);
   FloodFill(a[1,i],a[2,i],i);
   Delay(500);
 end;
 Readln;
 CloseGraph;
END.