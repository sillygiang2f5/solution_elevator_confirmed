uses crt;
var ar,b,res:array[1..10001] of integer;
    i,k,w:integer;

procedure inpf();
var f:text;
    i,n:integer;
begin
        i:=1;
        assign(f,'thangmay.inp');
        reset(f);
        while not EOF(f) do
        begin
                read(f,n);
                ar[i]:=n;
                b[i]:=n;
                inc(i);
        end;
        k:=i-1;
end;

procedure MergeSort(a, c: integer);
var
    x, j, i, n1, n2: integer;
    rez: array[1..1000] of integer;
begin
    if c <= a then
        exit
    else
    begin
        x := (a + c) div 2;
        MergeSort(a, x);
        MergeSort(x + 1, c);
        n1 := a;
        n2 := x + 1;
        for i := a to c do
        begin
            if (n1 < x + 1) and ((n2 > c) or (ar[n1] < ar[n2])) then
            begin
                rez[i] := ar[n1];
                inc(n1);
            end
            else
            begin
                rez[i] := ar[n2];
                inc(n2);
            end;
        end;
        for j := a to c do
            ar[j] := rez[j];
    end;
end;

function binaryS ( fr,ls,k :integer):integer;
var md:integer;
begin
    md:=(fr+ls) div 2;
    if res[md]=k then exit(md);
    if fr>ls then exit(0);
    if (res[md]>k) then ls:=md-1 else
        fr:=md+1;
    binaryS:=binaryS(fr,ls,k);
end;

begin
clrscr;
inpf();
    MergeSort(1,k);
    w:=0;
    for i:=1 to k do begin
	if (w + ar[i]<= 500) then begin
                w:=w+ar[i] ;
                res[i]:=ar[i];
                //writeln(w);
        end
        else break;
    end;
    for i:=1 to k do begin
        if(binaryS(1,k,b[i]) <> 0)then write(b[i]:4);

//        write(ar[i]:4);
    end;
    writeln;
    write(w);
readln
end.
