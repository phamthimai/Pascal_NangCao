Program P100418;    {Giai nen 2 anh}
Uses Crt;
Var  S,S1,S10,S2,S20: String;
     i,j,k,m,n,Code,x1,y1,x2,y2: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc anh (m,n): '); Readln(m,n);
 Write('Nhap xau S1 ma hoa anh thu nhat: '); Readln(S1);
 Write('Nhap xau S2 ma hoa anh thu hai:  '); Readln(S2);
 {Giai nen S1 vao S10}
 i:=0; S10:='';S:='';
 Repeat
   Inc(i);
   If (S1[i] in ['0'..'9']) then S:=S+S1[i]
   Else
   begin
     If S<>'' then
     begin
       Val(S,j, Code);
       For k:=2 to j do S10:=S10+S1[i];
       S:='';
     end;
     S10:=S10+S1[i];
   end;
 Until (i>=length(S1));
 {Giai nen S2 vao S20}
 i:=0; S20:='';S:='';
 Repeat
   Inc(i);
   If (S2[i] in ['0'..'9']) then S:=S+S2[i]
   Else
   begin
     If S<>'' then
     begin
       Val(S,j, Code);
       For k:=2 to j do S20:=S20+S2[i];
       S:='';
     end;
     S20:=S20+S2[i];
   end;
 Until (i>=length(S2));
 {Dua 2 anh ra Man hinh}
 For i:=1 to m*n do
 begin
   x1:=(i-1) mod n+40-n; y1:=(i-1) div n +(25-m)div 2;
   GotoXY(x1,y1);
   If S10[i]='c' then Write('*');
   x2:=(i-1) mod n+40; y2:=(i-1) div n +(25-m)div 2;
   GotoXY(x2,y2);
   If S20[i]='c' then Write('*');
 end;
 Readln;
END.