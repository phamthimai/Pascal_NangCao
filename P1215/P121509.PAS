Program P121509;
Uses  Crt;
Const Nmax = 100;
      EndTimeMax = 5000;
      inp = 'input.txt';
      out = 'output.txt';
Type  mang1 = array [1..Nmax] of integer;
      mang2 = array [0..EndTimeMax] of integer;
Var   n: integer;
      T1,T2: mang1;
      EndTime: integer;
      Leng: integer;
      Songuoi: mang2;
      Bosung: mang2;
      L: mang2;
      Tr: mang2;
      TimeMin,Pre: integer;
      F: text;
      Vt: mang1;
      SoThayDoi: integer;

Procedure readfile;
Var i: integer;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,EndTime);
 Readln(f,N);
 For i:=1 to n do Read(f,T1[i],T2[i]);
 Readln(f,Leng);
 Close(f);
End;

Procedure Tassign;
Begin
 Assign(f,out); Rewrite(f);
End;

Procedure Tclose;
Begin
 Close(f);
End;

Function CauA: boolean;
Var k,i: integer;
Begin
 Fillchar(Songuoi,sizeof(songuoi),0);
 For k:=1 to n do
   For i:=T1[k] to T2[k] do Inc(songuoi[i]);
 CauA:=false;
 For i:=0 to EndTime do
   If songuoi[i]<2 then exit;
 CauA:=true;
End;

Procedure CauB;
Var i,l,r,j: integer;
Begin
 i:=0;
 While i<=EndTime do
 begin
   While (i<=Endtime)and(SoNguoi[i]>=2) do Inc(i);
   l:=i;
   While (i<=Endtime)and(songuoi[i]=songuoi[l]) do Inc(i);
   If l<=i-1 then writeln(f,l,' ',i-1,' ',songuoi[l]);
 end;
End;

Procedure CauC;
Var sl,i,l,r,j: integer;
Begin
 i:=0;
 Fillchar(bosung,sizeof(bosung),0);
 sl:=0;
 While i<=EndTime do
 begin
   While (i<=Endtime)and(SoNguoi[i]>=2) do inc(i);
   If i<=EndTime then
   begin
     l:=i;
     While (i<=Endtime)and(songuoi[i]=songuoi[l])
       and(i+1-l<leng) do Inc(i);
     bosung[l]:=2-songuoi[l];
     sl:=sl+bosung[l];
     i:=l+leng;
   end;
 end;
 Writeln(f,sl);
 For i:=0 to EndTime do
   For j:=1 to Bosung[i] do Writeln(f,i,' ',i+leng-1);
End;

Function CauD: boolean;
Var max,t,i,j: integer;
Begin
 Fillchar(l,sizeof(l),0);
 max:=0;
 L[0]:=1;
 Timemin:=maxint;
 For i:=1 to n do
 begin
   t:=t2[i]+1-t1[i];
   For j:=max downto 0 do
     If (l[j]>0)then
     begin
       If (j+t>=Endtime)then
       begin
         If (Timemin>j+t) then
         begin
           TimeMin:=j+t;
           Pre:=i;
         end;
       end
       Else
       If l[j+t]=0 then
       begin
         l[j+t]:=1;
         tr[j+t]:=i;
       end;
     end;
   max:=max+t;
   If max>=Endtime then max:=EndTime;
 end;
 max:=0;
 For i:=1 to n do max:=max+t2[i]+1-t1[i];
 CauD:=false;
 If max-TimeMin<EndTime+1 then exit;
 Writeln(f,'Yes');
 Fillchar(Vt,sizeof(Vt),0);
 Vt[pre]:=1;
 i:=TimeMin-T2[pre]-1+t1[pre];
 While i>0 do
 begin
   pre:=tr[i];
   i:=i-T2[pre]-1+t1[pre];
   Vt[Pre]:=1;
 end;
 t:=0;
 sothaydoi:=0;
 For i:=1 to n do
   If Vt[i]=1 then
   begin
     If t1[i]<>t then
     begin
       Writeln(f,i,' ',t,' ',t+t2[i]-t1[i]);
       Inc(sothaydoi);
     end;
     t:=t+t2[i]+1-t1[i];
     If t>=EndTime then break;
   end;
 t:=0;
 For i:=1 to n do
   If Vt[i]=0 then
   begin
     If t1[i]<>t then
     begin
       Writeln(f,i,' ',t,' ',t+t2[i]-t1[i]);
       Inc(sothaydoi);
     end;
     t:=t+t2[i]+1-t1[i];
     If t>=EndTime then break;
   end;
 CauD:=true;
End;

Function CauE: boolean;
Var max,t,i,j: integer;
Begin
 Writeln(f,sothaydoi);
 t:=0;
 For i:=1 to n do
   If Vt[i]=1 then
   begin
     If t1[i]<>t then
       Writeln(f,i,' ',t,' ',t+t2[i]-t1[i]);
     t:=t+t2[i]+1-t1[i];
     If t>=EndTime then break;
   end;
 t:=0;
 For i:=1 to n do
   If Vt[i]=0 then
   begin
     If t1[i]<>t then
       Writeln(f,i,' ',t,' ',t+t2[i]-t1[i]);
     t:=t+t2[i]+1-t1[i];
     If t>=EndTime then break;
   end;
 CauE:=true;
End;

Procedure solve;
Begin
 Tassign;
 If Not CauA then
 begin
   Writeln(f,'No');
   CauB;
   CauC;
   If CauD then CauE Else Writeln(f,'No');
 end
 Else Writeln(f,'Yes');
 Tclose;
End;

BEGIN
 Readfile;
 Solve;
END.