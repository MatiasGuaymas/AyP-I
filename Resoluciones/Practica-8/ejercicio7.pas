{7. Un supermercado necesita analizar la información de las compras realizadas en el último año para reposición de
stock.
a. Realizar un módulo que cargue una lista con la información de las compras. De cada compra se conoce el
monto abonado, el mes en que se realizó la compra, la cantidad de productos comprados y el nombre del
proveedor. Por cada proveedor puede haber 1 o más compras y la información de las compras debe quedar
ordenada por nombre de proveedor. La lectura finaliza al ingresar la compra con monto -1.
b. Realizar un programa que utilice la lista generada en el inciso A), la recorra una sola vez e informe:
i. Los nombres de los proveedores para los cuales el monto total facturado superó los 30.000 pesos.
ii. Los dos meses en los que se realizaron mayor cantidad de compras.
iii. El monto promedio de las compras realizadas durante el mes de julio}

program ejercicio7;
uses GenericLinkedList;
type
    regCompra = record
        montoAbonado: real;
        mes: integer; // 1..12
        cantProductos: integer;
        proveedor: string;
    end;

    listaCompras = specialize LinkedList <regCompra>;
    vecContador = array[1..12] of integer;
procedure leerCompra(var compra: regCompra);
begin
    writeln('Ingrese monto abonado: ');
    readln(compra.montoAbonado);
    if (compra.montoAbonado <> -1) then begin
        writeln('Ingrese mes de la compra (1..12): ');
        readln(compra.mes);
        writeln('Ingrese cantidad de productos comprados: ');
        readln(compra.cantProductos);
        writeln('Ingrese nombre del proveedor: ');
        readln(compra.proveedor);
    end;
end;
procedure insertar(var lista: listaCompras; compra: regCompra);
begin
    lista.reset();
    while((not lista.eol()) and (lista.current().proveedor < compra.proveedor)) do 
        lista.next();
    lista.insertCurrent(compra);
end;
procedure generarLista(var lista: listaCompras);
var
    compra: regCompra;
begin
    leerCompra(compra);
    while (compra.montoAbonado <> -1) do begin
        insertar(lista, compra);
        leerCompra(compra);
    end;
end;
procedure inicializarVector(var v: vecContador);
var
    i: integer;
begin
    for i := 1 to 12 do
        v[i] := 0;
end;
procedure procesarLista(lista: listaCompras; var v: vecContador; var montoProm: real);
var
    proveedorActual: string;
    montoProveedor, montoJulio: real;
begin
    lista.reset();
    montoJulio:= 0;
    while (not lista.eol()) do begin
        proveedorActual := lista.current().proveedor;
        montoProveedor := 0;
        while((not lista.eol()) and (lista.current().proveedor = proveedorActual)) do begin
            montoProveedor := montoProveedor + lista.current().montoAbonado;
            if (lista.current().mes = 7) then
                montoJulio := montoJulio + lista.current().montoAbonado;
            v[lista.current().mes] := v[lista.current().mes] + 1;
            lista.next();
        end;
        if (montoProveedor > 30000) then
            writeln('Proveedor: ', proveedorActual);
    end;
    if (v[7] > 0) then
        montoProm := montoJulio / v[7]
    else
        montoProm := 0;
end;
procedure maximos(var mes1, mes2: integer; v: vecContador);
var
    i: integer;
    max1, max2: integer;
begin
    max1 := -1;
    max2 := -1;
    mes1 := -1;
    mes2 := -1;
    for i := 1 to 12 do begin
        if (v[i] > max1) then begin
            max2 := max1;
            mes2 := mes1;
            max1 := v[i];
            mes1 := i;
        end else if (v[i] > max2) then begin
            max2 := v[i];
            mes2 := i;
        end;
    end;
end;
var
    lista: listaCompras;
    v: vecContador;
    montoProm: real;
    mes1, mes2: integer;
begin
    lista := listaCompras.create();
    generarLista(lista);
    inicializarVector(v);
    procesarLista(lista, v, montoProm);
    maximos(mes1, mes2, v);
    writeln('Los dos meses con mayor cantidad de compras son: ', mes1, ' y ', mes2);
    writeln('El monto promedio de las compras realizadas durante el mes de julio es: ', montoProm:0:2);
end.
