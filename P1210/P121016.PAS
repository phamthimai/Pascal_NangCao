Program P121016;  {Doc bai hat theo chuan MIDI}
Uses  Crt;
Const C0=32.625;
Var   f: text;
      S: string;
      k,i,Code: integer;
      a: array [1..3,1..500] of integer;

Procedure Nhap;
Begin
 Assign(f,'P1210N\P121017.out'); Reset(f);
 k:=0;
 Repeat
   Inc(k);
   Read(f,a[1,k]);
   Readln(f,S);
   While S[1]=' ' do Delete(S,1,1);
   While S[length(S)]=' ' do Delete(S,length(S),1);
   If Copy(S,1,Pos(' ',S)-1)='ON' then a[2,k]:=1
   Else a[2,k]:=0;
   Delete(S,1,Pos(' ',S));
   While S[1]=' ' do Delete(S,1,1);
   Val(S,a[3,k],Code);
 Until EoF(f);
 Close(f);
End;

Procedure Sapxep; {Sap xep theo A[1,i]}
Var i,j,tg: integer;
Begin
 For i:=1 to k-1 do
   For j:=i+1 to k do
     If a[1,i]>a[1,j] then
     begin
       tg:=a[1,i]; a[1,i]:=a[1,j]; a[1,j]:=tg;
       tg:=a[2,i]; a[2,i]:=a[2,j]; a[2,j]:=tg;
       tg:=a[3,i]; a[3,i]:=a[3,j]; a[3,j]:=tg;
     end;
End;

Procedure Play(N: integer);
Var Fr: real; i,ON:Integer;
Begin
 Fr:=C0;
 For i:=1 to a[3,N] do Fr:=Fr*Exp(ln(2)/12);
 If a[2,N]=1 then
   begin
     ON:=a[3,N];
     Sound(Round(Fr));
     Delay((a[1,N+1]-a[1,N])*30);
   end
 Else
   begin
     If ON=a[2,N] then NoSound;
     Delay((a[1,N+1]-a[1,N])*30)
   end;
 Nosound;
 Delay(30);
End;

BEGIN
 Nhap;
 Sapxep;
 For i:=1 to k-1 do Play(i);
END.