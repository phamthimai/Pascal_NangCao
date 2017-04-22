(* This Unit creating some mouse tool for advanced programming
   in Pascal.
   Author: GVP
   Date  : Begining 25/07/1994                                 *)

Unit SMouse;

INTERFACE

Uses Dos;
Const DoubleTime:Longint=3;
Var
   T1:longint;
   t2:longint absolute 0:$46c;

Function  MouseInit      :Boolean;
Procedure MouseShow;
Procedure MouseHide;
Procedure GetMousepos(Var Mx,My:Integer);
Procedure Getmousemovement(Var mx,my:integer);
Procedure SetMousepos(Mx,My:Integer);
Procedure GetBPressInfo(Var Status,Count:integer;Button:integer);
Procedure GetBRreIInfo(Var Status,Count:integer;Button:integer);
Function  MouseLPressed  :Boolean;
Function  MouseRPressed  :Boolean;
Function  MouseLReleased :Boolean;
Function  MouseRReleased :Boolean;
Function  MouseLClick    :Boolean;
Function  MouseRClick    :Boolean;
Procedure SetHminmax(Min,Max:integer);
Procedure SetVminmax(Min,Max:Integer);
Procedure MouseGraphcursor(HotX,HotY:Integer;Cursor:Pointer);
Procedure MouseTextcursor(Attr,MaskA,MaskC:Byte;Form:Char);
Procedure Mousereset;
Function  Mouseclick:boolean;
Function  InBox(x1,y1,x2,y2,x,y:integer):boolean;
Function DoubleClick:boolean;
Var mousei:Boolean;


IMPLEMENTATION

Uses crt;

Procedure MouseTextcursor(Attr,MaskA,MaskC:Byte;Form:Char);
var R:Registers;
Begin
   R.AX:=$A;
   R.BX:=0;
   R.CH:=MaskA;
   R.CL:=MaskC;
   R.DH:=Attr;
   R.DL:=Ord(Form);
   Intr($33,R);
End;

Procedure MouseGraphcursor(HotX,HotY:Integer;Cursor:Pointer);
Var R:Registers;
Begin
    R.AX:=9;
    R.BX:=HotX;
    R.CX:=HotY;
    R.DX:=Ofs(Cursor);
    R.ES:=Seg(Cursor);
    Intr($33,R);
End;

Procedure Mousereset;
var R:Registers;
Begin
   R.AX:=$21;
   R.BX:=0;
   R.CX:=0;
   R.DX:=0;
   R.SI:=0;
   R.DI:=0;
   R.ES:=0;
   R.DS:=0;
   Intr($33,R);
End;

Procedure MouseShow;
Var R:Registers;
Begin
    R.AX:=1;
    R.BX:=0;
    R.CX:=0;
    R.DX:=0;
    R.SI:=0;
    R.DI:=0;
    R.ES:=0;
    R.DS:=0;
    Intr($33,R);
End;


Procedure MouseHide;
Var R:Registers;
Begin
    R.AX:=2;
    R.BX:=0;
    R.CX:=0;
    R.DX:=0;
    R.SI:=0;
    R.DI:=0;
    R.ES:=0;
    R.DS:=0;
    Intr($33,R);
End;

Procedure GetMousePos(var Mx,My:Integer);
Var R:Registers;
Begin
    R.AX:=3;
    R.BX:=0;
    R.CX:=0;
    R.DX:=0;
    R.SI:=0;
    R.DI:=0;
    R.ES:=0;
    R.DS:=0;
    Intr($33,R);
    Mx:=R.CX;
    My:=R.DX;
End;

Procedure Getmousemovement(var mx,my:integer);
    Var   r:registers;
    Begin
      r.ax:=11;
      r.bx:=0;
      r.cx:=0;
      r.dx:=0;
      r.si:=0;
      r.di:=0;
      r.es:=0;
      r.ds:=0;
      Intr($33,r);
      mx:=r.cx;
      my:=r.dx;
    End;

Procedure SetMousePos(Mx,My:integer);
Var R:Registers;
Begin
    R.AX:=4;
    R.BX:=0;
    R.CX:=Mx;
    R.DX:=My;
    R.SI:=0;
    R.DI:=0;
    R.ES:=0;
    R.DS:=0;
    Intr($33,R);
End;

Procedure GetBPressInfo(Var Status,Count:integer;Button:integer);
Var R:Registers;
Begin
    R.AX:=5;
    R.BX:=Button;
    R.CX:=0;
    R.DX:=0;
    R.SI:=0;
    R.DI:=0;
    R.ES:=0;
    R.DS:=0;
    Intr($33,R);
    Status:=R.AX;
    Count:=R.BX;
End;

Procedure GetBRreIInfo(Var Status,Count:integer;Button:integer);
Var R:Registers;
Begin
    R.AX:=6;
    R.BX:=Button;
    R.CX:=0;
    R.DX:=0;
    R.SI:=0;
    R.DI:=0;
    R.ES:=0;
    R.DS:=0;
    Intr($33,R);
    Status:=R.AX;
    Count:=R.BX;
End;

Procedure SetHMinMax(Min,Max:integer);
Var R:Registers;
Begin
    R.AX:=7;
    R.BX:=0;
    R.CX:=Min;
    R.DX:=Max;
    R.SI:=0;
    R.DI:=0;
    R.ES:=0;
    R.DS:=0;
    Intr($33,R);
End;

Procedure SetVMinMax(min,max:integer);
Var R:Registers;
Begin
    R.AX:=8;
    R.BX:=0;
    R.CX:=Min;
    R.DX:=Max;
    R.SI:=0;
    R.DI:=0;
    R.ES:=0;
    R.DS:=0;
    Intr($33,R);
End;

Function MouseInit:Boolean;
Var R:Registers;
Begin
    R.AX:=0;
    R.BX:=0;
    R.CX:=0;
    R.DX:=0;
    R.SI:=0;
    R.DI:=0;
    R.ES:=0;
    R.DS:=0;
    Intr($33,R);
    If R.AX<>0 Then MouseInit:=True Else MouseInit:=False;
End;

Function MouseLPressed:Boolean;
Var Status,Count:Integer;
Begin
   GetBPressInfo(Status,count,0);
   If (Status And $1)=$1 Then
    MouseLPressed:=True
   Else MouseLPressed:=False;
End;

Function MouseLReleased:Boolean;
Var Status,count:integer;
Begin
    GetBRreIInfo(Status,count,0);
    If (Status and $1=0) AND (Count>0) then
      MouseLReleased:=True
    Else MouseLReleased:=False;
End;

Function MouseRPressed:Boolean;
Var Status,count:integer;
Begin
    GetBPressInfo(Status,count,1);
    If (Status and $2)=2 then
     MouseRPressed:=True
    Else MouseRPressed:=False;
End;

Function MouseRReleased:Boolean;
Var Status,count:integer;
Begin
    GetBRreIInfo(Status,count,1);
    If (Status and $2=0) AND (Count>0) then
      MouseRReleased:=True
    Else MouseRReleased:=False;
End;

Function  MouseLClick    :Boolean;
 Var
  LClick:Boolean;
 Begin
   LClick:=False;
   If MouseLPressed Then
    Repeat
     LClick:=MouseLReleased
    Until LClick;
   MouseLClick :=LClick;
 End;

Function  MouseRClick    :Boolean;
 Var
  RClick:Boolean;
 Begin
  RClick:=False;
  If MouseRPressed Then
   Repeat
    RClick:=MouseRReleased
   Until RClick;
  MouseRClick:=RClick;
End;

Function Mouseclick:boolean;
begin Mouseclick:=MouseLclick or MouseRclick end;

Function Inbox(x1,y1,x2,y2,x,y:integer):boolean;
Begin inbox:=(x>=x1) and (x<x2) and (y>=y1) and (y<y2) End;

{Function DoubleClick;
 begin
      DoubleClick:=true;
      if MouseLPressed then
      begin
           t1:=t2;
           while t2-t1<DoubleTime do
           begin
                While Not MouseLReleased do ;
                If MouseLPressed then exit;
           end;
      end;
      DoubleClick:=false;
 end;}

Function DoubleClick:boolean;
 begin
      DoubleClick:=true;
      while t2-t1<DoubleTime do
            if MouseLClick then exit;
      DoubleClick:=false;
 end;
End.