Program P121105;   {doi o vuong mang 4x4}
Uses crt;
{$i P1211\mouse.pas}
Const px: array [1..4] of shortint = (0,1,0,-1);
      py: array [1..4] of shortint = (-1,0,1,0);
Var   a : array [1..4,1..4] of integer;
      fx,fy: integer;

Procedure Hien;
Var i,j: integer; s: string;
Begin
 HideMouse;
 For i:=1 to 4 do
 For j:=1 to 4 do
 Begin
   GotoXY(30+j*3,i+10);
   TextBackground(a[i,j]);
   TextColor(15);
   s:=chr(96+a[i,j]);
   If (i=fy)and(j=fx) then s:='*'+s;
   Write(s:3);
 End;
 ShowMouse;
End;

Procedure Rotare(Var a1,a2,a3,a4: integer);
Var t: integer;
Begin
 t:=a1; a1:=a2; a2:=a3; a3:=a4; a4:=t;
End;

Procedure Init;
Var i,j,k: integer;
Begin
 fx:=1; fy:=1;
 FillChar(a,Sizeof(a),0);
 Randomize;
 For k:=1 to 16 do
 begin
   Repeat
     i:=random(4)+1; j:=random(4)+1;
   Until a[i,j]=0;
   a[i,j]:=k;
 end;
End;

Function Test: boolean;
Var i,j: integer;
Begin
 Test:=false;
 For i:=1 to 4 do
   For j:=1 to 4 do
     If (a[i,j]<>(i-1)*4+j) then exit;
 Test:=true;
End;

Procedure Swap(Var a,b: integer);
Var t: integer;
Begin
 t:=a; a:=b; b:=t;
End;

Procedure Play;
Var x,y,i,j,k,i1,j1: word;
Begin
 ShowMouse;
 Hien;
 Repeat
   If MouseEvent and mouseL then
   begin
     x:=mouseX; y:=mouseY;
     For i:=1 to 5 do
       If (x>=30+i*3)and(x<33+i*3) then break;
     For j:=1 to 5 do If (y=10+j) then break;
     If (i in [1..4]) and (j in [1..4]) then
     begin
       If (abs(i-fx)+abs(j-fy))=1 then Swap(a[j,i],a[fy,fx]);
       If (abs(i-fx)=1) and (abs(j-fy)=1) then
       begin
         If fx<i then i1:=fx Else i1:=i;
         If fy<j then j1:=fy Else j1:=j;
         Rotare(a[j1,i1],a[j1+1,i1],a[j1+1,i1+1],a[j1,i1+1]);
       end;
       fx:=i; fy:=j;
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