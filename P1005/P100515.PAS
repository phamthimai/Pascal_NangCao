Program P100515;  {Tim Hinh chu nhat co dien tich lon nhat}
Uses Crt;
Var  f: text;
     m,n,d1,d2,c1,c2: byte;
     max: integer;
     a: array[1..100,1..100] of 0..1;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,'INP.TXT');
 Reset(f);
 Readln(f,m,n);
 For i:=1 to m do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
End;

Function thoa_man(i1,j1,i2,j2: byte): boolean;
Var i,j: byte;
Begin
 thoa_man:=false;
 For i:=i1 to i2 do
   For j:=j1 to j2 do
     If a[i,j]=1 then exit;
 thoa_man:=true;
End;

Procedure Xu_ly;
Var i1,j1,i2,j2: byte;
Begin
 max:=0;
 For i1:=1 to m do
   For j1:=1 to n do
     If a[i1,j1]=0 then
       For i2:=i1 to m do
         For j2:=j1 to n do
           If a[i2,j2]=0 then
             If thoa_man(i1,j1,i2,j2) then
               If max<(abs(i2-i1+1)*abs(j2-j1+1)) then
               begin
                 max:=abs(i2-i1+1)*abs(j2-j1+1);
                 d1:=i1; d2:=i2;
                 c1:=j1; c2:=j2;
               end;
 Writeln('Hinh chu nhat toan so 0 co dien tich lon nhat la: ',max);
 Writeln('Toa do trai tren: ',d1,' ',c1);
 Writeln('Toa do phai duoi: ',d2,' ',c2);
End;

BEGIN
 ClrScr;
 Nhap;
 Xu_ly;
 Readln;
END.