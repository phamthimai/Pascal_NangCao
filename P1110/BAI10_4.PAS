program bai4;
uses crt;
var x1,x2,y1,y2,x3,y3,tg:real;
(*--*)
begin
  repeat
    clrscr;
    write('Nhap toa do diem A : ');
    readln(x1,y1);
    write('Nhap toa do diem B : ');
    readln(x2,y2);
  until x1<>x2;
  y3:=0;
  if y1=0 then x3:=x1 else
  if y2=0 then x3:=x2 else
    begin
      if y1*y2>0 then y1:=-y1;
      tg:=(x1-x2)/(y2-y1);
      x3:=x1+tg*y1;
    end;
  clrscr;
  write('Toa do diem C la : ',x3:5:2,y3:5:2);
  readln;
end.