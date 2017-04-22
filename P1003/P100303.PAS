Program P100303;   {Tim tu dai nhat trong cac tu co 'e'}
Uses Crt;
Var  S,Tu,TuMax: String;
     i: integer;
     f: text;

BEGIN
 Assign(f,'P10\P100303.TXT'); Reset(f);
 TuMax:='';
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
       If (Tu[2]='e')and(Length(Tu)>=Length(TuMax)) then TuMax:=Tu;
     end;
   Until (S='');
 end;
 Close(f);
 If Length(TuMax)=0 then Write('Khong co tu nao trong file f.')
 Else Write('Tu chua ''e'' dai nhat trong file f la ',TuMax,'.');
 Readln;
END.

