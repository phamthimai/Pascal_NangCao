program bai13;
uses crt;
var i,j,max,l:word;
    code:array[1..2,1..9] of byte;
    dl:array[1..300] of char;
    s:array[1..2] of string;
    khoa,tam,out:string;
(*--*)
procedure error;
 begin
   write('Khoa khong hop le');
   readln;
   halt;
 end;
(*--*)
procedure mahoa(xau:string;khoa:byte);
 begin
   for i:=1 to length(xau) do dl[i]:=xau[i];
   l:=length(xau);
   for i:=1 to max-(length(xau) mod max) do dl[l+i]:=' ';
   inc(l,max-(length(xau) mod max));
   for i:=1 to l div max do
     begin
       tam:='';
       for j:=1 to max do tam:=tam+dl[(i-1)*max+j];
       for j:=1 to max do out[j]:=tam[code[khoa,j]];
       write(out);
     end;
 end;
(*--*)
begin
  clrscr;
  write('Nhap khoa : ');
  readln(khoa);
  max:=0;
  tam:='';
  if length(khoa)=0 then error;
  for i:=1 to length(khoa) do
    begin
      if pos(khoa[i],'123456789')=0 then error;
      if pos(khoa[i],tam)<>0 then error;
      tam:=tam+khoa[i];
      if max<ord(khoa[i]) then max:=ord(khoa[i]);
    end;
  max:=max-48;
  if max<>length(khoa) then error;
  for i:=1 to max do
    begin
      code[1,i]:=ord(khoa[i])-48;
      code[2,ord(khoa[i])-48]:=i;
    end;
  out:='';
  for i:=1 to max do out:=out+' ';
  write('Nhap xau can ma hoa : ');
  readln(s[1]);
  write('Nhap xau can giai ma : ');
  readln(s[2]);
  clrscr;
  writeln('Xau ban dau : ',s[1]);
  write('Xau ma hoa : ');
  mahoa(s[1],1);
  writeln;
  writeln('Xau ban dau : ',s[2]);
  write('Xau giai ma : ');
  mahoa(s[2],2);
  readln;
end.