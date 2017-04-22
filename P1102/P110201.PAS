Program P110201;   {Tao mang danh sach}
Uses  Crt;
Const max=100;
Var   i,n: byte;
      ten,holot: array [1..max] of string[20];
      lop: array [1..max] of string[5];
      danhsach: array [1..max] of string[45];

Procedure Nhap;
Var i: integer; f: text;
Begin
 Assign(f,'HODEM.TXT'); Reset(f);
 n:=0;
 While not EoF(f) do
 begin
   Inc(n);
   Readln(f,holot[n]);
 end;
 Close(f);
 Assign(f,'TEN.TXT'); Reset(f);
 For i:=1 to n do Readln(f,ten[i]);
 Close(f);
 Assign(f,'LOP.TXT'); Reset(f);
 For i:=1 to n do Readln(f,lop[i]);
 Close(f);
End;

Procedure Xuat;
Var i: integer;
Begin
 For i:=1 to n do Writeln(danhsach[i]);
End;

BEGIN
 Nhap;
 For i:=1 to n do danhsach[i]:=holot[i]+' '+ten[i]+' '+lop[i];
 ClrScr;
 Xuat;
 Readln;
END.