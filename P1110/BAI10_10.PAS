program bai10;
uses crt;
const max=100;
var i,n:word;
    tam:integer;
    x,y:array[1..max] of real;
    ok:array[1..max] of boolean;
    lk:array[1..max] of word;
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
procedure tim(cs:word);
 var i:word;
  begin
    ok[cs]:=true;
    for i:=1 to cs-1 do
      if lk[i]<cs then
        if dung(cs,i) then
          begin
            lk[cs]:=i;
            exit;
          end;
    for i:=cs+1 to n do
      if dung(cs,i) then
        begin
          lk[cs]:=i;
          ok[i]:=true;
          exit;
        end;
    ok[cs]:=false;
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
  fillchar(ok,sizeof(ok),false);
  fillchar(lk,sizeof(lk),0);
  clrscr;
  for i:=1 to n do
    if not ok[i] then
      begin
        tim(i);
        if not ok[i] then
          begin
            write(n,' diem da cho khong thoa man dieu kien');
            readln;
            halt;
          end;
      end;
  write(n,' diem da cho thoa man dieu kien');
  readln;
end.