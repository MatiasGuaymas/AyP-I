{3. Una productora nacional realiza un casting de personas para la selección de actores extras de una nueva película,
para ello se debe leer y almacenar la información de las personas que desean participar de dicho casting. De
cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación que prefiere (1: drama, 2:
romántico, 3: acción, 4: suspenso, 5: terror). La lectura finaliza cuando llega una persona con edad -1. Una vez
finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas con edad par.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no existir.
Invocar dicho módulo en el programa principal.}

program ejercicio3;
uses GenericLinkedList;
type
    regPersona = record
        dni: integer;
        apellido: string;
        nombre: string;
        edad: integer;
        codGenero: integer; // 1: drama, 2: romantico, 3: accion, 4: suspenso, 5: terror
    end;

    listaPersonas = specialize LinkedList<regPersona>;
    vecGeneros = array[1..5] of integer;
procedure leerPersona(var p: regPersona);
begin
    writeln('Ingrese dni: ');
    readln(p.dni);
    if (p.dni <> -1) then begin
        writeln('Ingrese apellido: ');
        readln(p.apellido);
        writeln('Ingrese nombre: ');
        readln(p.nombre);
        writeln('Ingrese edad: ');
        readln(p.edad);
        writeln('Ingrese codigo de genero (1: drama, 2: romantico, 3: accion, 4: suspenso, 5: terror): ');
        readln(p.codGenero);
    end;
end;
procedure cargarListaPersonas(var lp: listaPersonas);
var
    p: regPersona;
begin
    lp:= listaPersonas.create();
    leerPersona(p);
    while (p.dni <> -1) do begin
        lp.add(p);
        leerPersona(p);
    end;
end;
procedure inicializarGeneros(var vg: vecGeneros);
var
    i: integer;
begin
    for i:= 1 to 5 do 
        vg[i]:= 0;
end;
procedure procesarListaPersonas(lp: listaPersonas; var vg: vecGeneros; var cantEdadPar: integer);
begin
    lp.reset();
    while not(lp.eol()) do begin
        if (lp.current().edad mod 2 = 0) then 
            cantEdadPar:= cantEdadPar + 1;
        vg[lp.current().codGenero]:= vg[lp.current().codGenero] + 1;
        lp.next();
    end;
end;
procedure maximosGeneros(vg: vecGeneros; var maxGenero1, maxGenero2: integer);
var
    i, max1, max2: integer;
begin
    max1:= -1;
    max2:= -1;
    for i:= 1 to 5 do begin
        if (vg[i] > max1) then begin
            max2:= max1;
            maxGenero2:= maxGenero1;
            max1:= vg[i];
            maxGenero1:= i;
        end else if (vg[i] > max2) then begin
            max2:= vg[i];
            maxGenero2:= i;
        end;
    end;
end;
procedure eliminarPersona(var lp: listaPersonas; dni: integer);
begin
    lp.reset();
    while ((not lp.eol()) and (lp.current().dni <> dni)) do 
        lp.next();
    if (not lp.eol()) then 
        lp.removeCurrent();
end;
procedure imprimirListaPersonas(lp: listaPersonas);
begin
    lp.reset();
    while not(lp.eol()) do begin
        writeln('DNI: ', lp.current().dni);
        lp.next();
    end;
end;
var
    lp: listaPersonas;
    vg: vecGeneros;
    cantEdadPar, maxGenero1, maxGenero2, dni: integer;
begin
    cargarListaPersonas(lp);
    imprimirListaPersonas(lp);
    inicializarGeneros(vg);
    cantEdadPar:= 0;
    maxGenero1:= -1;
    maxGenero2:= -1;
    procesarListaPersonas(lp, vg, cantEdadPar);
    maximosGeneros(vg, maxGenero1, maxGenero2);
    writeln('Cantidad de personas con edad par: ', cantEdadPar);
    writeln('Los dos generos mas elegidos son: ', maxGenero1, ' y ', maxGenero2);
    writeln('Ingrese dni a eliminar: ');
    readln(dni);
    eliminarPersona(lp, dni);
    writeln('Lista de personas luego de eliminar: ');
    imprimirListaPersonas(lp);
end.
