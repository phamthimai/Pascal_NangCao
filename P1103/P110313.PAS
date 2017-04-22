Program P110313;  {Nhap mot xau toan cac chu cai}
Uses  Crt;
Const A:set of char=['a'..'z','A'..'Z'];
Var   ch: char;
      st: string;

BEGIN
 Clrscr;
 st:='';
 Writeln('Nhap vao mot xau toan cac chu cai:');
 Repeat
   ch:=Readkey;
   If ch in A then
     begin
       st:=st+ch; write(ch);
     end
   Else if ch<>#13 then Write(#7);
   If ch=#0 then ch:=Readkey;
 Until ch = #13;
END.
