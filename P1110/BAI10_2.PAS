program bai2;
uses crt;
var a,b,c:real;
(*--*)
function vuong(c1,c2,c3:real):boolean;
 begin
   vuong:=c1*c1=c2*c2+c3*c3;
 end;
(*--*)
function tu(c1,c2,c3:real):boolean;
 begin
   tu:=c1*c1>c2*c2+c3*c3;
 end;
(*--*)
begin
  repeat
    clrscr;
    write('Nhap do dai 3 canh cua 1 tam giac : ');
    readln(a,b,c);
  until (a>0) and (b>0) and (c>0) and (a<b+c) and (b<c+a) and (c<a+b);
  if vuong(a,b,c) or vuong(b,c,a) or vuong(c,b,a) then
     write('Tam giac voi do dai 3 canh da cho la tam giac vuong') else
  if tu(a,b,c) or tu(b,c,a) or tu(c,a,b) then
     write('Tam giac voi do dai 3 canh da cho la tam giac tu') else
     write('Tam giac voi do dai 3 canh da cho la tam giac nhon');
  readln;
end.