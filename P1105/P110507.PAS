Program P110507;   {Nhap danh sach vao File ban ghi}
Uses  Crt;
Const n=5;
Type  Danhsach=record
		 holot: string[25];
            	 ten: string[10];
            	 tuoi: 0..99;
             	 lop: string[3];
               end;
Var   ds: Danhsach;
      i: byte;
      f: file of Danhsach;

BEGIN
 ClrScr;
 Assign(f,'P110507.DAT'); Rewrite(f);
 Writeln('Hay nhap danh sach hoc sinh : ');
 Writeln;
 For i:=1 to n do
 begin
   Writeln('Thong tin hoc sinh thu ',i);
   Write('Cho ho lot : '); Readln(ds.holot);
   Write('Cho ten    : '); Readln(ds.ten);
   Write('Cho tuoi   : '); Readln(ds.tuoi);
   Write('Cho lop    : '); Readln(ds.lop);
   Write(f,ds);
   Writeln;
 end;
 Close(f);
 Writeln;
 Write('Bam Enter de ket thuc...');
 Readln;
END.
