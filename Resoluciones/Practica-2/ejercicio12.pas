{12. Escriba un módulo que reciba 2 números enteros i y n, y calcule la potencia enésima de i (i^n).}

program ejercicio12;
function potencia(i, n: integer): integer;
var
    j, pot: integer;
begin
    pot:= 1;
    for j:= 1 to n do
        pot:= pot * i;
    potencia:= pot;
end;
var
    i, n: integer;
begin
    write('Ingrese un numero entero: ');
    readln(i);
    write('Ingrese la potencia: ');
    readln(n);
    writeln('La potencia de ', i, ' elevado a ', n, ' es: ', potencia(i, n));
end.
