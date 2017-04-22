Program P110710;  {danh sach ten moc noi 2 chieu}
Uses Crt;
Type ptr=^rec;
     rec=record
           previous: ptr;
           name: string[20];
           next: ptr;
         end;
Var  p,l,r: ptr;

Procedure Nhap;
Var f: text;
Begin
  Assign(f,'P11\P110710.txt'); Reset(f);
 New(p); l:=p;
 Readln(f,p^.name); p^.previous:=nil;
 Repeat
   New(p^.next);
   p^.next^.previous:=p;
   p:=p^.next;
   Readln(f,p^.name);
 Until Eof(f);
 p^.next:=nil; r:=p;
End;

Procedure Lietke_Xuoi;
Begin
 Writeln('Liet ke xuoi danh sach da nhap:');
 While l<>nil do
 begin
   Writeln(l^.name);
   l:=l^.next;
 end;
 Readln;
End;

Procedure Lietke_Nguoc;
Begin
 Writeln('Liet ke nguoc danh sach da nhap:');
 While r<>nil do
 begin
   Writeln(r^.name);
   r:=r^.previous;
 end;
 Readln;
End;

BEGIN
 Nhap;
 Lietke_Xuoi;
 Lietke_Nguoc;
END.