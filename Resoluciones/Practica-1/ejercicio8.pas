{8. Realizar un programa que lea números que representan códigos de productos correspondientes a juegos para
consolas. La secuencia finaliza al ingresar el código 0, el cual no debe procesarse. Por cada código de producto
se lee además la cantidad vendida y el precio por unidad. Informar el código de producto que se vendió más
veces y el código de producto que más recaudó. Los productos se leen solo una vez.}

program ejercicio8;
const 
    FIN = 0;
var
    codigo, cantVendida, cantMax, codigoMaxV, codigoMaxR: integer;
    precioUnidad, precioMax: real;
begin
    writeln('Ingrese un codigo de juego');
    readln(codigo);
    cantMax := -1;
    precioMax:= -1;
    while (codigo <> FIN) do
        begin
            writeln('Ingrese la cantidad vendida');
            readln(cantVendida);
            writeln('Ingrese el precio por unidad');
            readln(precioUnidad);
            if (cantVendida > cantMax) then
                begin
                    cantMax:= cantVendida;
                    codigoMaxV:= codigo;
                end;
            if (precioUnidad > precioMax) then
                begin
                    precioMax:= precioUnidad;
                    codigoMaxR:= codigo;
                end;
            writeln('Ingrese un codigo de juego');
            readln(codigo);
        end;
    writeln('El codigo de producto que se vendio mas veces es: ', codigoMaxV);
    writeln('El codigo de producto que recuado mas dinero es: ', codigoMaxR);
end.