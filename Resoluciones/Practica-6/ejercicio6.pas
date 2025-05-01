{6. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada producto
se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa el código 0.
Una vez leída y almacenada toda la información, calcular e informar:
● Porcentaje de productos con stock actual por debajo de su stock mínimo.
● Descripción de aquellos productos con código impar.
● Código de los dos productos más económicos.}

program Listas;
Uses GenericLinkedList;
type
    producto = record
        codigo: integer;
        descripcion: string;
        stockActual: integer;
        stockMinimo: integer;
        precio: real;
    end;
    minimo = record
        precio: real;
        codigo: integer;
    end;
    ListaProductos = specialize LinkedList <producto>;
Procedure LeerProducto (var p: producto);
Begin
    readln(p.codigo);
    if (p.codigo <> 0) then begin
        readln(p.descripcion);
        readln(p.stockActual);
        readln(p.stockMinimo);
        readln(p.precio);
    end;
end;
Procedure armarLista (var lp:ListaProductos);
var
    prod: producto;
begin
    lp:= ListaProductos.create();
    leerProducto(prod);
    while (prod.codigo <> 0) do
        begin
            lp.add(prod);
            leerProducto(prod);
        end;
end;
Procedure minimos (p: producto; var m1, m2: minimo);
Begin
    if (p.precio < m1.precio) then 
        begin
            m2:= m1;
            m1.precio:= p.precio;
            m1.codigo := p.codigo;
        end
    else
    if (p.precio < m2.precio) then 
        begin
            m2.precio:= p.precio;
            m2.codigo := p.codigo;
        end;
end;
Procedure recorrerInformar (lp:ListaProductos);
var 
    total, cant: integer;
    min1, min2: minimo; 
begin
    cant:=0;
    total:= 0;
    min1.precio := 9999;
    min2.precio := 9999;
    min1.codigo := -1; // valor invalido en caso de lista vacia
    min2.codigo := -1;
    lp.reset();
    while (not (lp.eol()) ) do begin
        total:= total + 1; //a
        if (lp.current().stockActual < lp.current().stockMinimo) then //a
            cant:= cant + 1;
        if (lp.current().codigo mod 2 = 1) then //b
            writeln ('Producto código impar : ', lp.current().descripcion);
        minimos(lp.current(), min1, min2); //c
        lp.next ();
    end;
    if total > 0 then
        writeln ('Porcentaje por debajo del stock mínimo: ', cant*100/total:0:2, '%'); ;
    writeln('Los dos códigos más económicos: ', min1.codigo, ' ', min2.codigo);
end;
var
    lp : ListaProductos;
begin
    armarLista(lp);
    recorrerInformar(lp);
end.