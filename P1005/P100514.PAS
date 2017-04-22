Program P100514;   {Tim doan giong nhau dai nhat cua day so}
Uses Crt;
Var  a: String;
     n,i,j,d,c: integer;

BEGIN
 Clrscr;
 Write('Nhap xau nhi phan: '); Readln(a);
 n:=Length(a);
 i:=1; d:=0; c:=0;
 Repeat
   While (a[i]<>'0')and(i<=n) do Inc(i);
   If i<=n then
   begin
     j:=i; While (a[i]='0')and(i<=n) do Inc(i);
     If i-j>c-d then begin d:=j; c:=i; end;
   end;
 Until i>n;
 If c<>0 then Write('Doan 0 dai nhat cua xau la tu ',d,' den ',c-1,'.')
 Else Write('Khong co so 0 nao.');
 Readln;
END.