{6. La casa central de una cadena de bicicleterías recibe la información de las ventas de cada mes
correspondientes al año 2024, de cada una de sus 9 sucursales.
La información recibida para cada mes por cada sucursal es: cantidad de bicicletas vendidas, monto
total facturado, cantidad de bicicletas defectuosas, y monto total devuelto por bicicletas defectuosas.
Implementar un programa que procese la información previa para informar:
a. Sucursal con menor ganancia.
b. Para cada sucursal el mes en que más vendió.
c. Recaudación promedio en el mes de abril de todas las sucursales.}

program ejercicio6;
const
    dim = 2;
type
    sucursal = record
        cantidadVendida: integer;
        montoFacturado: real;
        cantidadDefectuosas: integer;
        montoDevuelto: real;
    end;
procedure leerSucursal(var s: sucursal);
begin
    writeln('Ingrese la cantidad de bicicletas vendidas');
    readln(s.cantidadVendida);
    writeln('Ingrese el monto total facturado');
    readln(s.montoFacturado);
    writeln('Ingrese la cantidad de bicicletas defectuosas');
    readln(s.cantidadDefectuosas);
    writeln('Ingrese el monto total devuelto por bicicletas defectuosas');
    readln(s.montoDevuelto);
end;
procedure procesarVentas(var sucMin: integer; var recaudacionProm: real);
var
    suc: sucursal;
    i, j, cantMax, mesMax: integer;
    recaudacion, min: real;
begin
    recaudacionProm:= 0;
    min:= 9999;
    sucMin:= 0;
    for i:= 1 to DIM do
        begin
            recaudacion:= 0;
            cantMax:= -1;
            for j:= 1 to 12 do
                begin
                    writeln('Ingrese los datos de la sucursal ', i, ' del mes ', j);
                    leerSucursal(suc);
                    recaudacion:= recaudacion + suc.montoFacturado - suc.montoDevuelto;
                    // recaudacion:= recaudacion + suc.montoFacturado;
                    if (suc.cantidadVendida > cantMax) then
                        begin
                            cantMax:= suc.cantidadVendida;
                            mesMax:= j;
                        end;
                    if (j = 4) then
                        recaudacionProm:= recaudacionProm + recaudacion;
                end;
            if (recaudacion < min) then
                begin
                    min:= recaudacion;
                    sucMin:= i;
                end;
            writeln('Sucursal ', i, ' vendio ', cantMax, ' bicicletas en el mes ', mesMax);
        end;
    recaudacionProm:= recaudacionProm / dim;
end;
var
    sucMin: integer;
    recaudacionProm: real;
begin
    procesarVentas(sucMin, recaudacionProm);
    writeln('Sucursal con menor ganancia: ', sucMin);
    writeln('Recaudacion promedio en abril: ', recaudacionProm:0:2);
end.