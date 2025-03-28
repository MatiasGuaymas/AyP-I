{2. Dado el siguiente programa, indicar cuál es el error.}

program alcance4;
function cuatro: integer;
begin
    cuatro:= 4;
end;
var a: integer;
begin
    cuatro;
    writeln(a); // Error: "a" no se le asigna ningún valor. "a" tiene valor basura.
end.