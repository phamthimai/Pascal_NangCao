Program P121018;  {Mo phong tieng chuong dien thoai}
Uses Crt;
Const Notes: array [1..12] of string
      =('C','CF','D','DF','E','F','FF','G','GF','A','AF','B');
      C0=32.625;

Procedure Play(Octave: integer; Note: string; Duration: integer);
Var Fr:real; i:integer;
Begin
 Fr:=C0;
 For i:=1 to Octave do Fr:=Fr*2;
 i:=1;
 While Notes[i]<>Note do begin Fr:=Fr*Exp(ln(2)/12); inc(i); end;
 Sound(Round(Fr));
 Delay(Duration);
 NoSound;
 Delay(10);
End;

Procedure SoftAlarm;
Var i:integer;
Begin
 For i:=1 to 8 do
 begin
   Play(4,'G',70);
   Play(4,'C',70);
 end;
 delay(1000);
End;

BEGIN
 Writeln('Press any key to Stop...');
 Repeat SoftAlarm Until KeyPressed;
END.