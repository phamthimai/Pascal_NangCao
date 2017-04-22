program bai12;
uses crt;
const max=100;
      e=0.000001;
var i,n,d1,d2,d3,d4:word;
    x,y:array[1..max] of real;
    c1,c2,c3,p,dth:real;
(*--*)
function kc(cs1,cs2:word):real;
 begin
   kc:=sqrt(sqr(x[cs1]-x[cs2])+sqr(y[cs1]-y[cs2]));
 end;
(*--*)
function dt(d1,d2,d3:word):real;
 begin
   c1:=kc(d1,d2);
   c2:=kc(d2,d3);
   c3:=kc(d3,d1);
   p:=(c1+c2+c3)/2;
   dt:=sqrt(p*(p-c1)*(p-c2)*(p-c3));
 end;
(*--*)
function found:boolean;
 var i:word;
  begin
    for i:=1 to n do
      if (i<>d1) and (i<>d2) and (i<>d3) and
         (abs(dth-dt(d1,d2,i)-dt(d2,d3,i)-dt(d3,d1,i))<e) then
        begin
          d4:=i;
          found:=true;
          exit;
        end;
    found:=false;
  end;
(*--*)
begin
  repeat
    clrscr;
    write('Co bao nhieu diem : ');
    readln(n);
  until n>2;
  for i:=1 to n do
    begin
      write('Nhap toa do diem thu ',i,' : ');
      readln(x[i],y[i]);
    end;
  d1:=1;
  d2:=2;
  d3:=3;
  dth:=dt(d1,d2,d3);
  while found do
    begin
      d3:=d4;
      dth:=dt(d1,d2,d3);
    end;
  clrscr;
  write('Tam giac cuc tieu co 3 dinh la : ',d1:5,d2:5,d3:5);
  readln;
end.