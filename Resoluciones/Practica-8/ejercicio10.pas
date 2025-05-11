{10. Un sistema de gestión de comercios desea organizar y analizar los productos de la canasta navideña. De cada
producto se conoce la siguiente información: código de producto, descripción, categoría (1..18), stock actual,
stock mínimo y el precio unitario.
Generar una lista de productos. Se leen productos hasta que llegue el producto con código de producto 0. La
lista debe quedar ordenada por código de producto.
Recorrer la lista generada en 1) una sola vez para:
a) Eliminar de la lista todos los productos que tienen el stock actual por debajo del stock mínimo. No
considerarlos para los puntos b y c.
b) Calcular e informar para cada categoría el monto total recaudado (stock actual*precio unitario).
c) Calcular los dos códigos de producto que tienen menor stock actual de la categoría 6.
Nota: Hacer el programa Principal. Modularizar.}

program ejercicio10;
uses GenericLinkedList;
type
    regProducto = record
        codigo: integer;
        descripcion: string;
        categoria: integer; // 1..18
        stockActual: integer;
        stockMinimo: integer;
        precioUnitario: real;
    end;

    listaProductos = specialize LinkedList<regProducto>;

    vecMontos = array[1..18] of real;
procedure leerProducto(var p: regProducto);
begin
    writeln('Ingrese el codigo del producto (0 para terminar):');
    readln(p.codigo);
    if p.codigo <> 0 then begin
        writeln('Ingrese la descripcion del producto:');
        readln(p.descripcion);
        writeln('Ingrese la categoria (1..18):');
        readln(p.categoria);
        writeln('Ingrese el stock actual:');
        readln(p.stockActual);
        writeln('Ingrese el stock minimo:');
        readln(p.stockMinimo);
        writeln('Ingrese el precio unitario:');
        readln(p.precioUnitario);
    end;
end;
procedure insertar(var lista: listaProductos; p: regProducto);
begin
    lista.reset();
    while (not lista.eol()) and (lista.current().codigo < p.codigo) do
        lista.next();
    lista.insertCurrent(p);
end;
procedure generarLista(var lista: listaProductos);
var
    p: regProducto;
begin
    leerProducto(p);
    while (p.codigo <> 0) do begin
        insertar(lista, p);
        leerProducto(p);
    end;
end;
procedure inicializarVector(var v: vecMontos);
var
    i: integer;
begin
    for i := 1 to 18 do
        v[i] := 0;
end;
procedure minimos(stockActual, codigo: integer; var menor1, menor2, codMenor1, codMenor2: integer);
begin
    if (stockActual < menor1) then begin
        menor2 := menor1;
        codMenor2 := codMenor1;
        menor1 := stockActual;
        codMenor1 := codigo;
    end else if (stockActual < menor2) then begin
        menor2 := stockActual;
        codMenor2 := codigo;
    end;
end;
procedure procesarLista(lista: listaProductos; var v: vecMontos; var codMenor1, codMenor2: integer);
var
    montoTotal: real;
    menor1, menor2: integer;
begin
    lista.reset();
    menor1 := 9999;
    menor2 := 9999;
    while (not lista.eol()) do begin
        if (lista.current().stockActual < lista.current().stockMinimo) then begin
            lista.removeCurrent();
        end else begin
            v[lista.current().categoria] := v[lista.current().categoria] + (lista.current().stockActual * lista.current().precioUnitario);
            if (lista.current().categoria = 6) then 
                minimos(lista.current().stockActual, lista.current().codigo, menor1, menor2, codMenor1, codMenor2);
        end;
        lista.next();
    end;
end;
procedure imprimirMontos(v: vecMontos);
var
    i: integer;
begin
    writeln('Montos recaudados por categoria:');
    for i := 1 to 18 do begin
        writeln('Categoria ', i, ': ', v[i]:0:2);
    end;
end;
var
    lista: listaProductos;
    v: vecMontos;
    codMenor1, codMenor2: integer;
begin
    lista := listaProductos.create();
    generarLista(lista);
    inicializarVector(v);
    procesarLista(lista, v, codMenor1, codMenor2);
    imprimirMontos(v);
end.