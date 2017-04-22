Program P110307;    {Liet ke cac phan tu cua tap hop}
Uses  Crt;
Const inp='Number.dat';
Var   S: set of byte;
      i: byte;

Procedure Nhap;
Var a: byte; f: text;
Begin
 S:=[];
 Assign(f,inp); Reset(f);
 While not SeekEoF(f) do
 begin
   Readln(f,a); S:=S+[a];
 end;
 Close(f);
End;

BEGIN
 Nhap;
 Clrscr;
 For i:=1 to 255 do If i in S then Write(i:8);
 Readln;
END.

