Program P121011;  {Doan ten bai hat nguoc}
Uses  Crt;
Const Notes: array [0..12] of string
      =('L','C','CF','D','DF','E','F','FF','G','GF','A','AF','B');
      C0=32.625;
      T=1000; D=500; MD=250;
Var   f: text;
      S,N,Baihat: string;
      O,Du,Code,m: integer;
      c: char;

Procedure Play(Octave: integer; Note: string; Duration: integer);
Var Fr:real; i:Integer;
Begin
 Fr:=C0;
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

Procedure Hat1(Baihat: String);
Begin
 Assign(f,'P1210N\'+Baihat);
 Reset(f);
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
End;

Procedure Hat2(m: integer);
Var N: array [1..100] of string[2];
    O,Du: array [1..100] of integer;
    i,k: integer;
Begin
 Case m of
   0: Baihat:='P1210081.Inp';
   1: Baihat:='P1210082.Inp';
   2: Baihat:='P1210083.Inp';
 End;
 Assign(f,'P1210N\'+Baihat); Reset(f);
 k:=0;
 Repeat
   Inc(k);
   Read(f,O[k]);
   Readln(f,S);
   While S[1]=' ' do Delete(S,1,1);
   While S[length(S)]=' ' do Delete(S,length(S),1);
   N[k]:=Copy(S,1,Pos(' ',s)-1);
   Delete(S,1,Pos(' ',s));
   While S[1]=' ' do Delete(S,1,1);
   If S='T' then Du[k]:=T;
   If S='D' then Du[k]:=D;
   If S='MD' then Du[k]:=MD;
   Writeln(k:3,O[k]:5,N[k]:5,Du[k]:5);
 Until EoF(f);
 Close(f);
 For i:=k downto 1 do Play(O[i],N[i],Du[i]);
End;

BEGIN
 ClrScr;
 Writeln('Ban hay nghe 3 bai hat sau:');
 Writeln('1. ''Nam ngon tay'' cua Tran Van Thu.');
 Writeln('2. ''Doi ken ti hon'' cua Phan Huynh Dieu.');
 Writeln('3. ''Cho con'' cua Pham Trong Cau.');
 Hat1('P1210081.Inp');
 Hat1('P1210082.Inp');
 Hat1('P1210083.Inp');
 Repeat
   ClrScr;
   Writeln('Ban hay nghe bai hat nguoc:');
   Randomize;
   m:=Random(3);
   Hat2(m);
   Writeln('Bai hat ban vua nghe la bai hat: ');
   Writeln('1. ''Nam ngon tay'' cua Tran Van Thu.');
   Writeln('2. ''Doi ken ti hon'' cua Phan Huynh Dieu.');
   Writeln('3. ''Cho con'' cua Pham Trong Cau.');
   c:=ReadKey;
   If m=Ord(c)-49 then Writeln('Dung!')
   Else Writeln('Sai!');
   Write('Ban co doan tiep khong? (c/k): ');
   c:=ReadKey; c:=Upcase(c);
 Until c='K';
END.