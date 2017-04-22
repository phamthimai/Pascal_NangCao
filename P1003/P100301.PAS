Program P100301;  {Tim va dem so luong tu 'anh' trong file f}
Uses Crt;
Var  d: Integer;
     S: String;
     f: text;

BEGIN
 Assign(f,'P10\P100301.TXT');
 Reset(f);
 d:=0;
 While not eof(f) do
 begin
   Readln(f,S);
   While Pos(' anh',S)<>0 do
   begin
     inc(d);
     Delete(S,1,Pos(' anh',S));
   end;
 end;
 close(f);
 If d=0 then Write('Khong co tu ''anh'' nao trong file f.')
 Else Write('Co ',d,' tu ''anh'' trong file f.');
 Readln;
END.

