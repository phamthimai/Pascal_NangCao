Program P120811;   {Kiem tra bieu thuc dai so}
Uses Crt;
Var  s: String;

Function test(s: String): boolean;
Var i,dem,dau: integer;
Begin
 test:=false;
 dem:=0;
 dau:=1;
 i:=1;
 While (i<=length(s)) do
 begin
   Case s[i] of
     '('              : begin If dau=0 then exit; inc(dem); end;
     ')'              : begin
                          If dau=1 then exit;
                          Dec(dem);
                          If dem<0 then exit;
                        end;
     '+','-','*','/'  : If dau=1 then exit Else dau:=1;
     'A'..'Z','a'..'z': begin
                          If dau=0 then exit;
                          dau:=0;
                          While (i<length(s))and(s[i+1] in
                            ['a'..'z','A'..'Z','0'..'9']) do inc(i);
                        end;
     '0'..'9'         : begin
                          If dau=0 then exit;
                          dau:=0;
                          While (i<length(s))and(s[i+1] in
                            ['0'..'9']) do inc(i);
                        end;
   End;
   Inc(i);
 end;
 If (dem=0)and(dau=0) then test:=true;
End;

BEGIN
 Clrscr;
 Write(' Nhap xau S: '); Readln(s);
 If test(s) then Write(' Day la mot bieu thuc dai so.')
 Else Write(' Day khong phai la mot bieu thuc dai so.');
 Readln;
END.
