program bai19;
uses crt;
const max=100;
var i,j,n:word;
    tam:integer;
    x,y:array[1..max+1] of real;
    a,b,c:real;
    ok1,ok2:boolean;
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
function cat(cs1,cs2:word):boolean;
 begin
   timdt(cs1,cs1+1);
   if f(cs2)*f(cs2+1)<0 then
     begin
       timdt(cs2,cs2+1);
       if f(cs1)*f(cs1+1)<0 then
         begin
           cat:=true;
           exit;
         end;
     end;
   cat:=false;
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
  repeat
    clrscr;
    write('Co bao nhieu diem : ');
    readln(n);
  until n>2;
  for i:=1 to n do
    begin
      write('Nhap toa do diem thu ',i,' : ');
      readln(x[i],y[i]);
    end;
  x[n+1]:=x[1];
  y[n+1]:=y[1];
  ok1:=true;
  for i:=1 to n-1 do
    begin
      for j:=i+1 to n do
        if cat(i,j) then
          begin
            ok1:=false;
            break;
          end;
      if not ok1 then break;
    end;
  if not ok1 then ok2:=false else
    begin
      ok2:=true;
      for i:=1 to n-1 do
        if not dung(i,i+1) then
          begin
            ok2:=false;
            break;
          end;
      if not dung(1,n) then ok2:=false;
    end;
  clrscr;
  if ok1 then writeln('Da giac khong tu cat') else
              writeln('Da giac co tu cat');
  if ok2 then writeln('Da giac la da giac loi') else
              writeln('Da giac khong phai la da giac loi');
  readln;
end.