Program  P101115; {Ve hinh tron va hinh chu nhat}
Uses Crt,Graph;
Var  gd,gm: integer;
     x1,x2,y1,y2,w,h,r: integer;

Procedure Nhap;
Begin
 Writeln('Cho so lieu cua hinh tron:');
 Writeln('Toa do tam :');
 Write('      X = '); Readln(x1);
 Write('      Y = '); Readln(y1);
 Writeln('Ban kinh :');
 Write('      R = '); Readln(r);
 Writeln('Cho so lieu cua hinh chu nhat:');
 Writeln('Toa do tam :');
 Write('      X = '); Readln(x2);
 Write('      Y = '); Readln(y2);
 Writeln('Chieu rong:');
 Write('      W = '); Readln(w);
 Writeln('Chieu cao:');
 Write('      H = '); Readln(h);
End;

BEGIN
 ClrScr;
 Nhap;
 gd:=Detect;
 InitGraph(gd,gm,'c:\tp70\bgi');
 SetColor(15);
 Line(x1,y1,x2,y2);
 SetColor(14);
 Circle(x1,y1,r);
 Rectangle(x2-(w div 2),y2-(h div 2),x2+(w div 2),y2+(h div 2));
 Readln;
 SetFillStyle(1,0);
 FloodFill(x1,y1,14);
 FloodFill(x2,y2,14);
 Repeat Until KeyPressed;
 CloseGraph;
END.