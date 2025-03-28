{1. Dado los siguientes programas indicar qué imprime cada uno.}
{program alcance1;
var a,b: integer;
procedure uno;
var b: integer;
begin
    b := 12;
    writeln(b); // Imprime 12
end;
begin
    a:= 4;
    b:= 5;
    uno;
    writeln(b, a); // Imprime 5 4
end. }

{b. program alcance2;
var a,b: integer;
procedure dos;
begin
    b := 9;
    writeln(b); // Imprime 9
end;
begin
    a:= 4;
    b:= 8;
    dos;
    writeln(b, a); // Imprime 9 4
end. }

{c. program alcance3;
var a: integer;
procedure tres;
var b: integer;
begin
    b:= 5;
    writeln(b); // Deberia imprimir 5
end;
begin
    a:= 6;
    tres;
    writeln(a, b); // Error: b no está definido en este ámbito
end. }