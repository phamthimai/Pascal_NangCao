Program P100302;     {So sanh 2 file}
Uses Crt;
Var  S1,Tu1,S2,Tu2: String;
     n,i: integer;
     f1,f2: text;

BEGIN
 Assign(f1,'P10\P1003021.TXT'); Reset(f1);
 Assign(f2,'P10\P1003022.TXT'); Reset(f2);
 n:=0;
 While Tu1=Tu2 do
 begin
   While (not SeekEoF(f1))and(Tu1='') do
   begin
     If S1='' then Readln(f1,S1);
     While (S1<>'')and(S1[1]=' ') do Delete(S1,1,1);
     If (S1<>'') then
     begin
       i:=Pos(' ',S1);
       If i<>0 then Tu1:=Copy(S1,1,i-1) Else Tu1:=S1;
       Delete(S1,1,Length(Tu1));
     end;
   end;
   If Tu1<>'' then
   While (not SeekEoF(f2))and(Tu2='') do
   begin
     If S2='' then Readln(f2,S2);
     While (S2<>'')and(S2[1]=' ') do Delete(S2,1,1);
     If (S2<>'') then
     begin
       i:=Pos(' ',S2);
       If i<>0 then Tu2:=Copy(S2,1,i-1) Else Tu2:=S2;
       Delete(S2,1,Length(Tu2));
     end;
   end;
   If Tu1=Tu2 then begin Tu1:=''; Tu2:=''; end;
   inc(n);
 end;
 Close(f1); Close(f2);
 Write(n);
 Readln;
END.

