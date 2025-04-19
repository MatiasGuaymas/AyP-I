{5. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello, lee
información sobre todos los viajes realizados durante el mes de marzo. De cada viaje lee la siguiente información:
día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida por el camión (medida en kilómetros).
Realizar un programa que lea y almacene la información de los 160 viajes realizados. Realizar un módulo que reciba
el vector generado e informe:
a. El monto promedio de dinero transportado de los viajes realizados
b. La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
c. La cantidad de viajes realizados cada día del mes.}

program ejercicio5;
const
    MAX_VIAJES = 2;
type
    viaje = record
        dia: integer;
        monto: real;
        distancia: real;
    end;
    vectorViajes = array[1..MAX_VIAJES] of viaje;
    vectorContador = array[1..31] of integer;
procedure leerViaje(var v: viaje);
var
    i: integer;
begin
    writeln('Ingrese el dia del mes (1-31): ');
    readln(v.dia);
    writeln('Ingrese el monto de dinero transportado: ');
    readln(v.monto);
    writeln('Ingrese la distancia recorrida por el camion (en km): ');
    readln(v.distancia);
end;
procedure cargarVector(var v: vectorViajes);
var
    i: integer;
begin
    for i:= 1 to MAX_VIAJES do 
        leerViaje(v[i]);
end;
procedure imprimirVector(v: vectorViajes);
var
    i: integer;
begin
    writeln('Viajes realizados:');
    for i:= 1 to MAX_VIAJES do begin
        writeln('Dia: ', v[i].dia, ' Monto: ', v[i].monto:0:2, ' Distancia: ', v[i].distancia:0:2);
    end;
end;
procedure inicializarContador(var vecContador: vectorContador);
var
    i: integer;
begin
    for i:= 1 to 31 do
        vecContador[i] := 0;
end;
procedure minimo(var menor: viaje; v: viaje);
begin
    if (v.monto < menor.monto) then
        menor := v;
end;
procedure procesarViajes(v: vectorViajes; var promedio: real; var menorMonto: viaje; var vecContador: vectorContador);
var
    i: integer;
    suma: real;
begin
    suma := 0;
    for i:= 1 to MAX_VIAJES do begin
        suma := suma + v[i].monto;
        vecContador[v[i].dia] := vecContador[v[i].dia] + 1;
        minimo(menorMonto, v[i]);
    end;
    promedio := suma / MAX_VIAJES;
end;
procedure imprimirVectorContador(vecContador: vectorContador);
var
    i: integer;
begin
    writeln('Cantidad de viajes realizados cada dia del mes:');
    for i:= 1 to 31 do begin
        writeln('Dia ', i, ': ', vecContador[i]);
    end;
end;
var
    v: vectorViajes;
    vecContador: vectorContador;
    menorMonto: viaje;
    promedio: real;
begin
    menorMonto.monto := 9999;
    inicializarContador(vecContador);
    cargarVector(v);
    imprimirVector(v);

    writeln('----------------------------------');
    procesarViajes(v, promedio, menorMonto, vecContador);
    writeln('El monto promedio de dinero transportado es: ', promedio:0:2);
    writeln('La distancia recorrida y el dia del mes en que se realizo el viaje que transporto menos dinero son: ', menorMonto.distancia:0:2, ' km, Dia: ', menorMonto.dia);
    imprimirVectorContador(vecContador);
end.