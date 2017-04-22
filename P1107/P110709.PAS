Program P110709;  {danh sach ten moc noi 2 chieu}
Uses Crt;
Type ptr=^rec;
     rec=record
           previous: ptr;
           name: string[20];
           next: ptr;
         end;
Var  p,l,r: ptr;

Procedure Nhap;
Begin
 ClrScr;
 New(p); l:=p;
 Write('Ten: '); Readln(p^.name); p^.previous:=nil;
 While p^.name<>'' do
 begin
   New(p^.next);
   p^.next^.previous:=p;
   p:=p^.next;
   Write('Ten: '); Readln(p^.name);
 end;
 p^.next:=nil; r:=p;
End;

Procedure Lietke_Xuoi;
Begin
 Writeln('Liet ke xuoi danh sach da nhap:');
 While l^.next<>nil do
 begin
   Writeln(l^.name);
   l:=l^.next;
 end;
 Readln;
End;

Procedure Lietke_Nguoc;
Begin
 Writeln('Liet ke nguoc danh sach da nhap:');
 Repeat
   Writeln(r^.name);
   r:=r^.previous;
 Until r=nil;
 Readln;
End;

BEGIN
 Nhap;
 Lietke_Xuoi;
 Lietke_Nguoc;
END.