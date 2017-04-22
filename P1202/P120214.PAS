Program P120214;  {Ghi file, loai bo so giong nhau}
Uses  Crt;
Const fi = 'text.inp';
      fo = 'text.out';
Type  rec= Record
             d: byte;
           End;
Var   f: File of rec;
      buf: array [1..10000] of rec;
      dx : array [1..10000] of 0..1;
      n,i,j: integer;

BEGIN
 n:=0;
 Assign(f,fi); Reset(f);
 Repeat
   Inc(n);
   Read(f,Buf[n]);
 Until Eof(f);
 Close(f);
 For i:=1 to n do dx[i]:=0;
 For i:=1 to n do
   If dx[i]=0 then
     For j:=i+1 to n do
       If buf[j].d=buf[i].d then dx[j]:=1;
 Assign(f,fo); Rewrite(f);
 For i:=1 to n do
   If dx[i]=0 then Write(f,Buf[i]);
 Close(f);
END.