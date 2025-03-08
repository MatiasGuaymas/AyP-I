{4. Realizar un programa que lea 20 números enteros e informe la suma total de los números leídos. 
a. Modifique el ejercicio 4 para que además informe la cantidad de números mayores a 12.}

program ejercicio4;
const
	FIN = 20
var
	num, suma, i, mayores: integer;
begin
    suma:= 0;
    mayores:= 0;
    for i:= 1 to FIN do begin
        readln(num);
	  	suma:= suma + num;
        if (num > 12) then
            mayores:= mayores + 1;
    end;
    writeln('La suma total de los números leídos es:  ', suma);
    writeln('La cantidad de numeros mayores a 5 es: ', mayores);
end.