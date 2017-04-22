Program P121505;   {Da bong thieu tinh than thi dau}
Uses  Crt;
Const Inp = 'Inp.txt';
      Out = 'Out.txt';
      Nmax= 21;
      Diem: array [1..3] of shortint = (0,1,3);
      DiemNguoc: array [1..3] of shortint = (0,3,1);
Var   f: text;
      n: byte;
      ThuTu: longint;
      st: string;
      a,Luu: array [1..Nmax,1..Nmax] of shortint;

Procedure Chuyen(i: byte);
Var j,k: byte; so: string; c: integer;
Begin
 st:=st+' ';
 k:=1;
 For j:=1 to n+1 do
 begin
   While st[k]=' ' do Inc(k);
   so:='';
   While st[k]<>' ' do
   begin
     so:=so+st[k];
     Inc(k);
   end;
   If so='?' then a[i,j]:=-1 Else Val(so,a[i,j],c);
 end;
End;

Procedure Nhap;
Var i: byte;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to n do
 begin
   Readln(f,st);
   Chuyen(i);
 end;
 Close(f);
End;

Procedure LoaiBot1;
Var i,j: byte;
Begin
 For i:=1 to n do
   For j:=1 to n do
     If a[i,j]=-1 then
       Case a[j,i] of
         0: a[i,j]:=0;
         1: a[i,j]:=3;
         3: a[i,j]:=1;
       End;
End;

Procedure LoaiBot2;
Var i,j: byte;
Begin
 Luu:=a;
 For i:=1 to n do
   If a[i,n+1]<>-1 then
   For j:=1 to n do
     If a[i,j]<>-1 then a[i,n+1]:=a[i,n+1]-a[i,j];
 ThuTu:=0;
End;

Procedure GhiNhan;
Var i,j,s: integer;
Begin
 Inc(ThuTu);
 Writeln(f,ThuTu);
 For i:=1 to n do
 begin
   s:=0;
   For j:=1 to n do
   begin
     Write(f,a[i,j]:3);
     s:=s+a[i,j];
   end;
   Writeln(f,s:3);
 end;
End;

Procedure Try(i,j: byte);
Var k: byte;
Begin
 If i=n then
 begin
   GhiNhan;
   exit;
 end;
 If j=n+1 then
 begin
   If a[i,j]>0 then exit;
   try(i+1,i+2);
   exit;
 end;
 If Luu[i,j]<>-1 then
 begin
   try(i,j+1);
   exit;
 end;
 For k:=1 to 3 do
   If a[i,n+1]>=0 then
   begin
     If Diem[k]<=a[i,n+1] then
     begin
       a[i,j]:=Diem[k];
       a[j,i]:=DiemNguoc[k];
       a[i,n+1]:=a[i,n+1]-Diem[k];
       a[j,n+1]:=a[j,n+1]-DiemNguoc[k];
       try(i,j+1);
       a[i,n+1]:=a[i,n+1]+Diem[k];
       a[j,n+1]:=a[j,n+1]+DiemNguoc[k];
     end;
   end
   Else
   begin
     a[i,j]:=Diem[k];
     a[j,i]:=DiemNguoc[k];
     a[i,n+1]:=a[i,n+1]-Diem[k];
     a[j,n+1]:=a[j,n+1]-DiemNguoc[k];
     try(i,j+1);
     a[i,n+1]:=a[i,n+1]+Diem[k];
     a[j,n+1]:=a[j,n+1]+DiemNguoc[k];
   end;
End;

Procedure XuLy;
Begin
 LoaiBot1;
 LoaiBot2;
 Assign(f,out); ReWrite(f);
 Try(1,1);
 If ThuTu=0 then GhiNhan;
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 XuLy;
END.