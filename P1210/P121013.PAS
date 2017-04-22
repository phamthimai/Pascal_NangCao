Program P121013;  {Ghi nho ban nhac tu Piano}
Uses  Crt,Dos;
Const NoteSet: set of char=['Q','2','W','3','E','R','5','T','6',
      'Y','7','U','I','9','O','0','P','[','=',']',#13];
      Notes: array [1..20] of string=('Q','2','W','3','E','R','5',
      'T','6','Y','7','U','I','9','O','0','P','[','=',']');
Var   c: char;
      i,k: integer;
      N: array [1..100] of string[2];
      Du: array [0..100] of integer;
      h,h1,m,m1,s,s1,hund,hund1 : Word;

Procedure Play(Note: string; Duration: integer);
Var Fr:real; i:Integer;
Begin
 Fr:=261;
 i:=1;
 While (Notes[i]<>Note)and(i<21) do begin Fr:=Fr*Exp(ln(2)/12); inc(i); end;
 Sound(Round(Fr));
 Delay(Duration);
 NoSound;
 Delay(50);
End;

BEGIN
 ClrScr;
 Writeln('Hay choi mot ban nhac!');
 Writeln('Enter: Xong.');
 k:=0;
 Repeat
   h1:=h; m1:=m; s1:=s; hund1:=hund;
   Inc(k);
   Repeat
     c:=ReadKey; If c=#0 then c:=ReadKey;
     c:=Upcase(c);
   Until c in NoteSet;
   N[k]:=C;
   GetTime(h,m,s,hund);
   Du[k-1]:=(((h-h1)*60+m-m1)*60+s-s1)*100+hund-hund1;
 Until c=#13;
 For i:=1 to k-1 do Play(N[i],Du[i]*9);
END.