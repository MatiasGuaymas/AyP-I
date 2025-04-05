{3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos (mínimos).
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).}

program ejercicio4;
const
    relacion = 23.435;
    dim = 2400;
type
    establecimiento = record
        cue: integer;
        nombre: string;
        cantDocentes: integer;
        cantAlumnos: integer;
        localidad: string;
    end;
procedure leerEstablecimiento(var e: establecimiento);
begin
    writeln('Ingrese el CUE');
    readln(e.cue);
    writeln('Ingrese el nombre del establecimiento');
    readln(e.nombre);
    writeln('Ingrese la cantidad de docentes totales en el establecimiento');
    readln(e.cantDocentes);
    writeln('Ingrese la cantidad de alumnos totales en el establecimiento');
    readln(e.cantAlumnos);
    writeln('Ingrese la localidad del establecimiento');
    readln(e.localidad);
end;
function relDocenteAlumno(cantAlu: integer; cantDoc: integer): real;
begin
    relDocenteAlumno:= cantAlu / cantDoc;
end;
procedure minimo(relDocAlu: real; cue: integer; nombre: string; var min1, min2: real; var cueMin1, cueMin2: integer; var nomMin1, nomMin2: string);
begin
    if(relDocAlu <= min1) then
        begin
            cueMin2:= cueMin1;
            cueMin1:= cue;
            nomMin2:= nomMin1;
            nomMin1:= nombre;
            min2:= min1;
            min1:= relDocAlu;
        end
    else
        if(relDocAlu <= min2) then
            begin
                min2:= relDocAlu;
                cueMin2:= cue;
                nomMin2:= nombre;
            end;
end;
procedure relevamientoPrimarias(var escuelasLP, cueMin1, cueMin2: integer; var nomMin1, nomMin2: string);
var
    e: establecimiento;
    relDocAlu, min1, min2: real;
    i: integer;
begin
    min1:= 9999;
    min2:= 9999;
    for i:= 1 to dim do
        begin
            leerEstablecimiento(e);
            relDocAlu := relDocenteAlumno(e.cantAlumnos, e.cantDocentes);
            if(e.localidad = 'La Plata') and (relDocAlu > relacion) then
                escuelasLP:= escuelasLP + 1;
            minimo(relDocAlu, e.cue, e.nombre, min1, min2, cueMin1, cueMin2, nomMin1, nomMin2);
        end;
end;
var
    escuelasLP, cueMin1, cueMin2: integer; 
    nomMin1, nomMin2: string;
begin
    escuelasLP:= 0;
    relevamientoPrimarias(escuelasLP, cueMin1, cueMin2, nomMin1, nomMin2);
    writeln('La cantidad de escuelas de La Plata con una relacion de alumnos por docente superior a la sugerida por UNESCO es: ', escuelasLP);
    writeln('Escuelas con mejor relacion entre docentes y alumnos:');
    writeln('1. ', ' CUE=', cueMin2, ' Nombre=', nomMin2);
    writeln('2. ', ' CUE=', cueMin1, ' Nombre=', nomMin1);
end.