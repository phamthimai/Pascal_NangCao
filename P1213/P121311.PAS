Program P121311;   {Chon file}
Uses  Crt;
Const fi1='P1213111.inp';
      fi2='P1213112.inp';
      fo ='P121311.out';
Type  NumberFile = record
                     x: real;
                   end;
Var   f,g,q: file of NumberFile;

Procedure mix;
Var x1,x2: numberfile; t1,t2: boolean;
Begin
 t1:= true; t2:= true;
 While (not Eof(f)) or (not Eof(g)) do
 begin
   If Eof(f) and t1 then x1.x:=-100000
   Else If t1 then Read(f,x1);
   If Eof(g) and t2 then x2.x:=-100000
   Else If t2 then Read(g,x2);
   If x1.x<x2.x then
   begin
     t1:=true;
     t2:=false;
     Write(q,x1);
   end
   Else
   begin
     t1:=false;
     t2:=true;
     Write(q,x2);
   end;
 end;
End;

BEGIN
 Assign(f,fi1); Reset(f);
 Assign(g,fi2); Reset(g);
 Assign(q,fo); Rewrite(q);
 mix;
 Close(q); Close(f); Close(g);
END.