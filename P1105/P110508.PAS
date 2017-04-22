Program P110508;  {Doc tu mot file ban ghi}
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
 Writeln('Danh sach hoc sinh tu file P110508.DAT');
 Writeln;
 Assign(f,'P110507.DAT'); Reset(f);
 For i:=1 to n do
 begin
   Read(f,ds);
   With ds do Writeln(holot:20,ten:11,tuoi:4,lop:5);
 end;
 Close(f);
 Writeln;
 Write('Bam Enter de ket thuc...');
 Readln;
END.