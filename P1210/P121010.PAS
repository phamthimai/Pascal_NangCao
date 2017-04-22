Program P121010;  {Doan ten bai hat va ten tac gia}
Uses  Crt;
Const Notes: array [0..12] of string
      =('L','C','CF','D','DF','E','F','FF','G','GF','A','AF','B');
      a0=32.625;
      T=1000; D=500; MD=250;
Var   f: text;
      S,N,Baihat: string;
      O,Du,Code,m: integer;
      c: char;

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
 Repeat
   ClrScr;
   Writeln('Ban hay nghe bai hat sau:');
   Randomize;
   m:=Random(3);
   Case m of
     1: Baihat:='P1210081.Inp';
     2: Baihat:='P1210082.Inp';
     3: Baihat:='P1210083.Inp';
   End;
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
   Writeln('Bai hat ban vua nghe la bai hat: ');
   Writeln('1. ''Nam ngon tay'' cua Tran Van Thu.');
   Writeln('2. ''Doi ken ti hon'' cua Phan Huynh Dieu.');
   Writeln('3. ''Cho con'' cua Pham Trong Cau.');
   Writeln('4. ''Co va me'' cua Pham Tuyen.');
   c:=ReadKey;
   If m=Ord(c)-48 then Writeln('Dung!')
   Else Writeln('Sai!');
   Write('Ban co doan tiep khong? (c/k): ');
   Repeat c:=ReadKey; c:=Upcase(c); Until c in ['C','K'];
 Until c='K';
END.