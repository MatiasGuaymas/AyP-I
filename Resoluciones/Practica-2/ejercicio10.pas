{10. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio y código. Informar:
● Código de los dos productos más baratos.
● Precio promedio.}

program ejercicio10;
const
    DF = 100;
procedure leerUnProducto(var precio: real; var codigo: integer);
begin
    writeln('Ingrese un precio de producto');
    readln(precio);
    writeln('Ingrese un codigo de producto');
    readln(codigo);
end;
procedure minimos(precio: real; codigo: integer; var codMin1, codMin2: integer; var min1, min2: real);
begin
    if(precio <= min1) then
        begin
            min2:= min1;
            min1:= precio;
            codMin2:= codMin1;
            codMin1:= codigo;
        end
    else    
        if(precio <= min2) then
            begin
                min2:= precio;
                codMin2:= codigo;
            end;
end;
procedure leerProductos;
var
    i, codigo, codMin1, codMin2: integer;
    precio, min1, min2, total: real;
begin
    total:= 0;
    codMin1:= 0;
    codMin2:= 0;
    min1:= 9999;
    min2:= 9999;
    for i:= 1 to DF do
        begin
            leerUnProducto(precio, codigo);
            minimos(precio, codigo, codMin1, codMin2, min1, min2);
            total:= total + precio;
        end;
    writeln('Los codigos de los dos productos mas baratos son: ', codMin1, ' y ', codMin2);
    writeln('El precio promedio es: ', (total/DF):0:2);
end;
begin
    leerProductos();
end.