<html>

<head>
<title></title>
</head>

<body>

<pre>Program P100220;{Olimpic 1995}
Uses crt;
Const fdi = 'index.dat';
      fmi = 'code.dat';
      fi  = 'input.txt';
      fo  = 'output.txt';</pre>

<pre>Var f:text;
    vt:array['A'..'Z'] of byte;
    ma:array[1..26] of char;
    s:string;</pre>

<pre>Procedure input;
Var i:byte;
    ch:char;
Begin
 Assign(f,fi);
 Reset(f);
 Readln(f,s);
 Close(f);
 Assign(f,fdi);
 Reset(f);
 For ch:='A' to 'Z' do Read(f,vt[ch]);
 Close(f);
 Assign(f,fmi);
 Reset(f);
 For i:=1 to 26 do Read(f,ma[i]);
 Close(f);
End;</pre>

<pre>Procedure work;
Var i:byte;
Begin
 For i:=1 to length(s) do
 If s[i] in ['A'..'Z'] then s[i]:=ma[vt[s[i]]] else s[i]:=' ';
End;</pre>

<pre>Procedure output;
Begin
 Assign(f,fo);
 reWrite(f);
 Writeln(f,s);
 Close(f);
End;</pre>

<pre>Begin
 input;
 work;
 output;
End.</pre>
</body>
</html>
