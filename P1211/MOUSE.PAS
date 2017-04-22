{Mouse.pas}
Var mouseX,mouseY:word;
    mouseL,mouseR:boolean;
Procedure showmouse;
Begin
 Asm
   mov ax,1
   int 33h
 End;
End;

Procedure hidemouse;
Begin
 Asm
   mov ax,2
   int 33h
 End;
End;

Function mouseevent:boolean;
Var t:word;
Begin
 Asm
   mov ax,3
   int 33h
   mov mouseX,cx
   mov mouseY,dx
   mov t,bx
 End;
 mouseY:=mouseY div 8 +1;
 mouseX:=mouseX div 8 +1;
 mouseEvent:=t<>0;
 mouseL:=boolean(t and 1);
 mouseR:=boolean(t and 2);
End;

Function mouseeventgr:boolean;
Var t:word;
Begin
 Asm
   mov ax,3
   int 33h
   mov mouseX,cx
   mov mouseY,dx
   mov t,bx
 End;
 inc(mouseX);
 inc(mouseY);
 mouseEventgr:=t<>0;
 mouseL:=boolean(t and 1);
 mouseR:=boolean(t and 2);
End;
