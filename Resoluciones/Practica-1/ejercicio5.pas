{5. Realizar un programa que lea números reales hasta que se ingrese uno cuyo valor sea 0. Informar la cantidad de
números leídos.
b. Modifique el ejercicio 5 para que se lean a lo sumo 10 números reales. La lectura deberá finalizar al ingresar
un valor que sea 0, o al leer el décimo número, en cuyo caso deberá informarse “No se ha ingresado el 0”}

program ejercicio5;
var
    num: real;
    cant: integer;
begin
    writeln('Ingrese un numero real');
    readln(num);
    cant:= 0;
    while((num <> 0) and (cant < 10)) do
        begin
            cant:= cant + 1;
            writeln('Ingrese otro numero real');
            readln(num);
        end;
    if (num <> 0) then writeln('No se ha ingresado el 0');
    writeln('La cantidad de numeros leidos es: ', cant);
end.