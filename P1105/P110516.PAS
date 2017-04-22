Program P110516;  {Tinh so ngay le va ngay nghi trong nam ,qui}
Uses Crt;
Type Danhsach=record
                ngay: byte;
 		            thang: byte;
                ten: string[15];
                songay: integer;
	            end;
Var  ds: array [1..100] of Danhsach;
     n: integer;
     f: file of Danhsach;
     snn,snnq1,snnq2,snnq3,snnq4: integer;
     tsq1,tsq2,tsq3,tsq4: integer;

Procedure Nhap;
Begin
 n:=0;
 Assign(f,'P110516.DAT'); Reset(f);
 While not Eof(f) do
 begin
   Inc(n); Read(f,ds[n]);
 end;
 Close(f);
End;

Procedure Tinh_ngay_nghi;
Var i: integer;
Begin
 snn:=0;
 snnq1:=0; tsq1:=0;
 snnq2:=0; tsq2:=0;
 snnq3:=0; tsq3:=0;
 snnq4:=0; tsq4:=0;
 For i:=1 to n do With ds[i] do
 begin
   Inc(snn,songay);
   If (thang<3) then
     begin
       Inc(snnq1,songay); Inc(tsq1);
     end
   Else If (thang<6) then
     begin
       Inc(snnq2,songay); Inc(tsq2);
	   end;
   If (thang<9) then
     begin
       Inc(snnq3,songay); Inc(tsq3);
	   end ;
   If (thang<12) then
	   begin
	     Inc(snnq4,songay); Inc(tsq4);
	   end;
 end;
End;

Procedure Inkq;
Var i: integer;
Begin
 Writeln('So ngay le trong nam : ',n);
 Writeln('Tong so ngay nghi le trong nam : ',snn);
 Writeln;
 Writeln('So ngay le trong qui 1 : ',tsq1);
 Writeln('Tong so ngay nghi le trong qui 1 : ',snnq1);
 Writeln('So ngay le trong qui 2 : ',tsq2);
 Writeln('Tong so ngay nghi le trong qui 2 : ',snnq2);
 Writeln('So ngay le trong qui 3 : ',tsq3);
 Writeln('Tong so ngay nghi le trong qui 3 : ',snnq3);
 Writeln('So ngay le trong qui 4 : ',tsq4);
 Writeln('Tong so ngay nghi le trong qui 4 : ',snnq4);
 Writeln;
End;

BEGIN
 Clrscr;
 Nhap;
 Tinh_ngay_nghi;
 Inkq;
 Write('Ban Enter de ket thuc...');
 Readln;
END.