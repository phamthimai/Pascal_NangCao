Program P100814;       {Ve Doan thang}
Uses Crt,Graph;
Var  Gd,Gm,n,i,j: Integer;
     x,y: array [1..100] of Integer;
     a: array [1..100,1..100] of byte;
     f: text;

BEGIN
 Assign(f,'P10\P100814.TXT');
 Reset(f);
 Readln(f,n);
 For i:=1 to n do Read(f,x[i],y[i]);
 For i:=1 to n do
   For j:=1 to n do read(f,a[i,j]);
 Close(f);
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 For i:=1 to n-1 do
   For j:=i+1 to n do
     If a[i,j]<>0 then
     begin
       SetColor(i+j);
       Line(x[i],y[i],x[j],y[j]);
     end;
 Readln;
 CloseGraph;
END.