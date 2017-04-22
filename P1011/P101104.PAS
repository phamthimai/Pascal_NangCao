{$N+}
Program  P101104;  {day Fibonaci }
Uses  Crt;
Const inp='P1011\P101104.TXT';
Var   f: text;
      an,am: extended;

Procedure Nhap;
Begin
 Assign(f,inp); Reset(f);
 am:=1; an:=0;
 While not Eof(f) do
 begin
   am:=an;
   Readln(f,an);
 end;
 Close(f);
End;

Procedure Them;
Var i: integer;
Begin
 Assign(f,inp); Append(f);
 Writeln(f,am+an:0:0);
 Close(f);
End;

BEGIN
 ClrScr;
 Nhap;
 Them;
END.