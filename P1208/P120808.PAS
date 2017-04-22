Program P120808;
{Nhap vao mot xau ki tu gom cac dau mo,dong ngoac, kiem tra tinh dung dan}
Uses  Crt;
Const fn = 'P1208\P120808.inp';
Var   s: string;
      f: text;

Procedure Nhap;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,s);
 Close(f);
End;

Procedure Kiemtra;
Var sm,i: integer;
Begin
 sm:=0;
 For i:=1 to length(s) do
   If s[i] in ['(',')'] then
   begin
     If s[i]='(' then Inc(sm) Else Dec(sm);
     If sm<0 then begin Write('Sai'); Readln; halt; end;
   end;
 If sm<>0 then begin Write('Sai'); Readln; halt; end;
 Write('Dung');
 Readln;
End;

BEGIN
 Clrscr;
 Nhap;
 Kiemtra;
END.
