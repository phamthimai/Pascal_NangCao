Program P120116;   {Duong gap khuc Con Rong}
Uses Crt,Graph;
Var  n,Gd,Gm: integer;

Procedure Conrong(x1,y1,x2,y2,m: integer);
Var x,y,x0,y0: integer;
Begin
 Randomize;
 If Random(2)=0 then
   begin
     x:=(x1+x2) div 2 +(y1-y2) div 2;
     y:=(y1+y2) div 2 +(x2-x1) div 2;
   end
 Else
   begin
     x:=(x1+x2) div 2 +(y2-y1) div 2;
     y:=(y1+y2) div 2 +(x1-x2) div 2;
   end;
 If m=1 then Line(x1,y1,x,y) Else Conrong(x1,y1,x,y,m-1);
 If m=1 then Line(x,y,x2,y2) Else Conrong(x2,y2,x,y,m-1);
End;

BEGIN
 Clrscr;
 Write(' Nhap N: '); Readln(n);
 Gd:=Detect;
 InitGraph(Gd,Gm,'c:\turbo\graph');
 Conrong(200,400,500,200,n);
 OutTextXY(10,10,'Xong. Nhan Enter de thoat...');
 Readln;
 CloseGraph;
END.