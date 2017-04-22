Program P110711;   {Go bo ban ghi khoi danh sach}
Uses  Crt;
Type  ptr=^rec;
      rec=record
            name: string[20];
            next: ptr;
          end;
Var   k: integer;
      p,l: ptr;

Procedure Nhap;
Begin
 ClrScr;
 New(p); l:=p;
 Write('Ten: '); Readln(p^.name);
 Repeat
   New(p^.next);
   p:=p^.next;
   Write('Ten: '); Readln(p^.name);
 Until p^.name='';
 p^.next:=nil;
 Write('Vi tri ban ghi can go bo: '); Readln(k);
End;

Procedure Gobo;
Var i: integer; q: Ptr;
Begin
 p:=l; For i:=1 to k do p:=p^.next;     {Tim vi tri cuoi}
 q:=p;
 p:=l; For i:=3 to k do p:=p^.next;     {Tim vi tri dau}
 If k=1 then l:=q Else p^.next:=q;
End;

Procedure In_kq;
Begin
 While (l^.next<>nil) do
 begin
   Writeln(l^.name);
   l:=l^.next;
 end;
 Readln;
End;

BEGIN
 Nhap;
 Gobo;
 In_kq;
END.