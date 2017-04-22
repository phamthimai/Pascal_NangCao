Program  P101102;   {Chuong trinh tinh ma tran nghich dao}
Uses Crt;
Var  d: real;i,j:byte;
     a: array [1..2,1..2] of real;

Begin
 ClrScr;
 Writeln('Nhap ma tran A');
 For i:=1 to 2 do
 begin
   For j:=1 to 2 do Read(a[i,j]);
   Readln;
 end;
 d:=a[1,1]*a[2,2]-a[1,2]*a[2,1];
 Writeln('Ma tran nghich dao:');
 Writeln(a[2,2]/d:8:2, -a[2,1]/d:8:2);
 Writeln(-a[1,2]/d:8:2, a[1,1]/d:8:2);
 Readln;
END.