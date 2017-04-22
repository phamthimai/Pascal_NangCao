Program P110604;{Ghi_file_moi}
Uses Crt;
Type kieu=string[10];
Var
 i: integer;
 a: kieu;
 f: file of kieu;
BEGIN
 Assign(f,'Ghi_Doc');
 Rewrite(f);
 Writeln('Nhap vao f. Thoi nhap khi fi='''' (go Enter).');
 i:=0;
 Write('f',i,' = '); Readln(a);
 While (a<>'') do
 begin
  Write(f,a);
  Inc(i);
  Write('f',i,' = '); Readln(a);
 end;
 Close(f);
END.

