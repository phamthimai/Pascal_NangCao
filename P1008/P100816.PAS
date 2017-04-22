Program P100816;       {To mau cac hinh vuong}
Uses Crt,Graph;
Var  Gd,Gm,n,X,Y,i: Integer;
     r: array [1..100] of Integer;

BEGIN
 Write('Nhap hai so tu nhien X Y: '); Readln(X,Y);
 Write('Nhap so tu nhien n: '); Readln(n);
 Writeln('Nhap canh cua n hinh vuong: ');
 For i:=1 to n do Read(r[i]); Readln;
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 For i:=1 to n do
 begin
   SetFillStyle(SolidFill,i);
   Bar(X-r[i] div 2,Y-r[i] div 2,X+r[i] div 2,Y+r[i] div 2);
   Delay(1000);
 end;
 SetFillStyle(SolidFill,0);
 For i:=n downto 1 do
 begin
   Bar(X-r[i] div 2,Y-r[i] div 2,X+r[i] div 2,Y+r[i] div 2);
   Delay(1000);
 end;
 CloseGraph;
END.