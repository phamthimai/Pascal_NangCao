Program P110511;  {Hien thi danh sach lop 11A}
Uses Crt;
Type Danhsach=record
	            	holot: string[25];
	            	ten: string[10];
		           	tuoi: 0..99;
	            	lop: string[3];
          		end;
Var  ds: Danhsach;
     i,d: byte;
     f: file of Danhsach;

BEGIN
 ClrScr;
 Writeln('Danh sach hoc sinh tu file P110511.DAT');
 Writeln;
 Assign(f,'P110510.DAT'); Reset(f);
 d:=0;
 While not Eof(f) do
 begin
   Read(f,ds);
   With ds do
     If (ds.lop='11A') then
     begin
       Writeln(holot:20,ten:10,tuoi:4,lop:5);
       Inc(d);
     end;
 end;
 If (d=0) then Writeln('Danh sach khong chua hoc sinh lop 11A.');
 Close(f);
 Writeln;
 Write('Bam Enter de ket thuc...');
 Readln;
END.