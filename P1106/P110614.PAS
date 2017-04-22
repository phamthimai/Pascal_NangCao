Program P110614;
Uses  Crt;
Const inp='Hocsinh.dat';
Type  Hocsinh=Record
                Ten : String[30];
                Tuoi: Byte;
              End;
Var   f : file of Hocsinh;
      Hs,Hs1: Hocsinh;
      i,k : integer;
      c: char;

Procedure Xem;  {Xem danh sach cac ban ghi}
Begin
 ClrScr; Seek(f,0); k:=-1;
 While not EoF(f) do
 begin
   Read(f,Hs);   Inc(k);
   Writeln(k:3,Hs.Ten:26,Hs.Tuoi:3);
   If WhereX=25 then
   begin
     Write('Nhan Enter tiep tuc...'); Readln; Clrscr;
   end;
 end;
 Readln;
End;

Procedure Xoa;  {Xoa mot ban ghi o vi tri tuy chon}
Const Tg='Trunggian.d';
Var   f2: file of Hocsinh;
Begin
 ClrScr;
 Write('Thu tu ban ghi muon xoa: '); Readln(k);
 Assign(f2,Tg);  Rewrite(f2);
 Seek(f,0);
 For i:=0 to k-1 do
 begin
   Read(f,Hs); Write(f2,Hs);
 end;
 Read(f,Hs);  {bo qua ban ghi nay}
 While not EoF(f) do
 begin
   Read(f,Hs); Write(f2,Hs);
 end;
 Close(f); Close(f2);
 Erase(f); Rename(f2,inp);
 Assign(f,inp); Reset(f);
End;

Procedure Sua;  {Sua mot ban ghi o vi tri tuy chon}
Begin
 ClrScr;
 Write('Vi tri can sua: '); Readln(k);
 Seek(f,k); Read(f,Hs);
 Writeln(Hs.Ten:25,Hs.Tuoi:3);
 Write('Ho va ten moi: '); Readln(Hs.Ten);
 Write('Tuoi         : '); Readln(Hs.Tuoi);
 Seek(f,k); Write(f,Hs);
End;

Procedure Them;  {chen mot ban ghi vao vi tri tuy chon}
Begin
 ClrScr;
 Write('Ho va ten  : '); Readln(Hs1.Ten);
 Write('Tuoi       : '); Readln(Hs1.Tuoi);
 Write('Vi tri chen: '); Readln(k);
 If k<=FileSize(f) then Seek(f,k) Else Seek(f,FileSize(f));
 While not EoF(f) do
 begin
   Read(f,Hs); Seek(f,k); Write(f,Hs1);
   Hs1:=Hs; Inc(k);
 end;
 Write(f,Hs1);
End;

Procedure Ve_Menu;
Begin
 Clrscr;
 Writeln('X. Xem toan bo danh sach.');
 Writeln('S. Sua chua mot ban ghi.');
 Writeln('H. Xoa mot ban ghi.');
 Writeln('T. Them mot ban ghi vao danh sach.');
 Writeln('Q. Thoat khoi chuong trinh.');
 Write('Lua chon cua ban: '); c:=Readkey;
 c:= Upcase(c); Write(c);
End;

Procedure Xuli;
Begin
 Case c of
   'X': Xem;
   'S': Sua;
   'H': Xoa;
   'T': Them;
   'Q': begin Close(f); Halt; end;
 End;
End;

BEGIN
 Assign(f,inp); Reset(f);
 Repeat
   Ve_menu;
   Xuli;
 Until false;
END.