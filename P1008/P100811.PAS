Program P100811; {Hien thi hinh ve chua trong file}
Uses Crt,Graph;
Var  Gd,Gm,m,n,x,y,i,j: Integer;
     a: array [1..100,1..100] of byte;
     f: text;

BEGIN
 Assign(f,'P10\P100811.TXT');
 Reset(f);
 Readln(f,m,n);
 Readln(f,x,y);
 For i:=1 to m do
   For j:=1 to n do read(f,a[i,j]);
 Close(f);
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 For i:=1 to m do
   For j:=1 to n do putpixel(j+x,i+y,a[i,j]);
 Readln;
 CloseGraph;
END.