program bai5;
uses crt;
var i:byte;
    x,y:array[1..4] of real;
(*--*)
procedure error;
 begin
   write('Du lieu sai');
   readln;
   halt;
 end;
(*--*)
begin
  clrscr;
  for i:=1 to 3 do
    begin
      write('Nhap toa do dinh thu ',i,' (x,y) = ');
      readln(x[i],y[i]);
    end;
  if (x[1]=x[2]) and (x[2]=x[3]) then error;
  if (y[1]=y[2]) and (y[2]=y[3]) then error;
  if (x[1]=x[2]) then x[4]:=x[3] else
  if (x[2]=x[3]) then x[4]:=x[1] else
  if (x[3]=x[1]) then x[4]:=x[2] else error;
  if (y[1]=y[2]) then y[4]:=y[3] else
  if (y[2]=y[3]) then y[4]:=y[1] else
  if (y[3]=y[1]) then y[4]:=y[2] else error;
  clrscr;
  write('Toa do dinh thu 4 la (x,y) = ',x[4]:5:2,y[4]:5:2);
  readln;
end.