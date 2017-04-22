Program P111111;  {Tim so dien thoai va dia chi}
Uses  Crt;
Const inp='P11\P1111\p111111.inp';
Type  CanBo=record
              HoDem: string[25];
              Ten  : string[10];
              DienThoai: longint;
              DiaChi: string[40];
            end;
Var   f: file of CanBo;
      c: char;
      Dem: string[25];
      TenCb: string[10];

Procedure Nhap;
Var cb: CanBo;
Begin
 Assign(f,inp); Rewrite(f);
 Write(' Ho dem    :'); Readln(cb.Hodem);
 While cb.Hodem<>'' do
 begin
   Write(' Ten       :'); Readln(cb.ten);
   Write(' Dien thoai:'); Readln(cb.DienThoai);
   Write(' Dia Chi   :'); Readln(cb.DiaChi);
   Write(f,Cb);
   Writeln;
   Write(' Ho dem    :'); Readln(cb.Hodem);
 end;
 Close(f);
End;

Procedure Tim;
Var cb: CanBo;
Begin
 Assign(f,inp); Reset(f);
 While not Eof(f) do
 begin
   Read(f,cb);
   If (cb.HoDem=Dem)and(cb.Ten=Tencb) then
   begin
     Writeln('Dien thoai: ',cb.DienThoai);
     Writeln('Dia chi: ',cb.Diachi);
     Close(f); exit;
   end;
 end;
 Close(f);
 Writeln('Khong tim thay.');
End;

BEGIN
 Clrscr;
{ Nhap;}
 While true do
 begin
   Writeln('Nguoi can tim:');
   Write('Ho dem: '); Readln(Dem);
   Write('Ten can bo: '); Readln(TenCb);
   Tim;
   Writeln('Tiep tuc tim - Co/Khong(C/K)');
   c:=UpCase(readkey);
   If c='K' then halt;
 end;
END.