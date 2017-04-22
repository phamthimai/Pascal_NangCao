Program P110916;   {nhieu diem chuyen dong voi van toc khac nhau}
Uses  Crt, Graph;
Const vx: array [1..10] of integer=(  1, 7, 2,  5,  6,  4, 10,  9,  3,  5);
      y0: array [1..10] of integer=(410,50,90,130,170,210,250,290,330,370);
Var   Gd,Gm,i: Integer;
      x,y: array [1..10] of integer;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 For i:=1 to 10 do y[i]:=y0[i];
 Repeat
   For i:=1 to 10 do PutPixel(x[i],y[i],15); Delay(20);
   For i:=1 to 10 do PutPixel(x[i],y[i],0);
   For i:=1 to 10 do
   begin
     Inc(x[i],vx[i]);
     If x[i]>640 then x[i]:=0;
     If x[i]<0 then x[i]:=640;
   end;
 Until KeyPressed;
 CloseGraph;
END.
