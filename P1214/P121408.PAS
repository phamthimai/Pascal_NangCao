Program P121408;   {Chuyen cho de tranh ke thu}
Uses  Crt;
Const fi = 'P121408.inp';
      fo = 'P121408.out';
Var   f: text;
      n,dem: byte;
      t,p: array [1..200] of byte;
      dx : array [1..200,1..200] of byte;

Procedure Input;
Var i,j: byte;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,n);
 For i:=1 to 2*n do
 begin
   For j:=1 to 2*n do Read(f,dx[i,j]);
   Readln(f);
 end;
 Close(f);
End;

Procedure Swap(Var a,b: byte);
Var tg: byte;
Begin
 tg:=a; a:=b; b:=tg;
End;

Procedure Work;
Var i,a,b,c,d,j,i1,j1,x1,x2: byte; ok: boolean;
Begin
 For i:=1 to 2*n do t[i]:=i;
 Repeat
   ok:=true;
   For i:=1 to 2*n do
   begin
     If i<2*n then j:=i+1 Else j:=1;
     a:=t[i]; b:=t[j];
     If dx[a,b]=1 then
     begin
       ok:=false;
       For i1:=1 to 2*n do
       begin
         If i1<2*n then j1:=i1+1 Else j1:=1;
         If (i1<>i)and(i1<>j)and(j1<>i) then
         begin
           c:=t[i1];
           d:=t[j1];
           If (dx[b,d]=0)and(dx[a,c]=0) then
           begin
             dem:=0;
             x1:=j1;
             Repeat
               inc(dem);
               p[dem]:=x1;
               If x1<2*n then inc(x1) Else x1:=1;
             Until x1=i;
             inc(dem);
             p[dem]:=x1;
             For x1:=1 to dem div 2 do
             swap(t[p[x1]],t[p[dem-x1+1]]);
             break;
           end;
         end;
       end;
     end;
   end;
 Until ok;
 Writeln;
 For i:=1 to 2*n do Write(' ',t[i]);
 Readln;
End;

BEGIN
 Clrscr;
 Input;
 Work;
END.