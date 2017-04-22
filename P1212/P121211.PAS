Program P121211;  {Tao petanmino}
Uses  Crt;
Const fn = 'P1212\5MINO.DAT';
      fg = '5MINO.OUT';
      maxsl = 100;
      hang  = 10; { = 12 }
      cot   = 6;  { = 5 }
      slhinh= hang*cot div 5;
      cat  = 180;
Type  luoi = array[1..5,1..5] of byte;
      hinh = record
               sh,sc  :integer;
               dautien: integer; { So 1 dau tien trong hang 1 cua hinh }
               bd     : luoi;
             end;
Var   a : array[1..maxsl] of hinh;
      sl: integer;
      dd: array [-5..hang+5,-5..cot+5] of byte;
      f : text;
      kq: longint;
      t1: longint absolute $000 : $46c;
      t2: longint;

Procedure xemdd;
Var i,j: integer;
Begin
 For j:=1 to cot do
 begin
   For i:=1 to hang do Write( dd[i,j]:4); Writeln;
 end;
 Writeln;
End;

Procedure Nhap;
Var f: text; k,i,j: integer;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,sl);
 For k:=1 to sl do
   With a[k] do
   begin
     Readln(f,sh,sc);
     For i:=1 to sh do
     begin
       For j:=1 to sc do Read(f,bd[i,j]); Readln(f);
     end;
   end;
 Close(f);
End;

Procedure Chuanbi;
Var i,j: integer;
Begin
 FillChar(dd,SizeOf(dd),1);
 For i:=1 to hang do
   For j:=1 to cot do dd[i,j]:=0;
 kq:=0;
End;

Procedure Xem(a: hinh);
Var i,j: integer;
Begin
 With a do
   For i:=1 to sh do
   begin
     For j:=1 to sc do Write(bd[i,j],' '); Writeln;
   end;
End;

Function Bang(a,b: hinh): boolean;
Var i,j: integer;
Begin
 bang:=false;
 With a do
 begin
   If (b.sh<>sh)and(b.sc<>sc) then exit;
   For i:=1 to sh do
     For j:=1 to sc do
       If b.bd[i,j]<>bd[i,j] then exit;
 end;
 bang:=true;
End;

Function Chuaco(chuan: hinh): boolean;
Var i: integer;
Begin
 Chuaco:=false;
 For i:=1 to sl do If bang(a[i],chuan) then exit;
 Chuaco:=true;
End;

Procedure Capnhat(chuan: hinh);
Begin
 Inc(sl);
 a[sl]:=chuan;
End;

Procedure Thunhanxoay(Var chuan: hinh);
Var i,j: integer; cu: hinh;
Begin
 cu:=chuan;
 With chuan do
 begin
   sh:=cu.sc; sc:=cu.sh;
   For i:=1 to sh do
     For j:=1 to sc do bd[i,j]:=cu.bd[sc-j+1,i];
 end;
 If Chuaco(chuan) then Capnhat(chuan);
End;

Procedure Thunhanlat(Var chuan: hinh);
Var i,j: integer; cu: hinh;
Begin
 cu:=chuan;
 With chuan do
 begin
   sh:=cu.sh; sc:=cu.sc;
   For i:=1 to sh do
     For j:=1 to sc do bd[i,j]:=cu.bd[sh-i+1,j];
 end;
 If Chuaco(chuan) then Capnhat(chuan);
End;

Procedure Taotucauhinh(k: integer);
Var hinhchuan: hinh;
Begin
 hinhchuan:=a[k];
 Thunhanxoay(hinhchuan);
 Thunhanxoay(hinhchuan);
 Thunhanxoay(hinhchuan);
 Thunhanlat(hinhchuan);
 Thunhanxoay(hinhchuan);
 Thunhanxoay(hinhchuan);
 Thunhanxoay(hinhchuan);
End;

Procedure Taothemcauhinh;
Var i,sl1: integer;
Begin
 sl1:=sl;
 For i:=1 to sl1 do Taotucauhinh(i);
End;

Function Diemdau(k: integer): integer;
Var j: integer;
Begin
 With a[k] do
   For j:=1 to sc do
     If bd[1,j]=1 then begin diemdau:=j; exit end;
End;

Procedure Taodiemdau;
Var i: integer;
Begin
 For i:=1 to sl do a[i].dautien:=diemdau(i);
End;

Function Vua(k,i,j: integer): boolean;
Var ii,jj: integer;
Begin
 vua:=false;
 With a[k] do
   For ii:=1 to sh do
     For jj:=1 to sc do
       If (dd[i+ii-1,j+jj-dautien]<>0)and(bd[ii,jj]=1) then exit;
 vua:=true;
End;

Procedure Dat(tt,k,i,j: integer);
Var ii,jj: integer;
Begin
 With a[k] do
   For ii:=1 to sh do
     For jj:=1 to sc do
       If bd[ii,jj]=1 then dd[i+ii-1,j+jj-dautien]:=tt;
End;

Procedure Bo(k,i,j: integer);
Var ii,jj: integer;
Begin
 With a[k] do
   For ii:=1 to sh do
     For jj:=1 to sc do
       If bd[ii,jj]=1 then dd[i+ii-1,j+jj-dautien]:=0;
End;

Procedure Ghinhanhinh;
Var i,j: integer;
Begin
 Inc(kq);
 Write(kq,#13);
 For j:=1 to cot do
 begin
   For i:= 1 to hang do  Write(f,dd[i,j]:4); Writeln(f);
 end;
 Writeln(f);
End;

Procedure Ghikq;
Var f: file of char; s: string; i: integer;
Begin
 str(kq,s);
 Assign(f,fg); Reset(f);
 Seek(f,0);
 For i:=1 to length(s) do Write(f,s[i]);
 Close(f);
End;

Procedure Timdiemtiep(Var i,j: integer);
Begin
 While dd[i,j]<>0 do
 begin
   Inc(j);
   If j>cot then begin Inc(i); j:=1; end;
 end;
End;

Procedure Duyet(i,lasti,lastj: integer);
Var k,ii,jj: integer;
Begin
 If i>slhinh then
 begin
   ghinhanhinh;
   If t1-t2>=cat then
   begin
     Close(f);
     ghikq;
     halt;
   end;
   exit;
 end;
 ii:=lasti; jj:=lastj;
 timdiemtiep(ii,jj);
 For k:=1 to sl do
   If vua(k,ii,jj) then
   begin
     dat(i,k,ii,jj);
     duyet(i+1,ii,jj);
     bo(k,ii,jj);
   end;
End;

BEGIN
 t2:=t1;
 ClrScr;
 Assign(f,fg); Rewrite(f);
 Writeln(f,'          ');
 Nhap;
 Chuanbi;
 Taothemcauhinh;
 Taodiemdau;
 Duyet(1,1,1);
 Close(f);
END.