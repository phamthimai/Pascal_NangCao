Program P121006;    {Hop am thu}
Uses  Crt;
Const Notes: array [0..11] of string
      =('C','CF','D','DF','E','F','FF','G','GF','A','AF','B');
      Minor: array [0..7] of byte=(0,2,3,5,7,8,10,12);
      Rec: array [0..2] of byte=(0,2,4);
      d3=261;
Var   Hopam: string;
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
 Write('Nhap ten gam (C/CF/D/DF/E/F/FF/G/GF/A/AF/B): '); Readln(Hopam);
 For i:=0 to 11 do if Hopam=Notes[i] then i0:=i+12*3;
 For i:=0 to 2 do     begin Sound(a[i0+Minor[Rec[i]]]); Delay(500); end;
 Nosound; Delay(100);
 For i:=2 downto 0 do begin Sound(a[i0+Minor[Rec[i]]]); Delay(500); end;
 Nosound;
END.