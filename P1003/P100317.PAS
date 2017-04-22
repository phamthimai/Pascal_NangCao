Program P100317;   {Thay tu viet tat}
Uses Crt;
Var  S,Tu: String;
     i,n: integer;
     a: array [1..2,1..50] of String[20];
     f,g,h: text;

BEGIN
 Assign(f,'P10\P100317f.TXT'); Reset(f);
 Assign(g,'P10\P100317g.TXT'); Reset(g);
 Assign(h,'P10\P100317h.TXT'); Rewrite(h);
 n:=0;
 While not SeekEoF(g) do
 begin
   Readln(g,S);
   While (S<>'')and(S[1]=' ') do Delete(S,1,1);
   If (S<>'') then
   begin
     Inc(n);
     i:=Pos(' ',S);
     a[1,n]:=Copy(S,1,i-1);
     Delete(S,1,i);
     While (S<>'')and(S[1]=' ') do Delete(S,1,1);
     a[2,n]:=S;
   end;
 end;
 Close(g);
 For i:=1 to n do Writeln(a[1,i],a[2,i]); Readln;
 While not SeekEoF(f) do
 begin
   Readln(f,S);
   Repeat
     While (S<>'')and(S[1]=' ') do Delete(S,1,1);
     If (S<>'') then
     begin
       i:=Pos(' ',S);
       If i<>0 then Tu:=Copy(S,1,i-1) Else tu:=S;
       Delete(S,1,Length(Tu));
       For i:=1 to n do If a[1,i]=Tu then Tu:=a[2,i];
       Write(h,Tu,' ');
     end;
   Until (S='');
   Writeln(h);
 end;
 Close(f);Close(h);
END.

