Program P121110;   {Ban may bay}
Uses crt;
Var plane:array[1..10] of record
                                x,y:integer;
                                enable:boolean;
                                v:longint;
                          End;
    bullet:array[1..10] of record
                                 x,y:integer;
                                 enable:boolean;
                                 v:longint;
                           End;
    px:integer;
    show:boolean;
    t:longint;

Procedure hien;
Var i:byte;
Begin
 clrscr;
 For i:=1 to 10 do
 Begin
   If plane[i].enable then
   With plane[i] do
   Begin
     gotoxy(x,y);
     write('Plane')
   End;
   If bullet[i].enable then
   With bullet[i] do
   Begin
     gotoxy(x,y);
     write('^');
   End;
 End;
 gotoxy(px,25);
 write('^');
End;

Procedure short;
Var i:byte;
Begin
 For i:=1 to 10 do
 If bullet[i].enable=false then
 With bullet[i] do
 Begin
   x:=px;
   y:=25;
   enable:=true;
   v:=0;
   show:=true;
 End;
End;

Procedure newplane;
Var i:byte;
Begin
 For i:=1 to 10 do
 If plane[i].enable=false then
 With plane[i] do
 Begin
   x:=random(80)+1;
   y:=random(10)+1;
   enable:=true;
   v:=0;
   show:=true;
 End;
End;

Procedure init;
Var i:byte;
Begin
 For i:=1 to 10 do bullet[i].enable:=false;
 For i:=1 to 10 do newplane;
 px:=40;
 t:=0;
End;

Procedure test;
Var i,j:byte;
Begin
 For i:=1 to 10 do
 If plane[i].enable then
 For j:=1 to 10 do
 If (bullet[j].enable) and (bullet[j].y=plane[i].y) and (plane[i].x<=bullet[j].x) and (-plane[i].x+bullet[j].x<5) then
 Begin
   bullet[i].enable:=false;
   plane[i].enable:=false;
 End;
 For i:=1 to 10 do
 If (bullet[i].enable) and (bullet[i].y=1) then bullet[i].enable:=false;
End;

Procedure update;
Var i:byte;
    dx,dy:integer;
Begin
 If t<10000 then inc(t) else
 Begin
   t:=0;
   newplane;
 End;
 For i:=1 to 10 do
 Begin
   With bullet[i] do
   If enable then
   Begin
     If v<1000 then inc(v) else
     Begin
       v:=0;
       dec(y);
       show:=true;
     End;
   end;
   With plane[i] do
   If enable then
   Begin
     If v<10000 then inc(v) else
     Begin
       v:=0;
       dx:=random(3)-1;
       dy:=random(3)-1;
       If (x+dx>0) and (x+dx<81) then x:=x+dx;
       If (y+dy>0) and (y+dy<11) then y:=y+dy;
       show:=true;
     end;
   end;
 end;
end;

Procedure play;
Var ch:char;
Begin
 ch:=#0;
 repeat
   If keypressed then
   Begin
     ch:=readkey;
     If ch=#0 then ch:=readkey;
     case ch of
       #75:If px>1 then dec(px);
       #77:If px<80 then inc(px);
       #32:short;
     end;
   end;
   show:=false;
   update;
   test;
   If show then hien;
 until ch=#27;
end;

Begin
 TextColor(15);
 init;
 play;
end.