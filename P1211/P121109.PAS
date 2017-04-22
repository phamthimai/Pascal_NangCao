Program P121109;  {ban tau}
Uses crt;
{$i P1211\mouse.pas}
Const px : array [0..1] of shortint=(1,0);
      py : array [0..1] of shortint=(0,1);
      dl : array [1..10] of byte=(1,1,1,1,2,2,2,3,3,4);
Var   a,b: array [1..10,1..10] of byte;

Function Dem(k: byte): byte;
Var t,i,j: byte;
Begin
 t:=0;
 For i:=1 to 10 do
   For j:=1 to 10 do
     If (a[i,j]=k)and(b[i,j]=1) then Inc(t);
 Dem:=t;
End;

Procedure Hien;
Var i,j,t: byte;
Begin
 Clrscr;
 HideMouse;
 For i:=1 to 10 do
   For j:=1 to 10 do
   begin
     GotoXY(j*2,i);
     If b[i,j]=0 then TextColor(1)
     Else
     begin
       If a[i,j]=0 then TextColor(0)
       Else
       begin
         t:=Dem(a[i,j]);
         If t=dl[a[i,j]] then TextColor(12) Else TextColor(4);
       end;
     end;
     Write('лл');
   end;
 ShowMouse;
End;

Procedure Init;
Var i,j,k,t,Dem: byte;
Begin
 FillChar(a,Sizeof(a),0);
 FillChar(b,Sizeof(b),0);
 Dem:=0;
 Randomize;
 For k:=1 to 4 do
 begin
  Repeat
    i:=Random(10)+1; j:=Random(10)+1;
  Until a[i,j]=0;
  Inc(Dem);
  a[i,j]:=Dem;
 end;
 For k:=1 to 3 do
 begin
   Repeat
     i:=Random(9)+1; j:=Random(9)+1; t:=Random(2);
   Until (a[i,j]=0)and(a[i+py[t],j+px[t]]=0);
   Inc(Dem);
   a[i,j]:=Dem;
   a[i+py[t],j+px[t]]:=Dem;
 end;
 For k:=1 to 2 do
 begin
   Repeat
     i:=Random(8)+1; j:=Random(8)+1; t:=Random(2);
   Until (a[i,j]=0)and(a[i+py[t],j+px[t]]=0)and(a[i+2*py[t],j+2*px[t]]=0);
   Inc(Dem);
   a[i,j]:=Dem;
   a[i+py[t],j+px[t]]:=Dem;
   a[i+2*py[t],j+2*px[t]]:=Dem;
 end;
 Repeat
   i:=Random(9)+1; j:=Random(9)+1; t:=Random(2);
 Until (a[i,j]=0)and(a[i+1,j+1]=0)and(a[i,j+1]=0)and(a[i+1,j]=0);
 Inc(Dem);
 a[i,j]:=Dem;
 a[i+1,j+1]:=Dem;
 a[i,j+1]:=Dem;
 a[i+1,j]:=Dem;
End;

Function Test: boolean;
Var i,j: byte;
Begin
 test:=false;
 For i:=1 to 10 do
   For j:=1 to 10 do
     If (a[i,j]<>0)and(b[i,j]<>1) then exit;
 test:=true;
End;

Procedure Play;
Var x,y,i,j: word;
Begin
 Hien;
 ShowMouse;
 Repeat
   If MouseEvent and mouseL then
   begin
     x:=mouseX; y:=mouseY;
     If y in [1..10] then
       For j:=1 to 10 do
         If x in [j*2..j*2+1] then
         begin
           b[y,j]:=1;
           break;
         end;
     Hien;
   end;
 Until KeyPressed or Test;
 If not Test then exit;
 Writeln;
 TextColor(7);
 Write(' Ban da hoan thanh tro choi ');
 TextBackGround(0);
 TextColor(4);
 Readln;
 HideMouse;
End;

BEGIN
 Clrscr;
 Init;
 Play;
END.