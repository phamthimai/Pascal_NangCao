Program P121007;  {Bai hat 'Cho con' cua Pham Trong Cau}
Uses  Crt;
Const Notes: array [0..12] of string
      =('L','C','CF','D','DF','E','F','FF','G','GF','A','AF','B');
      a0=32.625;
      T=1000; D=500; MD=250;
Var   f: text;
      S,N: string;
      O,Du,Code: integer;

Procedure Play(Octave: integer; Note: string; Duration: integer);
Var Fr:real; i:Integer;
Begin
 Fr:=a0;
 For i:=1 to Octave do Fr:=Fr*2;
 i:=0;
 While Notes[i]<>Note do begin Fr:=Fr*Exp(ln(2)/12); inc(i); end;
 If Note<>'L' then
 begin
   Sound(Round(Fr));
   Delay(Duration);
   NoSound;
   Delay(50);
 end
 Else begin Nosound; Delay(Duration+50); end;
End;

BEGIN
 Assign(f,'P1210N\P121007.INP'); Reset(f);
 Repeat
   Read(f,O);
   Readln(f,S);
   While S[1]=' ' do Delete(S,1,1);
   While S[length(S)]=' ' do Delete(S,length(S),1);
   N:=Copy(S,1,Pos(' ',s)-1);
   Delete(S,1,Pos(' ',s));
   While S[1]=' ' do Delete(S,1,1);
   If S='T' then Du:=T;
   If S='D' then Du:=D;
   If S='MD' then Du:=MD;
   Play(O,N,Du);
 Until EoF(f);
 Close(f);
END.