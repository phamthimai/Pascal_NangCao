Program P120910;  {Mo phong chyen dong 2 qua cau}
Uses Crt,Graph;
Var  x1,x2,v1,v2,t,d,x11,x21: real;
     Gd,Gm                  : integer;

BEGIN
 Write(' X1 = '); Readln(x1);
 Write(' X2 = '); Readln(x2);
 Write(' V1 = '); Readln(v1);
 Write(' V2 = '); Readln(v2);
 Gd:=Detect;
 InitGraph(Gd,Gm,'c:\turbo\graph');
 t:=0.05;
 Repeat
   Circle(Round(x1),240,10); Circle(Round(x2),240,10);
   x11:=x1; x21:=x2;
   x1:=x1+t*v1; x2:=x2+t*v2;
   If Abs(x1-x2)<20 then begin d:=v1; v1:=v2; v2:=d; end;
   SetColor(0);
   Circle(Round(x11),240,10); Circle(Round(x21),240,10);
   Setcolor(15);
 Until Abs(x1-x2)>1000;
 CloseGraph;
END.