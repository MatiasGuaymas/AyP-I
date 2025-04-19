{4. Una cátedra dispone de información de sus 3500 estudiantes. De cada estudiante se conoce número de legajo,
apellido, nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por apellido de manera
ascendente. Se pide:
a. Un módulo que retorne la posición del estudiante con un número de legajo recibido por parámetro o debe
retornar -1 si no existe.
b. Un módulo que informe apellido, nombre y número de legajo de todos los estudiantes cuyo apellido comienza
con una letra que se recibe como parámetro. (Acceder al String en la posición 0)
c. Un módulo que retorne la cantidad de estudiantes con cantidad de asistencias a clase en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos.}

program ejercicio4;
const
    LIM = 3500;
type
    estudiante = record
        legajo: integer;
        apellido: string;
        nombre: string;
        asistencias: integer;
    end;
    vectorEstudiantes = array[1..LIM] of estudiante;
procedure leerEstudiante(var e: estudiante);
begin
    writeln('Ingrese el legajo del estudiante: ');
    readln(e.legajo);
    writeln('Ingrese el apellido del estudiante: ');
    readln(e.apellido);
    writeln('Ingrese el nombre del estudiante: ');
    readln(e.nombre);
    writeln('Ingrese la cantidad de asistencias del estudiante: ');
    readln(e.asistencias);
end;
procedure cargarVector(var v: vectorEstudiantes); // Se dispone
var
    i: integer;
begin
    for i := 1 to LIM do begin
        writeln('Ingrese los datos del estudiante ', i, ': ');
        leerEstudiante(v[i]);
    end;
end;
procedure imprimirVector(v: vectorEstudiantes);
var
    i: integer;
begin
    writeln('Listado de estudiantes: ');
    for i := 1 to LIM do begin
        writeln('Legajo: ', v[i].legajo, ' Apellido: ', v[i].apellido, ' Nombre: ', v[i].nombre, ' Asistencias: ', v[i].asistencias);
    end;
end;
function buscarLegajo(v: vectorEstudiantes; legajo: integer): integer;
var
    i: integer;
begin
    i := 1;
    while (i <= LIM) and (v[i].legajo <> legajo) do begin
        i := i + 1;
    end;
    if (i <= LIM) then 
        buscarLegajo := i
    else
        buscarLegajo := -1;
end;
procedure apellidoConLetra(v: vectorEstudiantes; letra: char);
var
    i: integer;
begin
    writeln('Estudiantes cuyo apellido comienza con la letra ', letra, ': ');
    i := 1;
    while (i <= LIM) and (v[i].apellido[1] < letra) do begin
        i := i + 1;
    end;
    while (i <= LIM) and (v[i].apellido[1] = letra) do begin
        writeln('Legajo: ', v[i].legajo, ' Apellido: ', v[i].apellido, ' Nombre: ', v[i].nombre);
        i := i + 1;
    end;
end;
function contarAsistenciasCero(v: vectorEstudiantes): integer;
var
    i, contador: integer;
begin
    contador := 0;
    for i := 1 to LIM do begin
        if (v[i].asistencias = 0) then begin
            contador := contador + 1;
        end;
    end;
    contarAsistenciasCero := contador;
end;
var
    v: vectorEstudiantes;
    legajoBuscado, posicion: integer;
    letra: char;
begin
    cargarVector(v);
    imprimirVector(v);
    
    writeln('Ingrese el legajo a buscar: ');
    readln(legajoBuscado);
    posicion := buscarLegajo(v, legajoBuscado);
    if (posicion <> -1) then 
        writeln('El legajo ', legajoBuscado, ' se encuentra en la posicion ', posicion)
    else
        writeln('El legajo ', legajoBuscado, ' no se encuentra en el vector.');
    
    writeln('Ingrese la letra para buscar apellidos: ');
    readln(letra);
    apellidoConLetra(v, letra);
    
    writeln('Cantidad de estudiantes con asistencias en 0: ', contarAsistenciasCero(v));
end.


