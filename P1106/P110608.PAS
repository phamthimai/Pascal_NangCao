Program P110608;     {Ghi va doc file of String}
Uses  Crt;
Const INP='Thu.dat';
Type  String10 = String[10];

Procedure Ghi;
Var f: file of String10; S: String10;
Begin
 Assign(f,INP); Rewrite(f);
 Writeln('Nhap vao f. Thoi nhap khi S='''' (go Enter)!');
 Readln(S);
 While (S<>'') do
 begin
   Write(f,S);
   Readln(S);
 end;
 Close(f);
End;

Procedure Doc;
Var f: file of String10; S: String10;
Begin
 Clrscr;
 Assign(f,INP); Reset(f);
 While Not Eof(f) Do
 begin
   Read(f,S);
   Writeln(S);
   If WhereY=25 then
   begin
     Write('Press Enter to continue..');
     Readln; Clrscr;
   end;
 end;
 Close(f);
 Readln;
End;

BEGIN
 Ghi;
 Doc;
END.