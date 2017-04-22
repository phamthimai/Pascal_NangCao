Program P111004;  {Tim C sao cho CA+CB nho nhat}
Uses Crt;
Var  x1,x2,y1,y2,x3,y3,tg: real;

BEGIN
 Repeat
   Clrscr;
   Write('Nhap toa do diem A: '); Readln(x1,y1);
   Write('Nhap toa do diem B: '); Readln(x2,y2);
 Until x1<>x2;
 y3:=0;
 If y1=0 then x3:=x1 Else
   If y2=0 then x3:=x2 Else
   begin
     If y1*y2>0 then y1:=-y1;
     tg:=(x1-x2)/(y2-y1);
     x3:=x1+tg*y1;
   end;
 Clrscr;
 Write('Toa do diem C la: ',x3:5:2,y3:5:2);
 Readln;
END.