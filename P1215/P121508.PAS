Program P121508;
Uses  Crt;
Const Fi='Input8.txt';
      Fo='Output8.txt';
      M : array [0..7] of integer = (1,1,2,6,24,120,720,5040);
      Mx: array [1..5] of integer = (0,-1,0,1,0);
      My: array [1..5] of integer = (0,0,1,0,-1);
      Ex: array [1..5] of integer = (0,1,0,-1,0);
      Ey: array [1..5] of integer = (0,0,-1,0,1);

Type  mang  = array [1..4,1..4] of integer;
      mang2 = array [0..8] of byte;
      mang4 = array [1..40321]  of shortint;
Var   f: text;
      MA,Md,Temp: mang;
      B    : mang2;
      Q    : mang4;
      Q1   : ^mang4;
      DD   : array [1..16] of integer;
      dau,cuoi,di,sl,Time,ct: longint;

Procedure Nhap;
Var i,j: integer;
Begin
 Assign(f,fi); Reset(f);
 For i:=1 to 4 do
 begin
   For j:=1 to 4 do Read(f,md[i,j]); Readln(f);
 end;
 Close(f);
End;

Procedure Duoi(a: mang; Var B: mang2);
Var i,j: integer;
Begin
 Fillchar(b,sizeof(b),0);
 For i:=1 to 2 do
   For j:=1 to 4 do B[(i-1)*4+j]:=A[i,j];
End;

Procedure co(Var a: mang; B: mang2);
Var i,j: integer;
Begin
 Fillchar(a,sizeof(a),0);
 For i:=1 to 2 do
   For j:=1 to 4 do A[i,j]:=B[(i-1)*4+j];
End;

Function  Vitri(A: mang2): Longint;
Var i,j: integer; Dx: mang2; T: Longint;
Begin
 Fillchar(dx,sizeof(Dx),0);
 t:=1;
 For i:=1 to 8 do
 begin
   For j:=A[i]-1 downto 1 do
     If Dx[j]=0 then T:=T+M[8-i];
   dx[A[i]]:=1;
 end;
 Vitri:=t;
End;

Procedure thanhbang(p: longint; Var A: mang2);
Var Dx: mang2; i,j: integer; K: integer;
Begin
 Fillchar(dx,Sizeof(dx),0);
 p:=p-1;
 For i:=1 to 8 do
 begin
   k:=p div M[8-i]+1;
   p:=p mod M[8-i];
   j:=1;
   While k>0 do
   begin
     While Dx[j]=1 do Inc(j);
     Inc(j);
     Dec(k);
   end;
   A[i]:=j-1;
   Dx[j-1]:=1;
 end;
End;

Procedure Find(p: integer; Var x,y: integer; a: mang);
Var i,j: integer;
Begin
 For i:=1 to 4 do
   For j:=1 to 4 do
     If A[i,j]=p then
     begin
       x:=i; y:=j;
       exit;
     end;
End;

Function trong(x,y: integer): boolean;
Begin
 trong:=(x>0)and(x<=2)and(y>0)and(y<=4);
End;

Procedure coc(Var a,b: integer) ;
Var c: integer;
Begin
 c:=a; a:=b; b:=c;
End;

Procedure Write_arr(A: mang);
Var i,j: integer;
Begin
 Inc(sl);
 Writeln(f,sl);
 If Ct=0 then
 begin
   Find(7,i,j,a); A[i,j]:=0;
   Find(8,i,j,a); A[i,j]:=0;
   For i:=3 to 4 do
     For j:=1 to 4 do A[i,j]:=Md[i,j];
 end
 Else
 begin
   For i:=1 to 2 do
     For j:=1 to 4 do A[i+2,j]:=A[i,j]+8;
   For i:=1 to 2 do
     For j:=1 to 4 do A[i,j]:=md[i,j];
   Find(15,i,j,a); A[i,j]:=0;
   Find(16,i,j,a); A[i,j]:=0;
 end;
 For i:=1 to 4 do
 begin
   For j:=1 to 4 do Write(f,A[i,j]: 3); Writeln(f);
 end;
End;

Function Find_Fist: word;
Var i: word;
Begin
 I:=1;
 While (Q[i]<=0)and(i<=40320) do Inc(i);
 Find_fist:=i;
End;

Procedure Write_out1(k: word);
Var i: word;
    x,y,px,py,slkq: integer;
    Kq: array [1..300] of mang;
Begin
 Fillchar(kq,sizeof(kq),0);
 slkq:=1; i:=k; thanhbang(k,b); co(Ma,b); Kq[slkq]:=Ma;
 Repeat
   thanhbang(k,b);
   co(Ma,b);
   Find(7,x,y,Ma);
   px:=x+ex[abs(Q[k])]; py:=y+ey[abs(Q[k])];
   Coc(MA[x,y],MA[px,py]);
   Find(8,x,y,Ma);
   px:=x+ex[abs(Q1^[k])]; py:=y+ey[abs(Q1^[k])];
   Coc(MA[x,y],MA[px,py]);
   Inc(slkq);
   Kq[slkq]:=Ma;
   duoi(Ma,b);
   k:=vitri(b);
 Until k=di;
 For i:=slkq downto 1 do Write_arr(Kq[i]);
End;

Procedure loang;
Var k: word;
    i,j,x1,y1,px1,py1,x2,y2,px2,py2,p: integer;
    La: mang;
Begin
 Fillchar(q,sizeof(q),0); Fillchar(q1^,sizeof(q1^),0);
 Duoi(Ma,b); Di:=Vitri(b); Q1^[di]:=125; Q[di]:=125;
 Repeat
   k:=find_fist;
   If k=40321 then
   begin
     Write('Khong the bien doi duoc ');
     Exit;
   end;
   Q[k]:=-Q[k]; Q1^[k]:=-Q1^[k];
   Thanhbang(k,b);
   Co(Ma,b);  la:=Ma;
   Find(7,x1,y1,Ma); Find(8,x2,y2,Ma);
   For i:=1 to 5 do For j:=1 to 5 do
   If (i=1) xor (j=1) then
   begin
     px1:=x1+Mx[i]; py1:=y1+My[i];
     px2:=x2+Mx[j]; py2:=y2+My[j];
     If trong(px1,py1)and trong(px2,py2) then
       If (MA[px1,py1]<>8)and(MA[px2,py2]<>7) then
       begin
         coc(MA[x1,y1],MA[px1,py1]);
         coc(MA[x2,y2],MA[px2,py2]);
         duoi(Ma,b); k:=vitri(b);
         If Q[k]=0 then
         begin
           Q[k]:=i; Q1^[k]:=j;
           If (k=1)or(k=2) then
           begin
             Write_out1(k);
             Exit;
           end;
         end;
       end;
     Ma:=la;
   end;
 Until false;
End;

Procedure Init;
Var i,j: integer;
Begin
 Find(0,i,j,md); md[i,j]:=15;
 Find(0,i,j,md); md[i,j]:=16;
End;

Procedure Find_bigger(k: integer; Var x,y: integer; Var A: mang);
Var i,j: integer;
Begin
 For i:=1 to 4 do
   For j:=1 to 4 do
     If (Dd[A[i,j]]=0) and (a[i,j]<k) then
     begin
       x:=i; y:=j;
       exit;
     end;
 x:=0;
End;

Procedure Write_arr1(A: mang);
Var i,j: integer;
Begin
 Inc(sl);
 Find(15,i,j,a); A[i,j]:=0;
 Find(16,i,j,a); A[i,j]:=0;
 For i:=1 to 4 do
 begin
   For j:=1 to 4 do Write(f,a[i,j]:3); Writeln(f);
 end;
 Writeln(f);
End;

Procedure Move_tr_x(k,x,y: integer; Var a: mang);
Var x1,y1: integer;
Begin
 Find(k,x1,y1,md);
 While x<x1 do
 begin
   coc(A[x1,y1],a[x1-1,y1]); Write_arr1(a);dec(x1);
 end;
 While x>x1 do
 begin
   coc(A[x1,y1],a[x1+1,y1]); Write_arr1(a);inc(x1);
 end;
End;

Procedure Move_tr_y(k,x,y: integer; Var A: mang);
Var x1,y1: integer;
Begin
 Find(k,x1,y1,a);
 While y>y1 do
 begin
   coc(A[x1,y1],a[x1,y1+1]); Write_arr1(a); Inc(y1);
 end;
 While y<y1 do
 begin
   coc(A[x1,y1],a[x1,y1-1]); Write_arr1(a); Dec(y1);
 end;
End;

Procedure Move_tr(k,x,y: integer; Var A: mang);
Var i,j,x1,y1: integer;
Begin
 Move_tr_x(k,x,y,a);
 Move_tr_y(k,x,y,a);
End;

Procedure move_x(p: integer; x,y: integer; Var A: mang);
Var x1,y1,xt,yt: integer;
Begin
 Find(p,x1,y1,a); If (x1=x) then exit;
 Find(15,xt,yt,a);
 If x1<=x then
 begin
   Move_tr(15,x1+1,y1,a); Move_tr(15,x1,y1,a);
   If x1<=x then
   begin
     Find(15,xt,yt,a); Find(p,x1,y1,a);
     Move_tr(15,x1+1,y1,a); Move_tr(15,x1,y1,a);
   end;
 end
 Else
   Repeat
     Find(p,x1,y1,a); If (x1=x) then exit;
     Find(15,xt,yt,a);
     If xt<x1 then Move_tr(15,x1-1,y1,a)
     Else If y1<>yt then Move_tr(15,x1-1,y1,a)
          Else begin
                 If y1=4 then Move_tr_y(15,xt,y1-1,a)
                 Else Move_tr_y(15,xt,y1+1,a);
                 Find(15,xt,yt,a); Move_tr(15,x1-1,y1,a)
               end;
     Move_tr(15,x1,y1,a);
   Until false;
End;

Procedure Move_y(p: integer; x,y: integer; Var A: mang);
Var x1,y1,xt,yt: integer;
Begin
 Repeat
   Find(p,x1,y1,a); Find(15,xt,yt,a);
   If y1=y then exit;
   If y1>y then
   begin
     Find(p,x1,y1,a); If y1=y then exit;
     Find(15,xt,yt,a);
     If x1< 4 then
     begin
       Move_tr_x(15,x1+1,y1,a);
       Move_tr_y(15,x1+1,y1,a);
     end;
     Find(15,xt,yt,a);
     Move_tr_y(15,x1,y1-1,a);Move_tr_y(15,x1,y1-1,a);
     move_tr(15,x1,y1,a);
   end
   Else If y1<y then
        begin
          Find(p,x1,y1,a); If y1=y then exit;
          Find(15,xt,yt,a);
          If x1< 4 then
          begin
            Move_tr_x(15,x1+1,y1,a);
            Move_tr_y(15,x1+1,y1,a);
          end;
          Find(15,xt,yt,a);
          Move_tr_y(15,x1,y1+1,a);
          Move_tr_y(15,x1,y1+1,a);
          Move_tr(15,x1,y1,a);
        end;
 Until false;
End;

Procedure move_pt(p: integer; x,y: integer; Var A: mang);
Var x1,y1: integer;
Begin
 If A[x,y]=p then exit;
 Move_tr_y(16,x,y,a);
 Move_tr_x(16,x,y,a);
 Find(p,x1,y1,a);
 If x1=x then
 begin
   Move_y(p,x,y+1,a); Move_tr(16,x,y+1,a);
   exit;
 end;
 Move_x(p,x+1,y,a); Move_y(p,x+1,y,a); Move_tr(16,x+1,y,a);
End;

Procedure Chiamang;
Var i,j,x,y: integer;
Begin
 Fillchar(Dd,sizeof(dd),0);
 For i:=1 to 4 do
 begin
   Find_bigger(7,x,y,md); Dd[md[x,y]]:=1;
   Move_pt(md[x,y],1,i,md);
 end;
 For i:=1 to 2 do
 begin
   Find_bigger(7,x,y,md); Dd[md[x,y]]:=1;
   Move_pt(md[x,y],2,i,md);
 end;
End;

Procedure laymang;
Var i,j: integer;
Begin
 Fillchar(Ma,sizeof(Ma),0);
 If ct=0 then
 begin
   For i:=1 to 2 do
     For j:=1 to 4 do MA[i,j]:=Md[i,j];
   Find(15,i,j,Ma); MA[i,j]:=7; Find(16,i,j,Ma); MA[i,j]:=8
 end
 Else
   For i:=3 to 4 do
     For j:=1 to 4 do Ma[i-2,j]:=Md[i,j]-6;
End;

Procedure Solution;
Var i: integer;
Begin
 New(q1);
 Fillchar(q1^,sizeof(q1^),0);
 Assign(f,fo); Rewrite(f);
 Init; Chiamang;
 Move_tr_y(15,2,3,md);
 Move_tr_x(15,2,3,md);
 Move_tr_y(16,2,4,md);
 Move_tr_x(16,2,4,md);
 ct:=0; Laymang; Loang;
 For i:=1 to 4 do Md[1,i]:=i;
 md[2,1]:=5; md[2,2]:=6;
 Move_pt(7,2,3,md);
 Move_pt(8,2,4,md);
 ct:=1;
 Laymang; Loang;
 Writeln(f,sl);
 Close(f);
 Dispose(q1);
End;

BEGIN
 Clrscr;
 time:=meml[0:$46C];
 Writeln('Please wait.');
 Nhap;
 Solution;
 Writeln((meml[0:$46C]-time)/18.2:8:2);
END.