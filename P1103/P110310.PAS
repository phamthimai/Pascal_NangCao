Program P1103010;   {Tim cac so nguyen to kieu byte}
Uses Crt;
Var  sang: set of byte;
     i,j: byte;

BEGIN
 Clrscr;
 sang:=[];
 For i:=2 to 255 do sang:=sang+[i];
 For i:=2 to 255 do
   If i in sang then
   begin
     j:=2;
     While (i*j<=255) do
     begin
       sang:=sang-[i*j];
       Inc(j);
     end;
   end;
 Writeln('Cac so nguyen to:');
 For i:=2 to 255 do If i in sang then Write(i:4);
 Readln;
END.