Program P100817;       {Ve cac hinh tron dinh nhau}
Uses Crt,Graph;
Var  Gd,Gm: Integer;
     n,i,j: LongInt;
     a: array [0..3,1..100] of LongInt;

BEGIN
 Write('Nhap so tu nhien n: '); Readln(n);
 Writeln('Nhap X Y R cua n hinh tron: ');
 For i:=1 to n do
 begin
   For j:=1 to 3 do Read(a[j,i]); Readln;
 end;
 For i:=1 to n-1 do
   For j:=i+1 to n do
     If ((a[3,i]+a[3,j])>sqrt(sqr(a[1,i]-a[1,j])+sqr(a[2,i]-a[2,j]))) then
     begin
       a[0,i]:=1;
       a[0,j]:=1;
     end;
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 For i:=1 to n do
   If (a[0,i]=1) then Circle(a[1,i],a[2,i],a[3,i]);
 Readln;
 CloseGraph;
END.