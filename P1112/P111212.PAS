{$R+,B-}
Program P111212;  {Bai toan thap Ha noi}
Uses  Crt;
Const out='P111212.out';
Var   n: integer;
      f: text;

Procedure Nhap;
Begin
 Write('So luong dia: n = '); Readln(n);
End;

Procedure Chuyen(a,b,c,n: integer);
Begin
 If n=1 then Writeln(f,'Chuyen tu coc ',a,' sang coc ',b)
 Else
 begin
   Chuyen(a,c,b,n-1);
   Writeln(f,'Chuyen tu coc ',a,' sang coc ',b);
   Chuyen(c,b,a,n-1);
 end;
End;

BEGIN
 Assign(f,out); Rewrite(f);
 Nhap;
 Chuyen(1,2,3,n);
 Close(f);
END.