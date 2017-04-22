unit mouse;
interface
uses crt,dos;
var
   left,middle,right,doubleclick,functionkey,automouse,keepmouse,spitmouse,autogo:boolean;
   keypress,mclick,oldmclick:byte;
   oldtime:longint;mpic:pointer;
   MouseX:array[1..4]of integer;
   MouseY:array[1..4]of integer;

procedure MouseOn;
procedure MouseOff;
procedure resetmouse;
procedure HandleEvent;
function GetmX:integer;
function GetmY:integer;
function MouseClick:boolean;
function OneIn(x1,y1,x2,y2:integer):boolean;
function DoubleIn(x1,y1,x2,y2:integer):boolean;
function MouseIn(x1,y1,x2,y2:integer):boolean;
function ReadMouse:byte;
procedure SetMouseXY(x,y:integer);

implementation

procedure resetmouse;
var reg:registers;
begin
with reg do
begin
ax:=$21;bx:=0;cx:=0;dx:=0;
end;
intr($33,reg);
end;

function mouseclick;
var reg:registers;
begin
mouseclick:=false;
reg.ax:=3;intr($33,reg);
if reg.bx<>0 then mouseclick:=true;
end;

procedure mouseon;
var reg:registers;
begin
reg.ax:=1;
intr($33,reg);
end;

procedure mouseoff;
var reg:registers;
begin
reg.ax:=2;
intr($33,reg);
end;

function GetmX:integer;
var mmx:registers;
begin
mmx.ax:=3;intr($33,mmx);getmx:=mmx.cx;
end;

function GetmY:integer;
var mmx:registers;
begin
mmx.ax:=3;intr($33,mmx);getmy:=mmx.dx;
end;

procedure PavHandleEvent;
var reg:registers;keychar:char;curtime:longint;hour,min,sec,junk:word;
    time: longint absolute 0:$46C;
begin
keypress:=0;functionkey:=false;doubleclick:=false;right:=false;
left:=false;middle:=false;
repeat
until (keypressed)or(mouseclick);
if mouseclick then begin
mousex[3]:=mousex[1];mouseY[3]:=mouseY[1];
mousex[4]:=mousex[2];mouseY[4]:=mouseY[2];
mousex[2]:=-50;mousey[2]:=-50;
mousex[1]:=getmx;mouseY[1]:=getmy;

gettime(hour,min,sec,junk);
{curtime:=junk+sec*100+min*6000;}
curtime:=time;
reg.ax:=3;intr($33,reg);
if (curtime-oldtime<=30)and(mclick=reg.bx)then doubleclick:=true;
mclick:=reg.bx;
case reg.bx of
1:begin left:=true;end;
2:begin right:=true;end;
4:begin middle:=true;end;
3:begin left:=true;right:=true;end;
5:begin middle:=true;left:=true;end;
6:begin right:=true;middle:=true;end;
7:begin right:=true;middle:=true;left:=true;end;
end;
repeat
reg.ax:=3;intr($33,reg);
until (reg.bx=0)or(keypressed);
if reg.bx=0 then begin
mousex[2]:=getmx;mouseY[2]:=getmy;
gettime(hour,min,sec,junk);
{oldtime:=junk+sec*100+min*6000;}
oldtime:=time;
end;
end;
if keypressed then begin keychar:=readkey;
if (keychar=#0)and keypressed then
begin keychar:=readkey;functionkey:=true;end;
keypress:=ord(keychar);end;
end;


procedure autoHandleEvent;
var reg:registers;keychar:char;
begin
keypress:=0;functionkey:=false;right:=false;left:=false;middle:=false;
keepmouse:=false;spitmouse:=false;

if mouseclick then begin reg.ax:=3;intr($33,reg);mclick:=reg.bx;
if oldmclick=0 then begin mousex[1]:=getmx;mousey[1]:=getmy;end;
oldmclick:=mclick;end else mclick:=0;
if (mclick=oldmclick)and(mclick<>0)then begin keepmouse:=true;spitmouse:=false;
case mclick of
1:begin left:=true;end;
2:begin right:=true;end;
4:begin middle:=true;end;
3:begin left:=true;right:=true;end;
5:begin middle:=true;left:=true;end;
6:begin right:=true;middle:=true;end;
7:begin right:=true;middle:=true;left:=true;end;
end;
end;
if (mclick<>oldmclick)and(mclick=0) then begin
case oldmclick of
1:begin left:=true;end;
2:begin right:=true;end;
4:begin middle:=true;end;
3:begin left:=true;right:=true;end;
5:begin middle:=true;left:=true;end;
6:begin right:=true;middle:=true;end;
7:begin right:=true;middle:=true;left:=true;end;
end;
oldmclick:=0;keepmouse:=false;spitmouse:=true;
mousex[2]:=getmx;mousey[2]:=getmy;
end;

end;

procedure HandleEvent;
begin
if autogo=true then begin autogo:=false;exit;end;
If automouse then autoHandleEvent else PavHandleEvent;
end;



function readmouse:byte;
var mmx:registers;var tam:byte;
begin
repeat
mmx.ax:=3;intr($33,mmx);readmouse:=mmx.bx;
until mmx.bx<>0;
tam:=mmx.bx;
repeat
mmx.ax:=3;intr($33,mmx);readmouse:=mmx.bx;
until mmx.bx=0;
readmouse:=tam;
end;

function mousein(x1,y1,x2,y2:integer):boolean;
var t:integer;
begin
mousein:=false;
if x1>x2 then begin t:=x1;x1:=x2;x2:=t;end;
if y1>y2 then begin t:=y1;y1:=y2;y2:=t;end;
if (x1<=getmx)and(x2>=getmx)and(y1<=getmy)and(y2>=getmy)then mousein:=true;
end;

function OneIn(x1,y1,x2,y2:integer):boolean;
var t:integer;
begin
OneIn:=false;
if x1>x2 then begin t:=x1;x1:=x2;x2:=t;end;
if y1>y2 then begin t:=y1;y1:=y2;y2:=t;end;
if (x1<=mousex[1])and(x2>=mousex[1])and(y1<=mousey[1])and(y2>=mousey[1])
and(x1<=mousex[2])and(x2>=mousex[2])and(y1<=mousey[2])and(y2>=mousey[2])
then OneIn:=true;
end;

function DoubleIn(x1,y1,x2,y2:integer):boolean;
var t:integer;
begin
DoubleIn:=false;
if x1>x2 then begin t:=x1;x1:=x2;x2:=t;end;
if y1>y2 then begin t:=y1;y1:=y2;y2:=t;end;
if (x1<=mousex[1])and(x2>=mousex[1])and(y1<=mousey[1])and(y2>=mousey[1])
and(x1<=mousex[2])and(x2>=mousex[2])and(y1<=mousey[2])and(y2>=mousey[2])
and(x1<=mousex[3])and(x2>=mousex[3])and(y1<=mousey[3])and(y2>=mousey[3])
and(x1<=mousex[4])and(x2>=mousex[4])and(y1<=mousey[4])and(y2>=mousey[4])
then DoubleIn:=true;
end;

procedure setmousexy(x,y:integer);
var mmx:registers;
begin
mmx.ax:=4;mmx.cx:=x;mmx.dx:=y;intr($33,mmx);
end;
end.