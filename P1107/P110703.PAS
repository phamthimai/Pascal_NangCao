Program P110703;
Uses Crt;
Type
  TFriendRec = record
                Name: string[30];
                Age : Byte;
               end;
Var
  p: pointer;
BEGIN
 Clrscr;
 If MaxAvail < SizeOf(TFriendRec) then
   Writeln('Not enough memory')
 Else
 begin
  { Allocate memory on heap }
   GetMem(p, SizeOf(TFriendRec));
    { ...}
    { ...Use the memory... }
    { ...}
    { Then free it when done }
   FreeMem(p, SizeOf(TFriendRec));
 end;
 Readln;
END.

