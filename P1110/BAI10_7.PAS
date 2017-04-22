program bai7;
uses crt;
var x,y,kc1,kc2:real;
(*--*)
procedure tinh(x1,y1,x2,y2:real);
 begin
   if (x1<=x) and (x<=x2) then kc1:=x2-x1 else
   if x<x1 then kc1:=x2-x1+2*(x1-x) else
                kc1:=x2-x1+2*(x-x2);
   if (y1<=y) and (y<=y2) then kc2:=y2-y1 else
   if y<y1 then kc2:=y2-y1+2*(y1-y) else
                kc2:=y2-y1+2*(y-y2);
 end;
(*--*)
begin
  clrscr;
  write('Nhap toa do diem A : ');
  readln(x,y);
  clrscr;
  tinh(-0.5,-0.5,0.5,0.5);
  writeln('Tong khoang cach tu diem A toi cac canh hv thu 1 la : ',kc1+kc2:5:2);
  tinh(0,0,1,1);
  writeln('Tong khoang cach tu diem A toi cac canh hv thu 2 la : ',kc1+kc2:5:2);
  readln;
end.