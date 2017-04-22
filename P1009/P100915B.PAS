Program p100815bis1;
uses Crt, Graph;
var
 Gd, Gm, m, n, i, j, t: Integer;
 a: array ['a'..'z',1..16] of char;
 f: text;
 c,ch: char;
 s: string;
begin
 clrscr;
 assign(f,'p100915.txt');
 reset(f);
 c:='a';
 repeat
   readln(f,s);
   for i:=1 to 16 do
   begin
     t:=0;
     for j:=1 to 8 do t:=t*2+ord(s[(i-1)*8+j])-48;
     a[c,i]:=chr(t);
   end;
   inc(c);
 until eof(f);
 ch:=pred(c);
 Gd := Detect;
 InitGraph(Gd, Gm, '');
 if GraphResult <> grOk then
   Halt(1);
 c:='b';
   for i:=1 to 16 do
   begin
     t:=ord(a[c,i]);
     for j:=1 to 8 do
     begin
       putpixel(j+100,i+100,t mod 2);
       t:=t div 2;
     end;
   end;
 Readln;
 CloseGraph;
end.

