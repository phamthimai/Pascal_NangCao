program bai11;
uses crt;
const max=100;
var i,j,n,sd:word;
    x,y:array[1..max] of real;
    a,b,c:real;
(*--*)
procedure gan(am,bm,cm:real);
 begin
   a:=am;
   b:=bm;
   c:=cm;
 end;
(*--*)
procedure timdt(cs1,cs2:word);
 begin
   if x[cs1]=x[cs2] then
     begin
       gan(-1,0,x[cs1]);
       exit;
     end;
   if y[cs1]=y[cs2] then
     begin
       gan(0,-1,y[cs1]);
       exit;
     end;
   a:=1;
   b:=(x[cs1]-x[cs2])/(y[cs2]-y[cs1]);
   c:=-x[cs1]-b*y[cs1];
 end;
(*--*)
function f(cs:word):real;
 begin
   f:=a*x[cs]+b*y[cs]+c;
 end;
(*--*)
function ok(cs1,cs2:word):boolean;
 var f1,f2,i:word;
  begin
    f1:=0;
    f2:=0;
    for i:=1 to n do
      if (i<>cs1) and (i<>cs2) then
        if f(i)<0 then inc(f1) else
        if f(i)>0 then inc(f2);
    ok:=f1=f2;
  end;
(*--*)
begin
  repeat
    clrscr;
    write('Co bao nhieu diem : ');
    readln(n);
  until not odd(n);
  for i:=1 to n do
    begin
      write('Nhap toa do diem thu ',i,' : ');
      readln(x[i],y[i]);
    end;
  sd:=0;
  for i:=1 to n-1 do
    for j:=i+1 to n do
      begin
        timdt(i,j);
        if ok(i,j) then inc(sd);
      end;
  clrscr;
  write('Co ',sd,' duong trung binh');
  readln;
end.