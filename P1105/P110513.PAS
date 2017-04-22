Program P110513;  {Doi kieu ban ghi}
Uses Crt;
Type Danhsach1=record
                 holot: string[25];
               	 ten: string[10];
		             tuoi: 0..99;
			           lop: string[3];
		           end;
     Danhsach2=record
			           hoten: string[35];
			           tuoi: byte;
 			           khoi: byte;
			           lop: char;
		           end;

Var  ds1: Danhsach1;
     ds2: Danhsach2;
     f1: file of Danhsach1;
     f2: file of Danhsach2;
     c: integer;

BEGIN
 ClrScr;
 Writeln('Ghi tu file P110513.DAT sang P110513N.DAT:');
 Writeln;
 Assign(f1,'P110513.DAT');  Reset(f1);
 Assign(f2,'P110513N.DAT'); Rewrite(f2);
 While not Eof(f1) do
 begin
   Read(f1,ds1);
   With ds1 do
   begin
     ds2.hoten:=holot+ten;
     val(copy(lop,1,2),ds2.khoi,c);
     ds2.tuoi:=tuoi;
     ds2.lop:=UpCase(lop[3]);
     Write(f2,ds2);
   end;
 end;
 Close(f1); Close(f2);
 Writeln;
 Writeln('Bam Enter de ket thuc!');
 Readln;
END.