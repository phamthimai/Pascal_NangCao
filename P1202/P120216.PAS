Program P120216;   {Dem tu}
Uses  Crt;
Const fi = 'hoten.txt';
Var   f: text;
      s: string;
      dem: word;

BEGIN
 Clrscr;
 dem:=0;
 Assign(f,fi); Reset(f);
 While not Eof(f) do
 begin
   Readln(f,s);
   While s[1]=' ' do Delete(s,1,1);
   While length(s)>0 do
   begin
     Case s[1] of
       ' ': While (s[1]=' ')and(length(s)>0) do Delete(s,1,1);
       Else begin
              inc(dem);
              While (s[1]<>' ')and(length(s)>0) do Delete(s,1,1);
            end;
     End;
   end;
 end;
 Close(f);
 Write(' So tu la: ',dem);
 Readln;
END.