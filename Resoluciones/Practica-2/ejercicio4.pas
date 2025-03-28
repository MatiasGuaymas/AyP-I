{4. a. Realice un módulo que reciba dos números enteros y retorne la suma de los mismos.
b. Implemente un programa que invoque al módulo del inciso a, e informe lo pedido.}

program ejercicio4;
function suma(a, b: integer): integer;
begin
    suma:= a + b;
end;
var
    a, b: integer;
begin
    readln(a);
    readln(b);
    writeln('La suma de los numeros es: ', suma(a, b));
end.