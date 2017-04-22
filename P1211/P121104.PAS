Program P121104;   {doi cho cac o vuong mang 4x4}
Uses  Crt;
{$i P1211\mouse.pas}
Const px: array [1..4] of shortint = (0,1,0,-1);
      py: array [1..4] of shortint = (-1,0,1,0);
Var   a : array [1..4,1..4] of byte;

Procedure Hien;
Var i,j: byte;
Begin
 HideMouse;
 For i:=1 to 4 do
   For j:=1 to 4 do
   begin
     GotoXY(30+j*3,i+10);
     TextBackground(a[i,j]);
     TextColor(a[i,j]+3);
     Write(a[i,j]:3);
   end;
 ShowMouse;
End;

Procedure Init;
Var i,j,k: byte;
Begin
 FillChar(a,sizeof(a),0);
 Randomize;
 For k:=1 to 15 do
 begin
   Repeat
     i:=random(4)+1; j:=random(4)+1;
   Until a[i,j]=0;
   a[i,j]:=k;
 end;
End;

Procedure Swap(Var a,b: byte);
Var tg: byte;
Begin
 tg:=a; a:=b; b:=tg;
End;

function Test: boolean;
Var i,j: byte;
Begin
 Test:=false;
 For i:=1 to 4 do
   For j:=1 to 4 do
     If ((i<>4)or(j<>4))and(a[i,j]<>(i-1)*4+j) then exit;
 Test:=true;
End;

Procedure Play;
Var x,y,i,j,i1,j1,k: word;
Begin
 ShowMouse;
 Hien;
 Repeat
   If MouseEvent and mouseL then
   begin
     x:=mouseX;
     y:=mouseY;
     For i:=1 to 5 do
       If (x>=30+i*3) and (x<33+i*3) then break;
     For j:=1 to 5 do
       If (y=10+j) then break;
     If (i in [1..4]) and (j in [1..4]) then
     begin
       For k:=1 to 4 do
       begin
         i1:=i+px[k]; j1:=j+py[k];
         If (i1 in [1..4])and(j1 in [1..4])and(a[j1,i1]=0) then
         begin
           Swap(a[j,i],a[j1,i1]);
           break;
         end;
       end;
     end;
     Hien;
   end;
 Until Test or KeyPressed;
 If not Test then exit;
 Writeln;
 Writeln(' Ban da hoan thanh tro choi');
 Readln;
End;

BEGIN
 TextBackground(0);
 Clrscr;
 Init;
 Play;
END.