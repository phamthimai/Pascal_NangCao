Program P100812; {Hien thi giao cua 2 hinh ve chua trong file}
Uses Crt,Graph;
Var  Gd,Gm,m,n,x,y,i,j: Integer;
     a: array [1..100,1..100] of byte;
     b: array [1..100,1..100] of byte;
     f,g: text;

BEGIN
 Assign(f,'P10\P100812f.TXT');
 Reset(f);
 Readln(f,m,n);
 Readln(f,x,y);
 For i:=1 to m do
   For j:=1 to n do read(f,a[i,j]);
 Close(f);
 Assign(g,'P10\P100812g.TXT');
 Reset(g);
 Readln(g,m,n);
 Readln(g,x,y);
 For i:=1 to m do
   For j:=1 to n do read(g,b[i,j]);
 Close(g);
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 For i:=1 to m do
   For j:=1 to n do putpixel(j+x,i+y,a[i,j]+b[i,j]);
 Readln;
 CloseGraph;
END.