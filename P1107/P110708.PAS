Program P110708;  {Liet ke danh sach ten nhap tu ban phim}
Uses Crt;
Type ptr=^rec;
     rec=record
           name: string[20];
           next: ptr;
         end;
Var  p,l: ptr;

BEGIN
 ClrScr;
 New(p);
 Write('Ten: '); Readln(p^.name);
 l:=p;
 Repeat
   New(p^.next);
   p:=p^.next;
   Write('Ten: '); Readln(p^.name);
 Until p^.name='';
 Writeln('Liet ke danh sach da nhap:');
 While l^.name<>'' do
 begin
   Writeln(l^.name);
   l:=l^.next;
 end;
 Readln;
END.