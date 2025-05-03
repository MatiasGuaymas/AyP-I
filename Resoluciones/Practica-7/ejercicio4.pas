{4. Se dispone de información de las universidades en la Provincia de Buenos Aires. De cada universidad se conoce
código, nombre, localidad, monto presupuestario anterior, monto presupuestario actual y año de creación. Se
desea generar dos listas: una con las universidades con más de 50 años de antigüedad y otra con los nombres
de las universidades creadas luego del 2000. Una vez almacenada la información se pide:
a. Informar la cantidad de universidades creadas después del 2000.
b. Informar el porcentaje de aumento presupuestario de todas las universidades creadas entre 1900 y 1950.}

program ejercicio4;
Uses GenericLinkedList;
type
    universidad = record
        codigo: integer;
        nombre: string;
        localidad: string;
        presupuestoAnterior: real;
        presupuestoActual: real;
        anioCreacion: integer;
    end;
    ListaUniversidades = specialize LinkedList <universidad>;
    ListaNombres = specialize LinkedList <string>;
procedure leerUniversidad(var u: universidad); // Se dispone
begin
    readln(u.codigo);
    if (u.codigo <> 0) then begin
        readln(u.nombre);
        readln(u.localidad);
        readln(u.presupuestoAnterior);
        readln(u.presupuestoActual);
        readln(u.anioCreacion);
    end;
end;
procedure armarLista(var lu: ListaUniversidades); // Se dispone
var
    u: universidad;
begin
    lu:= ListaUniversidades.create();
    leerUniversidad(u);
    while (u.codigo <> 0) do begin
        lu.add(u);
        leerUniversidad(u);
    end;
end;
procedure generarListas(lu: ListaUniversidades; var lu50: ListaUniversidades; var ln: ListaNombres);
begin
    lu50:= ListaUniversidades.create();
    ln:= ListaNombres.create();
    lu.reset();
    while (not lu.eol()) do begin
        if (lu.current().anioCreacion < 1975) then
            lu50.add(lu.current());
        if (lu.current().anioCreacion > 2000) then 
            ln.add(lu.current().nombre);
        lu.next();
    end;
end;
function cantidadUniversidades(lu: ListaNombres): integer;
var
    cont: integer;
begin
    cont:= 0;
    lu.reset();
    while (not lu.eol()) do begin
        cont:= cont + 1;
        lu.next();
    end;
    cantidadUniversidades:= cont;
end;
function porcentajeAumento(lu: ListaUniversidades): real;
var
    sumaAumento: real;
    cont: integer;
    aumento: real;
begin
    sumaAumento:= 0.0;
    cont:= 0;
    lu.reset();
    while (not lu.eol()) do begin
        if (lu.current().anioCreacion >= 1900) and (lu.current().anioCreacion <= 1950) then begin
            aumento:= ((lu.current().presupuestoActual - lu.current().presupuestoAnterior) / lu.current().presupuestoAnterior) * 100;
            sumaAumento:= sumaAumento + aumento;
            cont:= cont + 1;
        end;
        lu.next();
    end;
    if (cont > 0) then
        porcentajeAumento:= sumaAumento / cont
    else
        porcentajeAumento:= 0.0;
end;
var
    lu, lu50: ListaUniversidades;
    ln: ListaNombres;
begin
    armarLista(lu);
    generarListas(lu, lu50, ln);
    writeln('Cantidad de universidades creadas después del 2000: ', cantidadUniversidades(ln));
    writeln('Porcentaje de aumento presupuestario de universidades creadas entre 1900 y 1950: ', porcentajeAumento(lu50):0:2, '%');
end.
