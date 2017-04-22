Program P110314;   {nhap mot xau nhi phan}
Uses  Crt;
Const bit: set of char= ['0','1'];
Var   ch: char;
      st: string;

BEGIN
 Clrscr;
 st:='';
 Writeln('Nhap vao mot xau nhi phan : ');
 Repeat
   ch:= Readkey;
   If ch in bit then
     begin
       st:=st+ch; Write(ch);
     end
   Else If ch<>#13 then Write(#7);
 Until ch=#13;
END.
