{9. Realizar un programa que lea por teclado valores que representan la inflación de la provincia de Buenos Aires
en los últimos 12 meses. Se pide:
a. Informar la máxima inflación registrada en un mes.
b. Agregar al inciso a) el código necesario para informar el mes en que se produjo la máxima inflación}

program ejercicio9;
const 
    MESES = 12;
var
    inflacion, max: real;
    i, maxMes: integer;
begin
    for i:= 1 to MESES do
        begin
            writeln('Ingrese la inflacion para el mes ', i+1);
            readln(inflacion);
            if (inflacion > max) then
                begin
                    max:= inflacion;
                    maxMes:= i;
                end;
        end;
    writeln('La maxima inflacion registrada en un mes fue: ', inflacion:0:2, ' y fue en el mes ', i+1);
end;