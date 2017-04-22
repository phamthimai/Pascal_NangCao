Program P100717;       {Ve Con Meo}
Uses  Crt, Graph;
Const n=16;
Var   Gd,Gm,x,y: Integer;
      a: array [1..n,1..n] of byte;
      f: text;

{Noi dung file P10\P100717.TXT la hinh con Meo
1 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1
1 0 0 0 0 1 1 1 0 0 0 0 1 0 1 0
1 0 0 0 1 1 1 1 1 0 0 1 1 1 1 1
1 0 0 0 1 1 1 1 1 0 0 1 0 1 0 1
1 0 0 1 1 1 1 1 1 1 0 1 1 1 1 1
1 0 1 1 1 1 1 1 1 1 1 1 1 0 1 1
1 0 1 1 1 1 1 1 1 1 0 0 1 1 1 0
1 1 1 1 1 1 0 1 1 1 0 0 0 1 0 0
0 1 1 1 1 1 0 1 1 1 0 0 0 0 0 0
0 0 1 1 1 1 0 1 1 1 1 0 0 0 0 0
0 1 1 0 1 1 0 0 1 0 1 0 0 0 0 0
0 1 1 0 1 1 0 0 1 0 0 1 0 0 0 0
0 1 0 0 1 0 0 0 0 1 0 1 0 0 0 0
0 1 0 0 1 0 0 0 0 1 0 1 0 0 0 0
0 1 0 0 1 0 0 0 0 1 0 0 1 0 0 0
0 0 1 0 0 1 0 0 0 0 1 0 1 0 0 0}

BEGIN
 Assign(f,'P10\P100717.TXT');
 Reset(f);
 For y:=1 to n do
   For x:=1 to n do read(f,a[x,y]);
 Close(f);
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 For y:=1 to n do
   For x:=1 to n do PutPixel(x,y,a[x,y]+1);
 Readln;
 CloseGraph;
END.