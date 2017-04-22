Program P101516;   {tam con xe}
Uses  Crt;
Const Out='';
Var   f: text;
      d: word;
      cx: array [1..8] of boolean;
      a: array [1..8] of byte;

Procedure Ghi;
Var i: byte;
Begin
 Inc(d);
 Writeln(f);
 Write(f,'Cach thu ',d:6,': ');
 For i:=1 to 8 do write(f,'[',i,',',a[i],'] ');
End;

Procedure Try(k: byte);
Var i: byte;
Begin
 For i:=1 to 8 do
   If cx[i] then
   begin
     a[k]:=i;
     cx[i]:=false;
     if k=8 then ghi
     else try(k+1);
     cx[i]:=true;
   end;
End;

BEGIN
 ClrScr;
 d:=0;
 Fillchar(cx,sizeof(cx),true);
 Assign(f,out);
 Rewrite(f);
 Try(1);
 Close(f);
END.