Program P100604;  {Lap day Rn tu day Hoan vi An}
Uses  Crt;
Const nmax=1000;
      inp='P10\P100610.TXT';
      out='P10\P100610.OUT';
Var   f: text;
      n: integer;
      a,r: array [1..nmax] of integer;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp);
 Reset(f);
 Readln(f,n);
 For i:=1 to n do Read(f,a[i]);
 Close(f);
End;

Procedure Xay_dung;
Var i: integer;
Begin
 For i:=1 to n do r[a[i]]:=i;
 Assign(f,out);
 Rewrite(f);
 For i:=1 to n do
 begin
   If i mod 10=0 then Writeln(f);
   Write(f,r[i],' ');
 end;
 Close(f);
End;

BEGIN
  Clrscr;
  Nhap;
  Xay_dung;
END.