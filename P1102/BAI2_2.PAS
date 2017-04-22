program bai2;
uses crt;
const max=100;
var n,i:word;
    holot:array[1..max] of string[20];
    ten:array[1..max] of string[10];
    lop:array[1..max] of string[5];
(*--*)
begin
  clrscr;
  write('Danh sach co bao hoc sinh : ');
  readln(n);
  for i:=1 to n do
    begin
      clrscr;
      writeln('Hoc sinh thu ',i);
      write('Nhap ho lot : ');
      readln(holot[i]);
      write('Nhap ten : ');
      readln(ten[i]);
      write('Nhap lop : ');
      readln(lop[i]);
    end;
end.