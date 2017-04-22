program bai13;
uses crt;
var i,j,max,l:word;
    code:array[1..9] of byte;
    dl:array[1..300] of char;
    s:array[1..2] of string;
    khoa,tam,out:string;
(*--*)
procedure mahoa(xau:string);
 begin
   for i:=1 to length(xau) do dl[i]:=xau[i];
   l:=length(xau);
   for i:=1 to max-(length(xau) mod max) do dl[l+i]:=' ';
   inc(l,max-(length(xau) mod max));
   for i:=1 to l div max do
     begin
       tam:='';
       for j:=1 to max do tam:=tam+dl[(i-1)*max+j];
       for j:=1 to max do out[j]:=tam[code[j]];
       write(out);
     end;
 end;
(*--*)
begin
  khoa:='3241';
  max:=4;
  for i:=1 to max do code[i]:=ord(khoa[i])-48;
  out:='';
  for i:=1 to max do out:=out+' ';
  s[1]:='I am a girl';
  s[2]:='I am a student';
  clrscr;
  writeln('Xau ban dau : ',s[1]);
  write('Xau ma hoa : ');
  mahoa(s[1]);
  writeln;
  writeln('Xau ban dau : ',s[2]);
  write('Xau giai ma : ');
  mahoa(s[2]);
  readln;
end.