{6. Realice un programa para procesar los datos de los 1500 empleados administrativos de la Facultad. De cada
empleado se conoce: DNI, Apellido, Nombre, fecha de nacimiento (día, mes, año) y el nombre de oficina en donde
desempeña sus tareas dentro de la facultad. Realizar un módulo para cada ítem:
a. Leer la información de los empleados y almacenarla.
b. Informar el Apellido y Nombre de los empleados que trabajan en una oficina que se recibe como parámetro.
c. Informar el Apellido y Nombre de los empleados que trabajan en una oficina que se recibe como parámetro
(atención: los empleados están ordenados por nombre de oficina).
d. Informar el total de empleados por oficina (atención: los empleados están ordenados por nombre de oficina).
e. Informar la cantidad de empleados que cumplen años en cada mes.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos.}

program ejercicio6;
const
    MAX_EMPLEADOS = 2;
type
    fecha = record
        dia: integer;
        mes: integer;
        anio: integer;
    end;
    empleado = record
        dni: integer;
        apellido: string;
        nombre: string;
        fechaNac: fecha;
        oficina: string;
    end;
    vectorEmpleados = array[1..MAX_EMPLEADOS] of empleado;
    vectorContador = array[1..12] of integer;
procedure leerFecha(var f: fecha);
begin
    writeln('Ingrese el dia de nacimiento: ');
    readln(f.dia);
    writeln('Ingrese el mes de nacimiento: ');
    readln(f.mes);
    writeln('Ingrese el anio de nacimiento: ');
    readln(f.anio);
end;
procedure leerEmpleado(var emp: empleado);
begin
    writeln('Ingrese el DNI del empleado: ');
    readln(emp.dni);
    writeln('Ingrese el apellido del empleado: ');
    readln(emp.apellido);
    writeln('Ingrese el nombre del empleado: ');
    readln(emp.nombre);
    writeln('Ingrese la fecha de nacimiento (dia-mes-anio): ');
    leerFecha(emp.fechaNac);
    writeln('Ingrese la oficina donde trabaja: ');
    readln(emp.oficina);
end;
procedure cargarEmpleados(var vec: vectorEmpleados);
var
    i: integer;
begin
    for i:= 1 to MAX_EMPLEADOS do begin
        writeln('Empleado ', i, ': ');
        leerEmpleado(vec[i]);
    end;
end;
procedure imprimirVector(v: vectorEmpleados);
var
    i: integer;
begin
    for i:= 1 to MAX_EMPLEADOS do begin
        writeln('DNI: ', v[i].dni, ' Apellido: ', v[i].apellido, ' Nombre: ', v[i].nombre, 
                ' Fecha de Nacimiento: ', v[i].fechaNac.dia, '-', v[i].fechaNac.mes, '-', v[i].fechaNac.anio, 
                ' Oficina: ', v[i].oficina);
    end;
end;
procedure empleadosPorOficina(v: vectorEmpleados; oficina: string);
var
    i: integer;
begin
    for i:= 1 to MAX_EMPLEADOS do begin
        if (v[i].oficina = oficina) then begin
            writeln('Apellido: ', v[i].apellido, ' Nombre: ', v[i].nombre);
        end;
    end;
end;
procedure empleadosPorOficinaOrdenados(v: vectorEmpleados; oficina: string);
var
    i: integer;
begin
    i:= 1;
    while (i <= MAX_EMPLEADOS) and (v[i].oficina < oficina) do begin
        i:= i + 1;
    end;
    while (i <= MAX_EMPLEADOS) and (v[i].oficina = oficina) do begin
        writeln('Apellido: ', v[i].apellido, ' Nombre: ', v[i].nombre);
        i:= i + 1;
    end;
end;
procedure totalEmpleadosPorOficina(v: vectorEmpleados);
var
    i: integer;
    contador: integer;
    oficinaActual: string;
begin
    i:= 1;
    while (i <= MAX_EMPLEADOS) do begin
        oficinaActual := v[i].oficina;
        contador := 0;
        while (i <= MAX_EMPLEADOS) and (v[i].oficina = oficinaActual) do begin
            contador := contador + 1;
            i:= i + 1;
        end;
        writeln('Oficina: ', oficinaActual, ' Total: ', contador);
    end;
end;
procedure inicializarContador(var vecContador: vectorContador);
var
    i: integer;
begin
    for i:= 1 to 12 do
        vecContador[i] := 0;
end;
procedure contarCumpleanios(v: vectorEmpleados; var vecContador: vectorContador);
var
    i: integer;
begin
    for i:= 1 to MAX_EMPLEADOS do begin
        vecContador[v[i].fechaNac.mes] := vecContador[v[i].fechaNac.mes] + 1;
    end;
end;
procedure imprimirCumpleanios(vecContador: vectorContador);
var
    i: integer;
begin
    for i:= 1 to 12 do begin
        writeln('Mes ', i, ': ', vecContador[i]);
    end;
end;
var
    v: vectorEmpleados;
    oficinaBuscada: string;
    vecContador: vectorContador;
    i: integer;
begin
    cargarEmpleados(v);
    writeln('Empleados: ');
    imprimirVector(v);
    
    writeln('Ingrese la oficina a buscar: ');
    readln(oficinaBuscada);
    writeln('Empleados en la oficina ', oficinaBuscada, ': ');
    empleadosPorOficina(v, oficinaBuscada);
    
    writeln('Ingrese la oficina a buscar (ordenados): ');
    readln(oficinaBuscada);
    writeln('Empleados en la oficina ', oficinaBuscada, ' (ordenados): ');
    empleadosPorOficinaOrdenados(v, oficinaBuscada);
    
    writeln('Total de empleados por oficina: ');
    totalEmpleadosPorOficina(v);
    
    inicializarContador(vecContador);
    contarCumpleanios(v, vecContador);
    writeln('Cantidad de empleados que cumplen anios en cada mes: ');
    imprimirCumpleanios(vecContador);
end.
