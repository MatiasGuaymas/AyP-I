{8. La empresa de juegos de mesa Cracovia quiere analizar el entorno competitivo utilizando el modelo de las 5
fuerzas de Porter. Para ello se leen datos de las empresas del sector, de cada empresa se lee su número de CUIT,
nombre, provincia, la fuerza analizada (1. Rivalidad entre competidores, 2. Productos sustitutos, 3.
Competidores potenciales, 4. Proveedores y 5. Compradores) y la presión competitiva que posee (1.baja,
2.media, 3.alta). La información de las empresas se lee de manera ordenada por número de CUIT y para un
mismo CUIT puede tener 1 o más fuerzas analizadas. Finaliza la lectura cuando se ingresa el número de CUIT -1.
Se pide:
a. Generar una lista que contenga para cada número de CUIT de empresa la cantidad de fuerzas analizadas.
Debe quedar ordenada en el mismo orden de lectura. Luego recorrer la lista e informar cuit y cantidad de
fuerzas.
b. Calcular e informar la fuerza menos utilizada.
c. Calcular la cantidad de fuerzas con presión competitiva baja de la provincia de Buenos Aires
Nota: Hacer el programa principal. Modularizar la solución.}

Program ejercicio8;
uses GenericLinkedList;
Type
    empresa = record
        cuit: integer;
        nombre: string;
        provincia: string;
        fuerza: integer;
        presion:integer;
    end;
    resultadoEmpresa = record
        cuit: integer;
        cantFuerzas: integer;
    end;
    vectorfuerzas = array[1..5] of integer;
    ListaEmpresas = specialize LinkedList<resultadoEmpresa>;
procedure inicializarFuerzas(var vf: vectorFuerzas);
var
    i:integer;
begin
    for i:= 1 to 5 do
        vf[i] := 0;
end;
function fuerzaMenor(vf: vectorFuerzas): integer;
var
    i,posmin: integer;
    min: integer;
begin
    min:= 999; // inicializo variable en un valor muy grande;
    For i:= 1 to 5 do begin
        if (vf[i] < min) then begin
            min:=vf[i];
            posmin:= i;
        end;
    end;
    fuerzaMenor:= posmin;
end;
procedure leerEmpresa(var e:empresa);
begin
    read(e.cuit);
    if (e.cuit <> -1) then begin
        read(e.nombre);
        read(e.provincia);
        read(e.fuerza);
        read(e.presion);
    end;
end;
procedure imprimirLista (lEmp:listaEmpresas);
begin
    lEmp.reset();
    while (not lEmp.eol())do begin
        Writeln (lEmp.current().cuit);
        Writeln (lEmp.current().cantFuerzas);
        lEmp.next();
    end;
end;
procedure procesarEmpresas ( var vf: vectorFuerzas; var lEmp: listaEmpresas; var cantF: integer);
var 
    emp : empresa;
    cuitActual, cant: integer; 
    re: resultadoEmpresa;
begin
    lEmp := ListaEmpresas.create(); // punto c . inicializo la lista de empresas con exito.
    cantF:= 0;
    leerEmpresa(emp);
    while (emp.cuit <> -1) do begin // leo información de empresas.
        re.cuit := emp.cuit; // guardo cuit que se puede repetir
        re.cantFuerzas:=0;
        while (emp.cuit <> -1) and (re.cuit = emp.cuit) do begin // lee mientras sea el mismo cuit - (puede no estar la primera condición)
            re.cantFuerzas:= re.cantFuerzas + 1; // a. acumulo de esta empresa
            vf[emp.fuerza]:= vf[emp.fuerza] + 1 ; //b. acumulo segun fuerza en el vector contador
            if (emp.presion = 1) and (emp.provincia = 'Buenos Aires') then
                cantF:= cantF + 1; // c. totaliza la fuerzas con dos condiciones
            leerEmpresa(emp);
        end;
        lEmp.add(re); // agrego a la lista en el mismo orden de lectura
    end;
    ImprimirLista(lEmp);
end;
var
    vf: vectorFuerzas;
    lEmp: ListaEmpresas;
    cantFuerzas:integer;
begin
    inicializarFuerzas(vf); // punto b. inicializo el vector contador
    procesarEmpresas(vf, lEmp, cantFuerzas); // punto a, b y c
    {Puedo informar en el programa principal o puedo informar en los procedimientos}
    // punto a
    Writeln ('La cantidad de fuerzas con presión competitiva baja de la provincia de Bs As ', cantFuerzas);
    Writeln ('La fuerza que menos empresas analizaron es ', fuerzaMenor(vf)); // punto b
end.