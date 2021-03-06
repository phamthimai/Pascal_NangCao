Program P110509; {Hien thi danh sach ten sap theo thu tu}
Uses  Crt;
Const n=5;
Type  Danhsach=record
	            	 holot: string[25];
		             ten: string[10];
	            	 tuoi: 0..99;
	             	 lop: string[3];
          		 end;
Var   ds: array [1..20] of Danhsach;
      i,j: byte;
      f: file of Danhsach;

Procedure Doi(i,j: byte);
Var tg: Danhsach;
Begin
 tg:=ds[i];
 ds[i]:=ds[j];
 ds[j]:=tg;
End;

BEGIN
 ClrScr;
 Writeln('Nhap danh sach hoc sinh tu file P110509.DAT:');
 Writeln;
 Assign(f,'P110507.DAT'); Reset(f);
 For i:=1 to n do Read(f,ds[i]);
 Close(f);
 For i:=1 to n-1 do
   For j:=i+1 to n do
   begin
     If (ds[i].ten>ds[j].ten) then Doi(i,j)
     Else
       If (ds[i].ten=ds[j].ten)and(ds[i].holot>ds[j].holot) then Doi(i,j);
   end;
 Writeln('Danh sach hoc sinh:');
 For i:=1 to n do
   With ds[i] do Writeln(holot:20,ten:11,tuoi:4,lop:5);
 Writeln;
 Write('Bam Enter de ket thuc...');
 Readln;
END.
