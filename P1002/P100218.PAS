Program P100218;{Tim xau dai va lon nhat}
Uses crt;
Const fi = 'in.txt';
      fo = 'out.txt';

Var f:text;
    s,s1:string;
    last,d:array[1..255] of byte;
    l:array[1..255] of char;

Procedure input;
Begin
 Assign(f,fi);
 reset(f);
 Readln(f,s);
 Close(f);
End;

Procedure work;
Var i,j,max:byte;
    t:string;
Begin
 Fillchar(last,sizeof(last),0);
 Fillchar(d,sizeof(d),0);
 Fillchar(l,sizeof(l),0);
 For i:=length(s) downto 1 do
 For j:=i-1 downto 1 do
 If (s[j]>s[i]) and (d[j]<=d[i]+1) then
 Begin
   If d[j]<d[i]+1 then
   Begin
     d[j]:=d[i]+1;
     last[j]:=i;
     l[j]:=s[i];
   End
   else If l[j]<s[i] then
   Begin
     d[j]:=d[i]+1;
     last[j]:=i;
     l[j]:=s[i];
   End;
 End;
 t:='0';
 max:=0;
 For i:=1 to length(s) do
 If d[i]>=max then
 Begin
   If d[i]>max then
   Begin
     max:=d[i];
     j:=i;
     t:=l[i];
   End
   else If t<l[i] then
   Begin
     j:=i;
     t:=l[i];
   End;
 End;
 s1:='';
 Repeat
   s1:=s1+s[j];
   j:=last[j];
 Until last[j]=0;
 s1:=s1+s[j];
End;

Procedure output;
Begin
 Assign(f,fo);
 reWrite(f);
 Write(f,s1);
 Close(f);
End;

Begin
 input;
 work;
 output;
End.