program bai5;
uses crt;
var i,j,sl,dau:byte;
    s,sx,tu:string;
    d,l:array[1..300] of byte;
    co:boolean;
(*--*)
procedure laytu;
 begin
   co:=false;
   while (dau<=length(s)) and (s[dau]=' ') do inc(dau);
   if dau>length(s) then exit;
   co:=true;
   inc(sl);
   d[sl]:=dau;
   l[sl]:=0;
   while (dau<=length(s)) and (s[dau]<>' ') do
     begin
       inc(l[sl]);
       inc(dau);
     end;
 end;
(*--*)
procedure kiemtra;
 begin
   tu:=copy(s,d[sl],l[sl]);
   if sl=1 then sx:=chr(1) else
     for i:=1 to length(sx) do
       begin
         if tu<copy(s,d[ord(sx[i])],l[ord(sx[i])]) then
           begin
             insert(chr(sl),sx,i);
             break;
           end;
         sx:=sx+chr(sl);
       end;
 end;
(*--*)
begin
  clrscr;
  write('Nhap doan van ban can sap xep : ');
  readln(s);
  sx:='';
  sl:=0;
  dau:=1;
  while dau<=length(s) do
    begin
      laytu;
      if co then kiemtra;
      if dau=length(s) then break;
    end;
  clrscr;
  writeln('Co ',sl,' tu da duoc sap xep :');
  for i:=1 to sl do
    begin
      if (i mod 20)=0 then clrscr;
      writeln(copy(s,d[ord(sx[i])],l[ord(sx[i])]));
      if ((i mod 20)=1) and (i>1) then readln;
    end;
  if not (((i mod 20)=1) and (i>1)) then readln;
end.