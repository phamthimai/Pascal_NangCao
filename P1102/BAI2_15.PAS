program bai15;
uses crt;
var i:byte;
    s:string;
(*--*)
begin
  clrscr;
  write('Nhap xau ki tu : ');
  readln(s);
  clrscr;
  writeln('Xau ban dau : ',s);
  while pos('#',s)<>0 do
    begin
      i:=pos('#',s);
      delete(s,i,1);
      if i>1 then delete(s,i-1,1);
    end;
  writeln('Xau da sua : ',s);
  readln;
end.