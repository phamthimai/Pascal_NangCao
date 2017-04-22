program bai7;
uses crt;
const khoa=1;
var s1,s2:string;
    i:byte;
(*--*)
begin
  clrscr;
  write('Nhap xau ki tu can ma hoa : ');
  readln(s1);
  write('Nhap xau ki tu can giai ma : ');
  readln(s2);
  clrscr;
  writeln('Ma hoa cua "',s1,'" la :');
  for i:=1 to length(s1) do
    if s1[i] in ['A'..'Z'] then
       s1[i]:=chr((((ord(s1[i])-39)+khoa) mod 26)+65) else
    if s1[i] in ['a'..'z'] then
       s1[i]:=chr((((ord(s1[i])-71)+khoa) mod 26)+97);
  writeln(s1);
  writeln('Giai ma cua "',s2,'" la :');
  for i:=1 to length(s2) do
    if s2[i] in ['A'..'Z'] then
       s2[i]:=chr((((ord(s2[i])-39)-khoa) mod 26)+65) else
    if s2[i] in ['a'..'z'] then
       s2[i]:=chr((((ord(s2[i])-71)-khoa) mod 26)+97);
  writeln(s2);
  readln;
end.