Program P110515;   {Tim kiem tren ban ghi}
Uses Crt;
Type Danhsach=record
		            Tacgia: string[26];
		            Tensach: string[40];
		            NamXB: integer;
		          end;
Var  ds: array [1..100] of Danhsach;
     n: integer;
     f: file of Danhsach;
     M: Danhsach;

Procedure Nhap;
Begin
 n:=0;
 Assign(f,'P11\P1105\P110515.DAT'); Reset(f);
 While not Eof(f) do
 begin
   Inc(n); Read(f,ds[n]);
 end;
 Close(f);
End;

Procedure TheoTG;
Var tacgia: string;
    namXB: integer;
    i: integer;
Begin
 Write('Cho ten tac gia   : '); Readln(M.tacgia);
 Write('Cho nam xuat ban  : '); Readln(M.NamXB);
 i:=1;
 While (i<=n)and((ds[i].tacgia<>tacgia)or(ds[i].namXB<>namXB)) do i:=i+1;
 If (i>n) then Writeln('Khong tim duoc')
 Else Writeln(ds[i].tacgia:28,ds[i].tensach:42,ds[i].namXB:6);
End;

Procedure TheoTS;
Var ten: string;
    i: integer;
Begin
 Write('Cho ten sach : '); Readln(ten);
 i:=1;
 While (i<=n)and(ds[i].tensach<>ten) do i:=i+1;
 If (i>n) then Writeln('Khong tim duoc')
 Else Writeln(ds[i].tacgia:28,ds[i].tensach:42,ds[i].namXB:6);
End;

Procedure Timkiem;
Var c:char;
Begin
 Writeln('1. Tim kiem theo tac gia va nam xuat ban.');
 Writeln('2. Tim kiem theo ten sach');
 Writeln;
 Write('Ban chon [1/2] : ');
 Repeat
   c:=Readkey;
 Until pos(c,'12')>0;
 Writeln(c);
 If c='1' then TheoTG Else TheoTS;
End;

BEGIN
 ClrScr;
 Nhap;
 Timkiem;
 Write('Ban Enter de ket thuc...');
 Readln;
END.