Program P100417; {Giai nen anh}
Uses Crt;
Var  S,S1,S2: String;
     i,j,k,m,n,Code,x,y: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc anh (m,n): '); Readln(m,n);
 Write('Nhap xau ma hoa anh: '); Readln(S1);
 {Giai nen S1 vao S2}
 i:=0; S2:='';S:='';
 Repeat
   Inc(i);
   If (S1[i] in ['0'..'9']) then S:=S+S1[i]
   Else
   begin
     If S<>'' then
     begin
       Val(S,j, Code);
       For k:=2 to j do S2:=S2+S1[i];
       S:='';
     end;
     S2:=S2+S1[i];
   end;
 Until (i>=length(S1));
 {Dua anh ra Man hinh}
 For i:=1 to Length(S2) do
 begin
   x:=(i-1) mod n+(80-n)div 2; y:=(i-1) div n +(25-m)div 2;
   GotoXY(x,y);
   If S2[i]='c' then Write('*');
 end;
 Readln;
END.