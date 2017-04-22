Program P121003;    {Gam truong}
Uses  Crt;
Const Major: array [0..7] of byte=(0,2,4,5,7,9,11,12);
      Notes: array [0..11] of string
      =('C','CF','D','DF','E','F','FF','G','GF','A','AF','B');
      d3=261;
Var   Gam: string;
      a: array [0..95] of integer;
      i0,i: integer;
      q,f: real;

BEGIN
 q:=Exp(ln(2)/12);
 f:=d3;
 For i:=36 to 95 do
 begin
   a[i]:=round(f); f:=f*q;
 end;
 f:=d3;
 For i:=36 downto 0 do
 begin
   a[i]:=round(f); f:=f/q;
 end;
 Write('Nhap ten gam (C/CF/D/DF/E/F/FF/G/GF/A/AF/B): '); Readln(Gam);
 For i:=0 to 11 do
   If Gam=Notes[i] then i0:=i+12*3;
 For i:=0 to 7 do     begin Sound(a[i0+Major[i]]); Delay(500); end;
 For i:=7 downto 0 do begin Sound(a[i0+Major[i]]); Delay(500); end;
 Nosound;
END.