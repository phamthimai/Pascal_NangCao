Program P121012;  {Piano}
Uses  Crt;
Const NoteSet: set of char=['Q','2','W','3','E','R','5','T','6',
      'Y','7','U','I','9','O','0','P','[','=',']',#27];
      Notes: array [1..20] of string=('Q','2','W','3','E','R','5',
      'T','6','Y','7','U','I','9','O','0','P','[','=',']');
      C0=32.625;
Var   c: char;

Procedure Play(Octave: integer; Note: string; Duration: integer);
Var Fr:real; i:Integer;
Begin
 Fr:=C0;
 For i:=1 to Octave do Fr:=Fr*2;
 i:=1;
 While (Notes[i]<>Note)and(i<21) do begin Fr:=Fr*Exp(ln(2)/12); inc(i); end;
 Sound(Round(Fr));
 Delay(Duration);
 NoSound;
 Delay(5);
End;

BEGIN
 ClrScr;
 Writeln('Piano: ');
 Writeln('Esc: Thoat.');
 Repeat
   Repeat
     c:=ReadKey; If c=#0 then c:=ReadKey;
     c:=Upcase(c);
   Until c in NoteSet;
   Play(4,c,50);
 Until c=#27;
END.