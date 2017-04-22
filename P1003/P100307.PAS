Program P100307a;   {Ghi mot nua file f vao file g}
Uses Crt;
Var  S: String;
     Stop: Boolean;
     f,g: text;

BEGIN
 Assign(f,'P10\P1003071.TXT'); Reset(f);
 Assign(g,'P10\P1003072.TXT'); Rewrite(g);
 Stop:=false;
 While (not SeekEoF(f))and(not Stop) do
 begin
   Readln(f,S);
   If Pos(' anh',S)=0 then Writeln(g,S)
   Else
   begin
     Writeln(g,Copy(S,1,Pos(' anh',S)));
     Stop:=true;
   end;
 end;
 Close(f); Close(g);
END.

