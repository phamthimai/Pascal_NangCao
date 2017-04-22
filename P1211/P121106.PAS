Program P121106;    {ba con ngua}
Uses Graph,Crt;
Type arr = array [1..500,1..2] of longint;
Var  n       : longint;
     mh,mode : integer;
     v,b     : array [1..3] of longint;
     c1,c2,c3: arr;
     t       : array [1..3,1..500] of longint;
     count   : longint;

Procedure Nhap;
Begin
 Write('n = ');
 Readln(n);
End;

Procedure Khoidong;
Begin
 mh:=0;
 InitGraph(mh,mode,'c:\bp\bgi');
End;

Procedure Vantoc;
Begin
 v[1]:=random(3)+1; v[2]:=random(3)+1; v[3]:=random(3)+1;
End;

Procedure Ve;
Begin
 SetColor(magenta);
 Circle(100,240,90);
 Circle(300,240,90);
 Circle(500,240,90);
End;

Procedure Tinhtd;
Var i,c: longint;
Begin
 count:=0;
 For i:=100 to 190 do
 begin
   Inc(count);
   c1[count,1]:=i;
   c:=round(sqrt((8100-sqr(i-100))));
   c1[count,2]:=c+240;
   c1[180-count,1]:=i;
   c1[180-count,2]:=-c+240;
   c:=round(sqrt((8100-sqr(c1[180-count,2]-240))));
   c1[180+count,1]:=-c+100;
   c1[180+count,2]:=c1[180-count,2];
   c1[360-count,1]:=c1[180+count,1];
   c1[360-count,2]:=c1[count,2];
 end;
 count:=360;
 For i:=1 to 360 do
 begin
   c2[i,1]:=c1[i,1]+200;
   c3[i,1]:=c1[i,1]+400;
   c2[i,2]:=c1[i,2];
   c3[i,2]:=c1[i,2];
 end;
End;

Procedure Tron(x,y,mau: longint);
Begin
 SetColor(mau);
 Circle(x,y,3);
End;

Procedure Thoigian(k: integer);
Var i: integer;
Begin
 For i:=1 to 360 do t[k,i]:=i*v[k];
End;

Procedure Xuly;
Var td: integer;
Begin
 Vantoc;
 Thoigian(1); Thoigian(2); Thoigian(3);
 b[1]:=2; b[2]:=2; b[3]:=2; td:=1;
 Tron(c1[1,1],c2[1,2],green);
 Tron(c2[1,1],c2[1,2],red);
 Tron(c3[1,1],c2[1,2],blue);
 Delay(100);
 Repeat
   Delay(10);
   Inc(td);
   If td=t[1,b[1]] then
   begin
     Tron(c1[b[1]-1,1],c1[b[1]-1,2],white);
     SetColor(magenta);
     Circle(100,240,90);
     Tron(c1[b[1],1],c1[b[1],2],green);
     Inc(b[1]);
   end;
   If td=t[2,b[2]] then
   begin
     Tron(c2[b[2]-1,1],c2[b[2]-1,2],white);
     SetColor(magenta);
     Circle(300,240,90);
     Tron(c2[b[2],1],c2[b[2],2],red);
     Inc(b[2]);
   end;
   If td=t[3,b[3]] then
   begin
     Tron(c3[b[3]-1,1],c3[b[3]-1,2],white);
     SetColor(magenta);
     Circle(500,240,90);
     Tron(c3[b[3],1],c3[b[3],2],blue);
     Inc(b[3]);
   end;
  Until (b[1]=360)or(b[2]=360)or(b[3]=360);
End;

Procedure Ketthuc;
Begin
 CloseGraph;
 If b[n]=360 then
 begin
   Writeln('Ban thang rui do');
   Readln;
   exit;
 end;
 Writeln('He he ban thui rui nha');
 Readln;
End;
BEGIN
 Clrscr;
 Randomize;
 Nhap;
 Khoidong;
 SetbkColor(white);
 Ve;
 Tinhtd;
 Xuly;
 Ketthuc;
END.