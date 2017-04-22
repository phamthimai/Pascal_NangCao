program bai13;
uses crt;
var i,j,l,d,c:word;
    s1,s2:string;
    a:array[1..20,1..20] of char;
(*--*)
procedure gan1(ch:char);
 begin
   if (c=l) then
     begin
       c:=1;
       inc(d);
     end else inc(c);
   a[d,c]:=ch;
 end;
(*--*)
procedure gan2(ch:char);
 begin
   if (d=l) then
     begin
       d:=1;
       inc(c);
     end else inc(d);
   a[d,c]:=ch;
 end;
(*--*)
begin
  clrscr;
  write('Nhap xau can ma hoa : ');
  readln(s1);
  write('Nhap xau can giai ma : ');
  readln(s2);
  clrscr;
  l:=trunc(sqrt(length(s1)));
  if l*l<length(s1) then inc(l);
  d:=1;
  c:=0;
  for i:=1 to length(s1) do gan1(s1[i]);
  for i:=1 to l*l-length(s1) do gan1(' ');
  writeln('Xau ban dau : ',s1);
  write('Xau ma hoa : ');
  for i:=1 to l do
    for j:=1 to l do write(a[j,i]);
  writeln;
  l:=trunc(sqrt(length(s2)));
  if l*l<length(s2) then inc(l);
  d:=0;
  c:=1;
  for i:=1 to length(s2) do gan2(s2[i]);
  for i:=1 to l*l-length(s2) do gan2(' ');
  writeln('Xau ban dau : ',s2);
  write('Xau ma hoa : ');
  for i:=1 to l do
    for j:=1 to l do write(a[i,j]);
  readln;
end.