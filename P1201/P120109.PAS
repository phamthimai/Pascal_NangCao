{$R+,B-}
Program P120109;  {Gian uoc cac phan so}
Uses  Crt;
Type  ps=record
           ts,ms: integer;
         end;
Const fi='P12\Loigiai\P1201\p120109.inp';
      fo='P120109.out';
Var   f,g: file of ps;
      so:  ps;

Function USCLN(a,b: integer): integer;
Var r: integer;
Begin
 While b<>0 do
 begin
   r:=a mod b;
   a:=b; b:=r;
 end;
 USCLN:=a;
End;

Procedure Gianuoc(c: integer; Var a,b: integer);
Begin
 a:=a div c; b:=b div c;
End;

BEGIN
 Assign(f,fi); Reset(f);
 Assign(g,fo); Rewrite(g);
 While not Eof(f) do
 begin
   Read(f,so);
   Write(so.ts,'/',so.ms,' = ');
   Gianuoc(USCLN(so.ts,so.ms),so.ts,so.ms);
   Write(g,so);
   Writeln(so.ts,'/',so.ms);
 end;
 Close(g); Close(f);
 Readln;
END.