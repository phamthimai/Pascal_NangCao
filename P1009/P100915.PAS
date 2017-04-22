Program P100815;
uses Crt, Graph;
var
 Gd, Gm, i, j, c: Integer;
 a: array [1..26] of string;
 f: text;
begin
 assign(f,'p100915.txt');
 reset(f);
 c:=1;
 while not eof(f) do
 begin
   readln(f,a[c]);
   inc(c);
 end;
 close(f);
 Gd := Detect;
 InitGraph(Gd, Gm, '');
 for c:=1 to 26 do
   for i:=1 to 16 do
     for j:=1 to 8 do putpixel(c*20+j,i,ord(a[c,(i-1)*8+j])-49);
 Readln;
 CloseGraph;
end.

