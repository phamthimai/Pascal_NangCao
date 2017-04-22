Program P111008;   {n khoang}
Uses  Crt;
Const max=3;
Var   i,j,k,vt: byte;
      a,b: array [1..max] of real;
      d,c,ct: real;
      ok,found: boolean;

Function Chung(a1,b1,a2,b2: real; Var a3,b3: real): boolean;
{Tim diem thuoc tat ca cac diem con lai}
Begin
 If (a1<=a2)and(a2<=b1) then
   begin
     a3:=a2;
     If b2<=b1 then b3:=b2 Else b3:=b1;
     chung:=true;
   end
 Else
   If (a2<=a1)and(a1<=b2) then
     begin
       a3:=a1;
       If b2<=b1 then b3:=b2 Else b3:=b1;
       chung:=true;
     end
   Else Chung:=false;
End;

Procedure Timhop;
{Hop tat ca cac khoang co phai la mot khoang khong}
Begin
 d:=a[1];
 c:=b[1];
 ct:=b[1];
 For i:=2 to max do
 begin
   If d>a[i] then
   begin
     d:=a[i];
     ct:=b[i];
   end;
   If c<b[i] then c:=b[i];
 end;
 Found:=true;
 vt:=1;
 While Found do
 begin
   Found:=false;
   For i:=vt to max do
     If (a[i]<ct) and (b[i]>ct) then
     begin
       Found:=true;
       ct:=b[i];
       vt:=i+1;
       break;
     end;
 end;
 Ok:=ct=c;
End;

Function Dung(d1,d2,d3: byte): boolean;
Begin
 If chung(a[d1],b[d1],a[d2],b[d2],d,c)and chung(d,c,a[d3],b[d3],d,c)
   then Dung:=true Else Dung:=false;
End;

BEGIN
 For i:=1 to max do
   Repeat
     Clrscr;
     Write('Nhap khoang thu ',i,' (a,b) = ');
     Readln(a[i],b[i]);
     If a[i]>=b[i] then
     begin
       Write('Du lieu khong hop le.');
       Readln;
     end;
   Until a[i]<b[i];
 d:=a[1];
 c:=b[1];
 Ok:=true;
 For i:=2 to max do
   If (d=c) or not Chung(d,c,a[i],b[i],d,c) then
   begin
     Ok:=false;
     break;
   end;
 If d=c then Ok:=false;
 Clrscr;
 If Ok then Writeln('Co khoang thuoc tat ca khoang tren la: (',d:5:2,',',c:5:2,')')
 Else Writeln('Khong co diem nao thuoc tat ca khoang tren.');
 Timhop;
 If Ok then Writeln('Hop cac doan tren la : (',d:5:2,',',c:5:2,')')
 Else Writeln('Cac doan tren khong hop thanh 1 khoang nao ca.');
 Found:=false;
 For i:=1 to max-2 do
 begin
   For j:=i+1 to max-1 do
   begin
     For k:=j+1 to max do
       If dung(i,j,k) then
       begin
         Write('Doan ',i:3,j:3,k:3,' co chung khoang la: (',d:5:2,',',c:5:2,')');
         Found:=true;
         break;
       end;
     If found then break;
   end;
   If found then break;
 end;
 If not found then Write('Khong co 3 doan nao co diem chung.');
 Readln;
END.