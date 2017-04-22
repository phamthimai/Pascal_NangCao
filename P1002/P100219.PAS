Program P100219;{Olimpic 1995}
Uses crt;
Const fi = 'input.txt';
      fo = 'output.txt';

Var s:string;
    f:text;
    a,d:array[1..1000] of word;
    n:word;

Procedure input;
Begin
 Assign(f,fi);
 Reset(f);
 Read(f,s);
 Close(f);
End;

Procedure xapxep;
Var i,j,tg:word;
Begin
 For i:=1 to n do
 For j:=i+1 to n do
 If a[j]<a[i] then
 Begin
   tg:=a[i];
   a[i]:=a[j];
   a[j]:=tg;
 End;
End;

Procedure output;
Begin
 Assign(f,fo);
 reWrite(f);
 Write(f,s);
 Close(f);
End;

Procedure work;
Var i,j:byte;
    s1:string;
    code,t:integer;
Begin
 n:=0;
 i:=1;
 Repeat
   If s[i] in ['0'..'9'] then
   Begin
     inc(n);
     s1:=s[i];
     d[n]:=i;
     while (i<length(s)) and (s[i+1] in ['0'..'9']) do
     Begin
       inc(i);
       s1:=s1+s[i];
     End;
     val(s1,t,code);
     a[n]:=t;
   End;
   inc(i);
 until i>length(s);
 xapxep;
 For i:=n downto 1 do
 Begin
   j:=d[i];
   while (j<length(s)) and (s[j+1] in ['0'..'9']) do inc(j);
   delete(s,d[i],j-d[i]+1);
   str(a[i],s1);
   insert(s1,s,d[i]);
 End;
End;

Begin
 input;
 work;
 output;
End.