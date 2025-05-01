{5. Se lee información de empleados que trabajaron en la empresa “DotCom”. De cada empleado se lee código,
nombre y apellido, DNI, área en la que trabaja y año de ingreso. Almacenar la información separada para los
empleados que trabajan en la empresa, un listado de empleados que trabajan desde el 2024 y otro listado de
los empleados que ingresaron antes del 2024. La lectura finaliza cuando se ingresa el año de ingreso 0. Una vez
leída y almacenada la información se desea:
a. Informar los nombres y apellidos de los empleados que ingresaron desde el 2024.
b. Informar los nombre y apellidos de los empleados que ingresaron antes del 2024.}

program ejercicio5;
uses GenericLinkedList;
type
    empleado = record
        codigo: integer;
        nombre: string;
        apellido: string;
        dni: integer;
        area: string;
        anioIngreso: integer;
    end;
    ListaEmpleados = specialize LinkedList <empleado>;
procedure leerEmpleado(var emp: empleado);
begin
    writeln('Ingrese el código del empleado: ');
    readln(emp.codigo);
    if emp.codigo <> 0 then begin
        writeln('Ingrese el nombre del empleado: ');
        readln(emp.nombre);
        writeln('Ingrese el apellido del empleado: ');
        readln(emp.apellido);
        writeln('Ingrese el DNI del empleado: ');
        readln(emp.dni);
        writeln('Ingrese el área del empleado: ');
        readln(emp.area);
        writeln('Ingrese el año de ingreso del empleado: ');
        readln(emp.anioIngreso);
    end;
end;
procedure armarListasEmpleados(var leAntes2024, leDesde2024: ListaEmpleados);
var
    emp: empleado;
begin
    leAntes2024 := ListaEmpleados.create();
    leDesde2024 := ListaEmpleados.create();
    leerEmpleado(emp);
    while emp.codigo <> 0 do begin
        if emp.anioIngreso < 2024 then
            leAntes2024.add(emp)
        else
            leDesde2024.add(emp);
        leerEmpleado(emp);
    end;
end;
procedure imprimirEmpleados(le: ListaEmpleados);
begin
    le.reset();
    while not le.eol() do begin
        writeln('Nombre: ', le.current.nombre, ' Apellido: ', le.current.apellido);
        le.next();
    end;
end;
var
    leAntes2024, leDesde2024: ListaEmpleados;
begin
    armarListasEmpleados(leAntes2024, leDesde2024);
    writeln('Empleados que ingresaron desde el 2024:');
    imprimirEmpleados(leDesde2024);
    writeln('Empleados que ingresaron antes del 2024:');
    imprimirEmpleados(leAntes2024);
end.
