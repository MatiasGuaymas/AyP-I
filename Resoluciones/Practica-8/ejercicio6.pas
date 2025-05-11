{6. El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos astronómicos
observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas, 2: planetas, 3: satélites,
4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7), nombre
del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su descubrimiento.
a. Desarrolle un programa que lea y almacene en una lista la información de los objetos que han sido
observados. Dicha información se lee hasta encontrar un objeto con código -1. La lista debe mantener el
orden en que fueron leídos los datos.
b. Una vez leídos y almacenados todos los datos, se pide realizar un reporte(informar) con la siguiente
información recorriendo la estructura una sola vez:
i. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
ii. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
iii. La cantidad de objetos observados por cada categoría.
iv. El porcentaje de objetos de la categoría asteroides.
v. El promedio de distancia a la tierra de los objetos de la categoría nebulosa.
c. Realizar un módulo que elimine de la lista todos los objetos cuyo año de descubrimiento es múltiplo de 3.}

program ejercicio6;
uses GenericLinkedList;
type
    regObjeto = record
        codObjeto: integer;
        categoria: integer; // 1: estrellas, 2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas
        nombre: string;
        distancia: real; // años luz
        descubridor: string;
        anioDescubrimiento: integer;
    end;

    listaObjetos = specialize LinkedList <regObjeto>;
    vecContador = array[1..7] of integer;
procedure leerObjeto(var objeto: regObjeto);
begin
    writeln('Ingrese codigo del objeto: ');
    readln(objeto.codObjeto);
    if (objeto.codObjeto <> -1) then begin
        writeln('Ingrese categoria del objeto (1..7): ');
        readln(objeto.categoria);
        writeln('Ingrese nombre del objeto: ');
        readln(objeto.nombre);
        writeln('Ingrese distancia a la Tierra (en años luz): ');
        readln(objeto.distancia);
        writeln('Ingrese nombre del descubridor: ');
        readln(objeto.descubridor);
        writeln('Ingrese año de descubrimiento: ');
        readln(objeto.anioDescubrimiento);
    end;
end;
procedure generarLista(var lista: listaObjetos);
var
    objeto: regObjeto;
begin
    leerObjeto(objeto);
    while (objeto.codObjeto <> -1) do begin
        lista.add(objeto);
        leerObjeto(objeto);
    end;
end;
procedure inicializarVector(var v: vecContador);
var
    i: integer;
begin
    for i := 1 to 7 do
        v[i] := 0;
end;
procedure maximos(var codMasLejano1, codMasLejano2: integer; var maxDistancia1, maxDistancia2: real; codObjeto: integer; distancia: real);
begin
    if (distancia > maxDistancia1) then begin
        codMasLejano2 := codMasLejano1;
        maxDistancia2 := maxDistancia1;
        codMasLejano1 := codObjeto;
        maxDistancia1 := distancia;
    end else if (distancia > maxDistancia2) then begin
        codMasLejano2 := codObjeto;
        maxDistancia2 := distancia;
    end;
end;
procedure imprimirVector(v: vecContador);
var
    i: integer;
begin
    for i := 1 to 7 do begin
        writeln('Categoria ', i, ': ', v[i]);
    end;
end;
procedure informar(lista: listaObjetos);
var
    codMasLejano1, codMasLejano2, cantPlanetasGalileo, cantObjetosTotal, cantAsteroides: integer;
    maxDistancia1, maxDistancia2, sumaNebulosa: real;
    v: vecContador;
begin
    codMasLejano1 := -1;
    codMasLejano2 := -1;
    maxDistancia1 := -1;
    maxDistancia2 := -1;
    cantPlanetasGalileo := 0;
    cantObjetosTotal := 0;
    cantAsteroides := 0;
    sumaNebulosa := 0;
    inicializarVector(v);
    lista.reset();
    while (not lista.eol()) do begin
        maximos(codMasLejano1, codMasLejano2, maxDistancia1, maxDistancia2, lista.current().codObjeto, lista.current().distancia);

        if (lista.current().descubridor = 'Galileo Galilei') and (lista.current().anioDescubrimiento < 1600) then
            cantPlanetasGalileo := cantPlanetasGalileo + 1;

        cantObjetosTotal := cantObjetosTotal + 1;

        v[lista.current().categoria] := v[lista.current().categoria] + 1;

        if (lista.current().categoria = 5) then
            cantAsteroides := cantAsteroides + 1;

        if (lista.current().categoria = 7) then
            sumaNebulosa := sumaNebulosa + lista.current().distancia;

        lista.next();
    end;

    writeln('Los dos objetos más lejanos de la tierra son: ', codMasLejano1, ' y ', codMasLejano2);
    writeln('La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600 es: ', cantPlanetasGalileo);
    writeln('La cantidad de objetos observados por cada categoria es:');
    imprimirVector(v);
    writeln('El porcentaje de objetos de la categoria asteroides es: ', (cantAsteroides * 100) / cantObjetosTotal:0:2, '%');
    if (v[7] > 0) then
        writeln('El promedio de distancia a la tierra de los objetos de la categoria nebulosa es: ', (sumaNebulosa / v[7]):0:2)
    else
        writeln('No se han encontrado objetos de la categoria nebulosa.');
end;
procedure eliminarMultiplo3(var lista: listaObjetos);
begin
    lista.reset();
    while (not lista.eol()) do begin
        if (lista.current().anioDescubrimiento mod 3 = 0) then
            lista.removeCurrent()
        else
            lista.next();
    end;
end;
var
    lista: listaObjetos;
begin
    lista := listaObjetos.create();
    generarLista(lista);
    writeln('Lista generada.');
    informar(lista);
    eliminarMultiplo3(lista);
    writeln('Lista generada sin objetos cuyo año de descubrimiento es multiplo de 3.');
    informar(lista);
end.

