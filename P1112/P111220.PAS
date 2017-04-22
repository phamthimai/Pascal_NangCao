{$R+,B-}
Program P111220;   {Bai toan Nguoi gac rung}
Uses  Crt;
Type  arr=array [1..30] of integer;
Const ngat1=18.2*5;
      ngat2=18.2*30;
      inp='INPUT.DAT';
Var   f: text;
      a: array [1..30,1..30] of integer;
      d,best: longint;
      luu,b: arr;
      n,i: integer;
      t1: longint;
      t2: longint absolute 0:$46c;
      cx: array [1..30] of boolean;

Procedure Nhap;
Var i,j: integer;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to n do
   For j:=1 to n do Read(f,a[i,j]);
 Close(f);
End;

Procedure Khoitao;
Var i:integer;
Begin
 t1:=t2;
 best:=maxlongint;
 Repeat
   FillChar(cx,Sizeof(cx),1);
   d:=0;
   b[1]:=random(n)+1;
   cx[b[1]]:=false;
   For i:=2 to n do
   begin
     Repeat b[i]:=random(n)+1; Until cx[b[i]];
     cx[b[i]]:=false;
     d:=d+a[b[i-1],b[i]];
     If d>best then break;
   end;
   If d+a[b[n],b[1]]<best then
   begin
     best:=d+a[b[n],b[1]];
     luu:=b;
   end;
 Until t2-t1>ngat1;
 FillChar(cx,sizeof(cx),1);
End;

Procedure Ghinhan;
Begin
 If d+a[b[n],b[1]]<best then
 begin
   best:=d+a[b[n],b[1]];
   luu:=b;
 end;
End;

Procedure Duyet(i: integer);
Var j: integer;
Begin
 If t2-t1>ngat2 then exit;
 For j:=1 to n do
   If cx[j] then
   begin
     b[i]:=j;
     cx[j]:=false;
     d:=d+a[b[i-1],b[i]];
     If i=n then ghinhan Else duyet(i+1);
     d:=d-a[b[i-1],b[i]];
     cx[j]:=true;
   end;
End;

Procedure Inkq;
Var i: integer;
Begin
 ClrScr;
 Writeln(best);
 For i:=1 to n do Write(luu[i],' ');
 Readln;
End;

BEGIN
 Nhap;
 Khoitao;
 For i:=1 to n do
 begin
   b[1]:=i;
   cx[i]:=false;
   d:=0;
   duyet(2);
   cx[i]:=true;
 end;
 inkq;
END.
10
7 8 4 7 9 7 8 4 7 9
2 6 4 8 3 2 6 4 8 3
2 9 4 3 9 2 9 4 3 9
4 6 3 8 6 4 6 3 8 6
3 6 4 8 9 3 6 4 8 9
7 8 4 7 9 7 8 4 7 9
2 6 4 8 3 2 6 4 8 3
2 9 4 3 9 2 9 4 3 9
4 6 3 8 6 4 6 3 8 6
3 6 4 8 9 3 6 4 8 9