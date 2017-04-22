Program P100713;  {Hinh chu nhat thay doi kich thuoc}
Uses Crt,Graph;
Var  Gd,Gm,x,y: Integer;
     tl: real;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 tl:=GetMaxY/GetMaxX;
 SetFillStyle(1,4);
 For x:=1 to GetMaxX do
 begin
   y:=round(x*tl);
   Bar((GetMaxX-x) div 2,(GetMaxY-y) div 2,
       (GetMaxX+x) div 2,(GetMaxY+y) div 2);
   Delay(10);
 end;
 CloseGraph;
END.