Program Mang_Record;
Uses Crt;
Type kieu=record
            hoten: string[26];
            tuoi: byte;
          end;
Var  i: integer;
     a: array [1..20] of kieu;

BEGIN
 Writeln('Nhap vao f. Thoi nhap khi i=20.');
 For i:=1 to 2 do With a[i] do
 begin
   Write('Hoten: '); Readln(hoten);
   GotoXY(40,WhereY-1); Write('Tuoi: ');  Readln(a[i].tuoi);
 end;
END.

