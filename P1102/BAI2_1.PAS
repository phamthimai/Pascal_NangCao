program bai1;
uses crt;
const max=100;
var i,n:byte;
    ten,holot:array[1..max] of string[20];
    lop:array[1..max] of string[5];
    danhsach:array[1..max] of string[45];
(*--*)
begin
  clrscr;
  write('Co bao hoc sinh : ');
  readln(n);
  clrscr;
  for i:=1 to n do
    begin
      write('Nhap ho lot hoc sinh thu ',i,' : ');
      readln(holot[i]);
      while length(holot[i])<20 do holot[i]:=holot[i]+' ';
      write('Nhap ten hoc sinh thu ',i,' : ');
      readln(ten[i]);
      while length(ten[i])<20 do ten[i]:=ten[i]+' ';
      write('Nhap lop hoc sinh thu ',i,' : ');
      readln(lop[i]);
      while length(lop[i])<5 do lop[i]:=lop[i]+' ';
      danhsach[i]:=holot[i]+ten[i]+lop[i];
    end;
end.