Program P120213;   {Ghi file Record theo thu tu nguoc lai}
Uses  Crt;
Const fi = 'text.inp';
      fo = 'text.out';
Type  rec= Record
             d: integer;
           End;
Var   f: File of rec;
      buf: array [1..10000] of rec;
      n,i: integer;

BEGIN
 n:=0;
 Assign(f,fi); Reset(f);
 Repeat
   Inc(n);
   Read(f,Buf[n]);
 Until Eof(f);
 Assign(f,fo); Rewrite(f);
 For i:=n downto 1 do Write(f,Buf[i]);
 Close(f);
END.