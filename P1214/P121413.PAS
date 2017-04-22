{$R+,B-}
Program P121413;   {Tro choi boc soi}
Uses Crt;
Var  dong: array [1..100] of integer;
     dap : char;
     n   : integer;

Procedure Nhap;
Var i: integer; x,y: integer;
Begin
 n:=3;
 For i:=1 to n do
 begin
   Write('Dong ',i,' co '); Readln(dong[i]);
 end;
 Write('Ban thich di truoc khong C/K ');
 x:=wherex; y:=wherey;
 Repeat
   gotoxy(x,y);
   Clreol;
   Readln(dap);
   dap:=upcase(dap);
 Until (dap='C')or(dap='K');
End;

Procedure Nguoidi;
Var i,j: integer; x,y: integer;
Begin
 For i:=1 to n do Write(dong[i],'   ');
 Writeln;
 Write('Ban boc o dong ');
 x:=wherex; y:=wherey;
 Repeat
   gotoxy(x,y);
   Clreol;
   Readln(i);
 Until (i in [1..n])and(dong[i]>0);
 Write('Ban boc may vien ');
 x:=wherex; y:=wherey;
 Repeat
   gotoxy(x,y);
   clreol;
   Readln(j);
 Until j in [1..dong[i]];
 Dec(dong[i],j);
End;

Procedure Boc(p: integer; Var ok: boolean);
Var k,i: integer;
Begin
 k:=0;
 For i:=1 to n do
   If i<>p then k:=k xor dong[i];
 If k<dong[p] then
 begin
   Ok:=true;
   Write('May boc ',dong[p]-k,' vien o dong ',p);
   dong[p]:=k;
 end;
End;

Procedure Bochuhoa;
Var i: integer;
Begin
 For i:=1 to 3 do
   If dong[i]>0 then
   begin
     Dec(dong[i]);
     exit;
   end;
End;

Procedure Maydi;
Var Ok: boolean; i: integer;
Begin
 Ok:=false;
 For i:=1 to n do If not Ok then Boc(i,ok);
 If not Ok then Bochuhoa;
End;

Function Het: boolean;
Var k,i: integer;
Begin
 k:=0;
 For i:=1 to n do k:=k+dong[i];
 het:=k=0;
End;

Procedure Choi;
Begin
 If dap='C' then nguoidi;
 If het then
 begin
   Writeln;
   Writeln('Ban thang rui do');
   exit;
 end;
 While not Het do
 begin
   maydi;
   If het then
   begin
     Writeln;
     Writeln('Ban thua rui do');
     exit;
   end;
   Readln;
   Clrscr;
   Nguoidi;
   If het then
   begin
     Writeln;
     Writeln('Ban thang rui do');
   end;
 end;
End;

BEGIN
 Clrscr;
 Nhap;
 Choi;
 Readln;
END.