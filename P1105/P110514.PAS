Program P110514;     {Khen thuong va len lop}
Uses Crt;
Type Danhsach=record
	            	holot: string[25];
		           	ten: string[10];
			          tuoi: 0..99;
			          lop: string[3];
                diem: real;
		          end;
Var  ds: array [1..100] of Danhsach;
     f: file of Danhsach;
     n: integer;

Procedure Nhap;
Begin
 Assign(f,'P110514.DAT'); Reset(f);
 n:=0;
 While not Eof(f) do
 begin
   n:=n+1; Read(f,ds[n]);
 end;
 Close(f);
End;

Procedure Timgioi;
Var i: integer;
    max10,max11,max12: real;
    l: string;
Begin
 max10:=0; max11:=0; max12:=0;
 For i:=1 to n do With ds[i] do
 begin
   l:=copy(lop,1,2);
   If (l='10')and(diem>max10)and(diem>8.0) then max10:=diem
   Else If (l='11')and(diem>max11)and(diem>8.0) then max11:=diem
        Else If (l='12')and(diem>max12)and(diem>8.0) then max12:=diem;
 end;
 Writeln('Hoc sinh gioi nhat khoi 10 : ');
 For i:=1 to n do With ds[i] do
   If (copy(lop,1,2)='10')and(diem>=max10) then
     Writeln(holot:20,ten:10,tuoi:4,lop:5,diem:5:1);
 Writeln('Hoc sinh gioi nhat khoi 11 : ');
 For i:=1 to n do With ds[i] do
   If (copy(lop,1,2)='11')and(diem>=max11) then
     Writeln(holot:20,ten:10,tuoi:4,lop:5,diem:5:1);
 Writeln('Hoc sinh gioi nhat khoi 12 : ');
 For i:=1 to n do With ds[i] do
   If (copy(lop,1,2)='12')and(diem>=max12) then
     Writeln(holot:20,ten:10,tuoi:4,lop:5,diem:5:1);
End;

Procedure Lenlop;
Var i: integer;
    l: string;
    f: file of Danhsach;
Begin
 For i:=1 to n do With ds[i] do
 begin
   l:=copy(lop,1,2);
   If (l='10')and(diem>=5.0) then lop:='11'+lop[3]
   Else If (l='11')and(diem>=5.0) then lop:='12'+lop[3]
        Else If (l='12')and(diem>=5.0) then lop:='DTN';
 end;
 Assign(f,'P110514N.DAT'); Rewrite(f);
 For i:=1 to n do With ds[i] do
   If lop<>'DTN' then Write(f,ds[i]);
 Close(f);
End;

BEGIN
 ClrScr;
 Nhap;
 Timgioi;
 Lenlop;
 Write('Bam ENTER de ket thuc...');
 Readln;
END.