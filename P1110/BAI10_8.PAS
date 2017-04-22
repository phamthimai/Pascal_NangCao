program bai8;
uses crt;
const max=25;
var i,j,k,vt:byte;
    a,b:array[1..max] of real;
    d,c,ct:real;
    ok,found:boolean;
(*--*)
function chung(a1,b1,a2,b2:real;var a3,b3:real):boolean;
 begin
   if (a1<=a2) and (a2<=b1) then
     begin
       a3:=a2;
       if b2<=b1 then b3:=b2 else b3:=b1;
       chung:=true;
     end else
   if (a2<=a1) and (a1<=b2) then
     begin
       a3:=a1;
       if b2<=b1 then b3:=b2 else b3:=b1;
       chung:=true;
     end else chung:=false;
 end;
(*--*)
procedure timhop;
 begin
   d:=a[1];
   c:=b[1];
   ct:=b[1];
   for i:=2 to max do
     begin
       if d>a[i] then
         begin
           d:=a[i];
           ct:=b[i];
         end;
       if c<b[i] then c:=b[i];
     end;
   found:=true;
   vt:=1;
   while found do
     begin
       found:=false;
       for i:=vt to max do
         if (a[i]<ct) and (b[i]>ct) then
           begin
             found:=true;
             ct:=b[i];
             vt:=i+1;
             break;
           end;
     end;
   ok:=ct=c;
 end;
(*--*)
function dung(d1,d2,d3:byte):boolean;
 begin
   if chung(a[d1],b[d1],a[d2],b[d2],d,c) and chung(d,c,a[d3],b[d3],d,c) then
      dung:=true else dung:=false;
 end;
(*--*)
begin
  for i:=1 to max do
    begin
      repeat
        clrscr;
        write('Nhap khoang thu ',i,' (a,b) = ');
        readln(a[i],b[i]);
        if a[i]>=b[i] then
          begin
            write('Du lieu khong hop le');
            readln;
          end;
      until a[i]<b[i];
    end;
  d:=a[1];
  c:=b[1];
  ok:=true;
  for i:=2 to max do
    if (d=c) or not chung(d,c,a[i],b[i],d,c) then
      begin
        ok:=false;
        break;
      end;
  if d=c then ok:=false;
  clrscr;
  if ok then writeln('Co khoang thuoc tat ca khoang tren la : (',d:5:2,',',c:5:2,')') else
             writeln('Khong co diem thuoc tat ca khoang tren');
  timhop;
  if ok then writeln('Hop cac doan tren la : (',d:5:2,',',c:5:2,')') else
             writeln('Cac doan tren khong hop thang 1 khoang nao ca');
  found:=false;
  for i:=1 to max-2 do
    begin
      for j:=i+1 to max-1 do
        begin
          for k:=j+1 to max do
            if dung(i,j,k) then
              begin
                write('Doan ',i:3,j:3,k:3,' co chung khoang la: ( ',d:5:2,',',c:5:2,')');
                found:=true;
                break;
              end;
          if found then break;
        end;
      if found then break;
    end;
  if not found then write('Khong co 3 doan nao co diem chung');
  readln;
end.