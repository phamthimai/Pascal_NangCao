Program P100115;      {Doc mot so nguyen}
Uses  Crt;
Const b: array [0..9] of string
         = ('khong','mot','hai','ba','bon','nam','sau','bay','tam','chin');
Var   i,n: integer;
      s: string;
      a: array [1..3] of 0..9;

BEGIN
 Clrscr;
 Repeat
   Write('Nhap mot so nguyen duong < 1000: '); Readln(n);
 Until (n>0)and(n<1000);
 For i:=3 downto 1 do
 begin
   a[i]:=n mod 10;
   n:=n div 10;
 end;
 If a[1]<>0 then s:=b[a[1]]+' tram' Else s:='';
 Case a[2] of
   0: If (a[1]*a[3]<>0) then s:=s+' le';
   1: s:=s+' muoi';
   Else s:=s+' '+b[a[2]]+' muoi';
 End;
 If a[3]<>0 then
   If (a[2]<>0)and(a[3]=5) then s:=s+' lam' Else  s:=s+' '+b[a[3]];
 If s[1]=' ' then Delete(s,1,1);
 s[1]:=Upcase(s[1]);
 Write(s);
 Readln;
END.