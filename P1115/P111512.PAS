Program P111512;
Uses Crt;
Const
      inp='P11\1512.inp';
      ran='P11\ran.inp';
Var
      f:text;
      n,d1,d2,c1,c2:byte;
      hcn,max:integer;
      a:array[1..50,1..50]of byte;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to 2*n do
 begin
   For j:=1 to 2*n do Read(f,a[i,j]);
   Readln(f);
 end;
 Close(f);
End;

Function Dung:boolean;
Var i,j: byte;
    dong,cot:array[1..50]of byte;
Begin
 FillChar(dong,Sizeof(dong),0);
 FillChar(cot,Sizeof(cot),0);
 For i:=1 to 2*n do
 For j:=1 to 2*n do
 If a[i,j]=1 then
 begin
   Inc(dong[i]);
   Inc(cot[j]);
 end;
 Dung:=false;
 For i:=1 to 2*n do
 If (dong[i]<>2)or(cot[i]<>2) then exit;
 Dung:=true;
End;

Procedure Sinh;
Var i,j,vtd,vtc,d1,d2,tg:byte;
    t:integer;
    kt:array[1..50,1..2]of byte;
Begin
 Randomize;
 Writeln('Ket qua bang ngau nhien o trong file ',ran);
 Write('Cho N (khong qua 25): ');readln(n);
 FillChar(a,Sizeof(a),0);
 kt[1,1]:=1; kt[1,2]:=2*n;
 For i:=2 to 2*n do
 begin
   kt[i,1]:=i-1;
   kt[i,2]:=i;
 end;
 For t:=1 to 5000 do
 begin
   vtd:=random(2*n)+1;
   Repeat vtc:=random(2*n)+1; Until vtc<>vtd;
   If (kt[vtd,1]<>kt[vtc,1])and(kt[vtd,2]<>kt[vtc,1])and
      (kt[vtd,1]<>kt[vtc,2])and(kt[vtd,2]<>kt[vtc,2]) then
   begin
     d1:=random(2)+1;
     d2:=random(2)+1;
     tg:=kt[vtd,d1];
     kt[vtd,d1]:=kt[vtc,d2];
     kt[vtc,d2]:=tg;
   end;
 end;
 For i:=1 to 2*n do
 begin
   a[kt[i,1],i]:=1;
   a[kt[i,2],i]:=1;
 end;
 Assign(f,ran);Rewrite(f);
 Writeln(f,n);
 For i:=1 to 2*n do
 begin
   For j:=1 to 2*n do Write(f,a[i,j]:2);
   Writeln(f);
 end;
 Readln;
 Close(f);
End;

Procedure Hoi_dap;
Var c: char;
Begin
 Repeat
 Writeln('Lua chon');
 Writeln('1. Nhap bang vuong tu file ',inp);
 Writeln('2. Sinh bang vuong ngau nhien');
 c:=readkey;
 Until (c='1')or(c='2');
 Case c of
   '1':Nhap;
   '2':Sinh;
 end;
End;

Procedure Tim_vtd(i:byte;var vtd:byte);
Var j: byte;
Begin
 For j:=1 to 2*n do
 If a[i,j]=1 then
 begin
   vtd:=j;
   exit;
 end;
End;

Procedure Tim_vtc(i:byte;var vtc:byte);
Var j: byte;
Begin
 For j:=1 to 2*n do
 If a[j,i]=1 then
 begin
   vtc:=j;
   exit;
 end;
End;

Procedure Tim_duong;
Var i,t,vtd,vtc: byte;
Begin
 For i:=1 to 2*n do
 begin
   Tim_vtd(i,vtd);
   t:=vtd+1;
   While a[i,t]=0 do
   begin
     a[i,t]:=2;
     Inc(t);
   end;
   Tim_vtc(i,vtc);
   t:=vtc+1;
   While a[t,i]=0 do
   begin
     a[t,i]:=2;
     Inc(t);
   end;
 end;
End;

Function Ok(i1,j1,i2,j2:byte):boolean;
Var i,j: byte;
Begin
 Ok:=false;
 For i:=i1 to i2 do
 If (a[i,j1]=0)or(a[i,j2]=0) then exit;
 For j:=j1 to j2 do
 If (a[i1,j]=0)or(a[i2,j]=0) then exit;
 Ok:=true;
End;

Procedure Tim_hcn;
Var i1,i2,j1,j2: byte;
Begin
 ClrScr;
 max:=0;
 Writeln('Cac hinh chu nhat tim duoc (duoi dang toa do dinh trai tren, phai duoi):');
 For i1:=1 to 2*n-1 do
 For j1:=1 to 2*n-1 do
 If (a[i1,j1]<>0)and(a[i1,j1+1]<>0)and(a[i1+1,j1]<>0) then
 For i2:=i1+1 to 2*n do
 For j2:=j1+1 to 2*n do
 If (a[i2,j2]<>0)and(a[i2-1,j2]<>0)and(a[i2,j2-1]<>0) then
 If ok(i1,j1,i2,j2) then
 begin
   Inc(hcn);
   Writeln('[',i1,',',j1,'] - [',i2,',',j2,']');
   If max<(i2-i1+1)*(j2-j1+1) then
   begin
     max:=(i2-i1+1)*(j2-j1+1);
     d1:=i1; d2:=i2;
     c1:=j1; c2:=j2
   end;
 end;
 Writeln('Tong so cac hinh chu nhat tim duoc: ',hcn);
 Writeln('Hinh chu nhat lon nhat co dien tich ',max,' va toa do cua no: ');
 Writeln('     [',d1,',',c1,'] - [',d2,',',c2,']');
End;

BEGIN
 ClrScr;
 Hoi_dap;
 If Dung then
 begin
   Tim_duong;
   Tim_hcn;
 end
 Else Writeln('Du lieu khong dung dan');Readln;
END.
5
1 0 1 0 0
0 1 0 1 0
0 1 1 0 0
1 0 0 1 0
0 0 0 0 1
