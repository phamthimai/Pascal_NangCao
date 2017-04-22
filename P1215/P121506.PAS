Program P121506;  {doi hop. De thi IOI lan thu nhat}
Uses  Crt;
Const inp = 'Input.txt';
      out = 'Output.txt';
      nmax = 9;
      TT: array [0..2] of char = (' ','A','B');
type  Bang = array [1..2*nmax] of byte;
      MangByte = array [1..65000] of byte;
      MangLongint = array [1..16300] of Longint;
Var   f: text;
      n: byte;
      TTDau: Bang;
      q,pre: ^MangLongint;
      cx: ^MangByte;
      SoBiEndoi: integer;

Procedure Nhap;
Var i: byte; c: char;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to 2*n do
 begin
   Read(f,c);
   Case c of
    '0': TTDau[i]:=0;
    'A': TTDau[i]:=1;
    'B': TTDau[i]:=2;
   End;
 end;
 Close(f);
End;

Procedure Bang_Toi_So(B: Bang; Var So: longint);
Var i: byte; t: longint;
Begin
 So:=0;
 t:=1;
 For i:=2*n downto 1 do
 begin
   So:=So+B[i]*t;
   t:=t*3;
 end;
End;

Procedure So_Toi_Bang(So: longint; Var B: Bang);
Var i,t: byte; s: longint;
Begin
 Fillchar(b,sizeof(b),0);
 t:=2*n;
 s:=So;
 Repeat
   B[t]:=s mod 3;
   s:=s div 3;
   dec(t);
 Until s=0;
End;

Procedure KhoiTao;
Begin
 New(q);
 New(pre);
 New(cx);
 Fillchar(cx^,sizeof(cx^),0);
End;

Procedure GiaiPhong;
Begin
 Dispose(q);
 Dispose(pre);
 Dispose(cx);
End;

Procedure BiEndoi(b1: bang; Var b2: bang; i: byte);
Var k: byte;
Begin
 For k:=1 to 2*n do
   If b1[k]=0 then
   begin
     b2:=b1;
     b2[i]:=0; b2[i+1]:=0;
     b2[k]:=b1[i]; b2[k+1]:=b1[i+1];
     exit;
   end;
End;

Function Ok(b: bang): boolean;
Var i,d: byte;
Begin
 d:=0;
 For i:=1 to 2*n do
 begin
   If b[i]=1 then inc(d);
   If b[i]=2 then
     If d=n-1 then
     begin
       ok:=true;
       exit;
     end;
     Else
     begin
       ok:=false;
       exit;
     end;
 end;
End;

Procedure path(vt: integer);
Var i: byte; kq: bang;
Begin
 If pre^[vt]<>0 then path(pre^[vt]);
 So_Toi_Bang(q^[vt],kq);
 Write(f,'ÚÄ'); For i:=1 to 2*n-1 do Write(f,'ÄÄÂÄ');Writeln(f,'ÄÄ¿');
 Write(f,'³'); For i:=1 to 2*n do Write(f,' ',tt[kq[i]],' ³');Writeln(f);
 Write(f,'ÀÄ'); For i:=1 to 2*n-1 do Write(f,'ÄÄÁÄ');Writeln(f,'ÄÄÙ');
 Inc(SoBiEndoi);
End;

Procedure GhiNhan(b2: bang; dau: integer);
Var i: byte;
Begin
 Assign(f,out); ReWrite(f);
 Path(dau);
 Write(f,'ÚÄ'); For i:=1 to 2*n-1 do Write(f,'ÄÄÂÄ');Writeln(f,'ÄÄ¿');
 Write(f,'³'); For i:=1 to 2*n do Write(f,' ',tt[b2[i]],' ³');Writeln(f);
 Write(f,'ÀÄ'); For i:=1 to 2*n-1 do Write(f,'ÄÄÁÄ');Writeln(f,'ÄÄÙ');
 Inc(SoBiEndoi);
 Writeln(f,SoBiEndoi);
 Close(f);
End;

Function GetBit(x: longint): byte;
Begin
 getbit:=(cx^[x div 8] shr (x mod 8))and 1;
End;

Procedure BatBit(x: longint);
Begin
 cx^[x div 8]:=cx^[x div 8] or (1 shl (x mod 8));
End;

Procedure GhiNhan2;
Begin
 Assign(f,out);
 ReWrite(f);
 Writeln(f,'No Solution.');
 Close(f);
End;

Procedure XuLy;
Var dau,cuoi: integer; b1,b2: bang; kt: longint; i: byte;
Begin
 KhoiTao;
 dau:=0;
 cuoi:=1;
 Bang_Toi_So(TTDau,q^[1]);
 pre^[1]:=0;
 batbit(q^[1]);
 While dau<=cuoi do
 begin
   Inc(dau);
   If dau=16300 then
   begin
     GhiNhan2;
     exit;
   end;
   So_Toi_Bang(q^[dau],b1);
   For i:=1 to 2*n-1 do
     If (b1[i]<>0)and(b1[i+1]<>0) then
     begin
       BiEndoi(b1,b2,i);
       Bang_Toi_So(b2,kt);
       If getbit(kt)=0 then
       begin
         batbit(kt);
         If cuoi<16300 then
         begin
           inc(cuoi);
           pre^[cuoi]:=dau;
           q^[cuoi]:=kt;
         end;
         If Ok(b2) then
         begin
           GhiNhan(b2,dau);
           exit;
         end;
       end;
     end;
 end;
End;

BEGIN
 Clrscr;
 Writeln('Please wait.');
 Nhap;
 XuLy;
 GiaiPhong;
END.