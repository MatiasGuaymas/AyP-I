{1. Dado el siguiente programa:
a. Completar el programa principal para que lea información de alumnos (código, nombre,
promedio) e informe la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno
con código 0. Nota: utilizar el módulo leer.
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe
también el nombre del alumno con mejor promedio.}

program Registros;
type
    alumno = record
        codigo : integer;
        nombre : string;
        promedio : real;
    end;
procedure leer(var alu : alumno);
begin
    writeln('Ingrese el codigo del alumno');
    read(alu.codigo);
    if (alu.codigo <> 0) then begin
        writeln('Ingrese el nombre del alumno');
        read(alu.nombre);
        writeln('Ingrese el promedio del alumno');
        read(alu.promedio);
    end;
end;
procedure mejorPromedio (alu : alumno; var maxP: real; var maxA: string);
 begin
     if (alu.promedio > maxP) then begin
        maxP:= alu.promedio;
        maxA:= alu.nombre;
     end;
 end;
{declaración de variables del programa principal}
var 
    a : alumno;
    cant: integer;
    maxProm : real;
    maxAlum: string;
 begin 
    cant:= 0;
    leer(a);
    maxProm := -1;
    maxAlum := '';
    while (a.codigo <> 0 ) do begin
        cant:= cant + 1;
        mejorPromedio(a, maxProm, maxAlum);
        leer(a);
    end;
    Writeln ('La cantidad de alumnos leídos es ', cant);
    Writeln ('El alumno con mejor promedio 	es ', maxAlum); 
 end.
