Program P110512;   {Tach File}
Uses Crt;
Type Danhsach=record
	            	holot: string[25];
            		ten: string[10];
		           	tuoi: 0..99;
		           	lop: string[3];
		          end;
Var  ds : Danhsach;
     f: file of Danhsach;
     f10,f11,f12: file of Danhsach;

BEGIN
 ClrScr;
 Writeln('Danh sach hoc sinh tu file P110512.DAT');
 Writeln;
 Assign(f,'P110510.DAT');  Reset(f);
 Assign(f10,'KHOI10.DAT'); Rewrite(f10);
 Assign(f11,'KHOI11.DAT'); Rewrite(f11);
 Assign(f12,'KHOI12.DAT'); Rewrite(f12);
 While not Eof(f) do
 begin
   Read(f,ds);
   With ds do
   begin
     If pos('10',lop)=1 then Write(f10,ds);
     If pos('11',lop)=1 then Write(f11,ds);
     If pos('12',lop)=1 then Write(f12,ds);
   end;
 end;
 Close(f);   Close(f10);
 Close(f11); Close(f12);
 Writeln;
 Write('Bam Enter de ket thuc...');
 Readln;
END.
