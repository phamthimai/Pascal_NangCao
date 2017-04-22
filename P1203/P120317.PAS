{Program P120317;{tinh toan voi xau nhi phan}
{$i P120312.pas}

Type nhiphan=solon;
{Var n1,n2,n3:nhiphan;
     c:char;
     st,sr1:string;}
Procedure haimu(n: byte; Var s: solon);
Var i: byte;
Begin
 Fillchar(s,sizeof(s),0);
 s[0]:=1; s[1]:=1;
 For i:=1 to n do nhannho(s,2);
End;

Procedure dectobin(s: solon; Var n: nhiphan);
Var s1,s3: solon;
Begin
 s1[0]:=1; s1[1]:=2;
 FillChar(n,SizeOf(n),0);
 Repeat
   chia(s,s1,s3);
   Inc(n[0]);
   n[n[0]]:=s3[1];
  Until s[0]=0;
End;

Procedure bintodec(n: nhiphan; Var s: solon);
Var s1: solon; i: byte;
Begin
 Fillchar(s,sizeof(s),0);
 s[0]:=1;
 For i:=1 to n[0] do
 If n[i]=1 then
 begin
   haimu(i-1,s1);
   cong(s,s1);
 end;
End;

Procedure nhanbin(Var n1,n2: nhiphan);
Var s1,s2: solon;
Begin
 bintodec(n1,s1); bintodec(n2,s2);
 nhan(s1,s2);
 dectobin(s1,n1);
End;

Procedure trubin(Var n1,n2: nhiphan);
Var s1,s2: solon;
Begin
 bintodec(n1,s1); bintodec(n2,s2);
 tru(s1,s2);
 dectobin(s1,n1);
End;

Procedure congbin(Var n1,n2: nhiphan);
Var s1,s2: solon;
Begin
 bintodec(n1,s1); bintodec(n2,s2);
 cong(s1,s2);
 dectobin(s1,n1);
End;

Procedure chiabin(Var n1,n2,n3: nhiphan);
Var s1,s2,s3: solon;
Begin
 bintodec(n1,s1); bintodec(n2,s2);
 chia(s1,s2,s3);
 dectobin(s1,n1); dectobin(s3,n3);
End;
 