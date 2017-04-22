program bai14;
uses crt;
var i,j:byte;
    s1,s2:string;
    l:array[0..2] of byte;
(*--*)
begin
  clrscr;
  write('Nhap xau nhi phan thong tin : ');
  readln(s1);
  s2:='';
  clrscr;
  for i:=1 to length(s1) do
    if pos(s1[i],'01')=0 then
      begin
        write('Doan ma bit khong hop le');
        readln;
        exit;
      end;
  while (length(s1) mod 3)<>0 do s1:=s1+'2';
  for i:=1 to length(s1) div 3 do
    begin
      fillchar(l,sizeof(l),0);
      for j:=1 to 3 do inc(l[ord(s1[(i-1)*3+j])-48]);
      if l[0]>=2 then s2:=s2+'0' else
      if l[1]>=2 then s2:=s2+'1';
    end;
  writeln('Thong tin nhan duoc : ',s1);
  writeln('Thong tin giai ma : ',s2);
  readln;
end.