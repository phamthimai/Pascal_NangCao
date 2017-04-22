Program P111007;
{Tinh tong khoang cach tu 1 diem toi cac canh cua hinh chu nhat}
Uses Crt;
Var x,y,kc1,kc2:real;

Procedure Tinh(x1,y1,x2,y2: real);
Begin
 If (x1<=x)and(x<=x2) then kc1:=x2-x1
 Else If x<x1 then kc1:=x2-x1+2*(x1-x)
      Else kc1:=x2-x1+2*(x-x2);
 If (y1<=y)and(y<=y2) then kc2:=y2-y1
 Else If y<y1 then kc2:=y2-y1+2*(y1-y)
      Else kc2:=y2-y1+2*(y-y2);
End;

BEGIN
 Clrscr;
 Write('Nhap toa do diem A: '); Readln(x,y);
 Clrscr;
 Tinh(-0.5,-0.5,0.5,0.5);
 Writeln('a. Tong khoang cach la: ',kc1+kc2:5:2);
 Tinh(0,0,1,1);
 Writeln('b. Tong khoang cach la: ',kc1+kc2:5:2);
 Readln;
END.