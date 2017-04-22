Program P100214; {Nen va Giai nen xau ki tu}
Uses Crt;
Var  S,S1,S2: String;
     i,j,k,Code: integer;

BEGIN
 Clrscr;
 Write('         Nhap xau S: '); Readln(S);
 {Nen S vao S1}
 i:=1; S1:=S[i]; j:=1;
 Repeat
   Inc(i);
   If (S[i]=S[i-1]) then Inc(j)
   Else
   begin
     If j>1 then
     begin
       Str(j,S2);
       Insert(S2,S1,Length(S1));
       j:=1;
     end;
     S1:=S1+S[i];
   end;
 Until (i>length(S));
 Writeln('Nen S vao S1 = ',S1);
 {Giai nen S1 vao S2}
 i:=0; S2:='';S:='';
 Repeat
   Inc(i);
   If (S1[i] in ['0'..'9']) then S:=S+S1[i]
   Else
   begin
     If S<>'' then
     begin
       Val(S,j, Code);
       For k:=2 to j do S2:=S2+S1[i];
       S:='';
     end;
     S2:=S2+S1[i];
   end;
 Until (i>=length(S1));
 Write('Giai nen S1 vao S2 = ',S2);
 Readln;
END.