Program P100316;  {Sap xep file de in}
Uses Crt;
Var  S,Tu: String;
     a: array [1..500] of String[40];
     i,j,n: integer;
     f: text;

BEGIN
 Assign(f,'P10\P100316.TXT'); Reset(f);
 n:=0;
 While not SeekEoF(f) do
 begin
   Readln(f,S);
   Repeat
     While (S<>'')and(S[1]=' ') do Delete(S,1,1);
     If (S<>'') then
     begin
       i:=Pos(' ',S);
       If i<>0 then Tu:=Copy(S,1,i-1) Else Tu:=S;
       Delete(S,1,Length(Tu));
       Inc(n); a[n]:=Tu;
     end;
   Until (S='');
 end;
 Rewrite(f);
 i:=0;
 While i<n do
 begin
   Inc(i);
   Write(f,a[i]);
   For j:=Length(a[i]) to 40 do Write(f,' ');
   If i+50<=n then Writeln(f,a[i+50]) Else Writeln(f);
   If (i mod 50=0) then Inc(i,50);
 end;
 Close(f);
END.

