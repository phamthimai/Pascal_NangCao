Program P110506;  {Nhap danh sach hoc sinh tu ban phim}
Uses  Crt;
Const n=15;
Type  Danhsach=record
	               holot: string[25];
		             ten: string[10];
	             	 tuoi: 0..99;
			           lop: string[3];
               end;
Var   ds: array [1..n] of Danhsach;
      i: byte;

BEGIN
 ClrScr;
 Writeln('Hay nhap danh sach hoc sinh : ');
 Writeln;
 For i:=1 to n do
 begin
   Writeln('Thong tin hoc sinh thu ',i);
   Write('Cho ho lot : '); Readln(ds[i].holot);
   Write('Cho ten    : '); Readln(ds[i].ten);
	 Write('Cho tuoi   : '); Readln(ds[i].tuoi);
	 Write('Cho lop    : '); Readln(ds[i].lop);
   Writeln;
 end;
 Writeln('Danh sach hoc sinh  :');
 For i:=1 to n do
   With ds[i] do Writeln(holot:20,ten:10,tuoi:4,lop:5);
 Writeln;
 Write('Bam Enter de ket thuc...');
 Readln;
END.