Program P121017;  {Ghi ban nhac tu Piano theo chuan MIDI}
Uses  Crt,Dos;
Const N0=37;
      NoteSet: set of char=['Q','2','W','3','E','R','5','T','6',
      'Y','7','U','I','9','O','0','P','[','=',']',#13];
      Notes: array [1..20] of string=('Q','2','W','3','E','R','5',
      'T','6','Y','7','U','I','9','O','0','P','[','=',']');
Var   c: char;
      i: integer;
      h,h0,m,m0,s,s0,hund,hund0: Word;
      f: text;

BEGIN
 ClrScr;
 Writeln('Hay choi mot ban nhac!');
 Writeln('Enter: Xong.');
 Assign(f,'P1210n\P121017.out'); Rewrite(f);
 GetTime(h0,m0,s0,hund0);
 Repeat
   Repeat
     c:=ReadKey; If c=#0 then c:=ReadKey;
     c:=Upcase(c);
   Until c in NoteSet;
   GetTime(h,m,s,hund);
   Write(f,((((h-h0)*60+m-m0)*60+s-s0)*100+hund-hund0) div 3);
   Write(f,'ON':10);
   i:=1; While (Notes[i]<>C)and(i<21) do Inc(i);
   Writeln(f,i+N0:5);
 Until c=#13;
 Close(f);
END.