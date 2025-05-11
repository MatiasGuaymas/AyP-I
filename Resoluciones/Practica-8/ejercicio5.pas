{5. Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales. De cada
evento se dispone la siguiente información: nombre del evento, tipo de evento (1: música, 2: cine, 3: obra de
teatro, 4: unipersonal y 5: monólogo), lugar del evento, cantidad máxima de personas permitidas para el evento
y costo de la entrada. Se pide:
Generar una lista con las ventas de entradas para tales eventos culturales. De cada venta se debe guardar: código
de venta, número de evento (1..100), DNI del comprador y cantidad de entradas adquiridas. No superan la
cantidad máxima permitida para cada evento. La lectura de las ventas finaliza con código de venta -1.
Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador tiene DNI impar para el evento de tipo “unipersonal”.
c. Si la cantidad de entradas vendidas para el evento número 20 alcanzó la cantidad máxima de personas
permitidas.}

program ejercicio5;
uses GenericLinkedList;
const
    MAX_EVENTOS = 100;
type
    regEvento = record
        nombre: string;
        tipo: integer; // 1: música, 2: cine, 3: obra de teatro, 4: unipersonal y 5: monólogo
        lugar: string;
        cantMaxPersonas: integer;
        costoEntrada: real;
    end;

    regVenta = record
        codVenta: integer;
        numEvento: integer; // 1..100
        dniComprador: integer;
        cantEntradas: integer;
    end;

    listaVentas = specialize LinkedList <regVenta>;
    vecEventos = array[1..MAX_EVENTOS] of regEvento;
    

procedure cargarEventos(var eventos: vecEventos); // Se dispone
begin
end;

procedure leerVenta(var venta: regVenta);
begin
    writeln('Ingrese codigo de venta: ');
    readln(venta.codVenta);
    if (venta.codVenta <> -1) then begin
        writeln('Ingrese numero de evento (1..100): ');
        readln(venta.numEvento);
        writeln('Ingrese DNI del comprador: ');
        readln(venta.dniComprador);
        writeln('Ingrese cantidad de entradas adquiridas: ');
        readln(venta.cantEntradas);
    end;
end;
procedure insert(var lista: listaVentas; venta: regVenta);
begin
    lista.reset();
    while((not lista.eol()) and (lista.current().numEvento < venta.numEvento)) do 
        lista.next();
    lista.insertCurrent(venta);
end;
procedure cargarVentas(var ventas: listaVentas);
var
    venta: regVenta;
begin
    ventas := listaVentas.create();
    leerVenta(venta);
    while (venta.codVenta <> -1) do begin
        insert(ventas, venta);
        leerVenta(venta);
    end;
end;
procedure minimos(var min1, min2: real; recaudacionActual: real; nombreActual, lugarActual: string; var nomMin1, nomMin2, lugarMin1, lugarMin2: string);
begin
    if (recaudacionActual < min1) then begin
        min2 := min1;
        nomMin2 := nomMin1;
        lugarMin2 := lugarMin1;
        min1 := recaudacionActual;
        nomMin1 := nombreActual;
        lugarMin1 := lugarActual;
    end else if (recaudacionActual < min2) then begin
        min2 := recaudacionActual;
        nomMin2 := nombreActual;
        lugarMin2 := lugarActual;
    end;
end;
procedure procesarLista(lista: listaVentas; eventos: vecEventos; var nomMin1, nomMin2, lugarMin1, lugarMin2: string; var cantEntradasImpares: integer; var cumple20: boolean);
var
    min1, min2, recaudacionActual: real;
    numEventoActual, cantEntradas20: integer;
begin
    min1 := 9999;
    min2 := 9999;
    cantEntradas20 := 0;
    lista.reset();
    while (not lista.eol()) do begin
        numEventoActual := lista.current().numEvento;
        recaudacionActual := 0;
        while ((not lista.eol()) and (lista.current().numEvento = numEventoActual)) do begin
            recaudacionActual := recaudacionActual + (eventos[numEventoActual].costoEntrada * lista.current().cantEntradas);
            if (eventos[numEventoActual].tipo = 4) and (lista.current().dniComprador mod 2 <> 0) then
                cantEntradasImpares := cantEntradasImpares + lista.current().cantEntradas;
            if (numEventoActual = 20) then
                cantEntradas20 := cantEntradas20 + lista.current().cantEntradas;
            lista.next();
        end;
        minimos(min1, min2, recaudacionActual, eventos[numEventoActual].nombre, eventos[numEventoActual].lugar, nomMin1, nomMin2, lugarMin1, lugarMin2);
    end;
    cumple20:= cantEntradas20 = eventos[20].cantMaxPersonas;
end;
var
    eventos: vecEventos;
    ventas: listaVentas;
    nomMin1, nomMin2, lugarMin1, lugarMin2: string;
    cantEntradasImpares: integer;
    cumple20: boolean;
begin
    cargarEventos(eventos);
    cargarVentas(ventas);
    cantEntradasImpares := 0;
    cumple20 := false;
    procesarLista(ventas, eventos, nomMin1, nomMin2, lugarMin1, lugarMin2, cantEntradasImpares, cumple20);
    
    writeln('Los dos eventos con menor recaudacion son:');
    writeln('Evento 1: ', nomMin1, ' en ', lugarMin1);
    writeln('Evento 2: ', nomMin2, ' en ', lugarMin2);
    writeln('Cantidad de entradas vendidas con DNI impar para el evento unipersonal: ', cantEntradasImpares);
    if (cumple20) then
        writeln('La cantidad de entradas vendidas para el evento numero 20 alcanzo la cantidad maxima de personas permitidas.')
    else
        writeln('La cantidad de entradas vendidas para el evento numero 20 NO alcanzo la cantidad maxima de personas permitidas.');
end.
