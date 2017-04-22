program bai20;
uses crt;
const max=100;
var i,j,n,l:word;
    tam:integer;
    x,y:array[1..max] of real;
    d:array[1..max] of word;
    cx:array[1..max] of boolean;
    a,b,c:real;
    found,stop:boolean;
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
function dung(cs1,cs2:word):boolean;
 var i:word;
  begin
    timdt(cs1,cs2);
    tam:=0;
    for i:=1 to n do
      if (i<>cs1) and (i<>cs2) then
        begin
          if f(i)<0 then tam:=-1 else tam:=1;
          break;
        end;
    for i:=1 to n do
      if (i<>cs1) and (i<>cs2) then
        if f(i)*tam<0 then
          begin
            dung:=false;
            exit;
          end;
    dung:=true;
  end;
(*--*)
begin
  clrscr;
  write('Co bao nhieu diem : ');
  readln(n);
  for i:=1 to n do
    begin
      write('Nhap toa do diem thu ',i,' : ');
      readln(x[i],y[i]);
    end;
  found:=false;
  fillchar(cx,sizeof(cx),true);
  for i:=1 to n-1 do
    begin
      for j:=i+1 to n do
        if dung(i,j) then
          begin
            l:=2;
            d[1]:=i;
            d[2]:=j;
            cx[i]:=false;
            cx[j]:=false;
            found:=true;
            break;
          end;
      if found then break;
    end;
  stop:=false;
  while not stop do
    begin
      stop:=true;
      for i:=1 to n do
        if cx[i] and dung(d[l],i) then
          begin
            stop:=false;
            inc(l);
            d[l]:=i;
            cx[i]:=false;
          end;
    end;
  clrscr;
  writeln('Da giac loi chua tat ca co ',l,' dinh la cac dinh : ');
  for i:=1 to l do
    begin
      write(d[i]:5);
      if i mod 10=0 then writeln;
    end;
  readln;
end.