Program P100304;   {Dem cac loai tu trong file f}
Uses Crt;
Var  S,Tu: String;
     i,Max: integer;
     d: array [0..1000] of integer;
     f: text;

BEGIN
 Assign(f,'P10\P100304.TXT'); Reset(f);
 Max:=0;
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
       Inc(d[0]); Inc(d[Length(Tu)]);
       If Length(Tu)>Max then Max:= Length(Tu);
     end;
   Until (S='');
 end;
 Close(f);
 Writeln('Tong cong trong file co ',d[0],' tu.');
 For i:=1 to Max do
   If d[i]<>0 then Writeln('Co ',d[i],' tu co do dai ',i,'.');
 Readln;
END.

