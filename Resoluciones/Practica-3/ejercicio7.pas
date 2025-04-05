{7. Se desea procesar la información de todos los radares de velocidad que posee la ciudad de La Plata
en un día. Para ello se lee de cada radar: código de radar, velocidad máxima permitida y cantidad de
vehículos registrados, y para cada vehículo en cada radar, se lee patente y velocidad. La lectura
finaliza cuando se lee el código de radar -1. Se pide calcular e informar:
a. Para cada radar, la velocidad promedio de los automóviles.
b. Para cada radar, la cantidad de vehículos que fueron multados.
c. La patente del vehículo con mayor velocidad y la patente del vehículo con menor velocidad.}

program ejercicio7;
type
    radar = record
        codigo: integer;
        velocidadMax: integer;
        cantidadVehiculos: integer;
    end;
    vehiculo = record
        patente: string;
        velocidad: integer;
    end;
procedure leerVehiculo(var v: vehiculo);
begin
    writeln('Ingrese la patente del vehiculo');
    readln(v.patente);
    writeln('Ingrese la velocidad del vehiculo');
    readln(v.velocidad);
end;
procedure leerRadar(var r: radar);
begin
    writeln('Ingrese el codigo del radar');
    readln(r.codigo);
    if (r.codigo <> -1) then
        begin
            writeln('Ingrese la velocidad maxima permitida');
            readln(r.velocidadMax);
            writeln('Ingrese la cantidad de vehiculos registrados');
            readln(r.cantidadVehiculos);
        end;
end;
procedure procesarRadar(var patenteMax, patenteMin: string);
var
    r: radar;
    v: vehiculo;
    i, sumaVel, cantMultados, maxVel, minVel: integer;
begin
    leerRadar(r);
    maxVel:= -1;
    minVel:= 9999;
    while (r.codigo <> -1) do
        begin
            sumaVel:= 0;
            cantMultados:= 0;            
            for i:= 1 to r.cantidadVehiculos do
                begin
                    leerVehiculo(v);
                    sumaVel:= sumaVel + v.velocidad;
                    if (v.velocidad > r.velocidadMax) then
                        cantMultados:= cantMultados + 1;
                    if (v.velocidad > maxVel) then
                        begin
                            maxVel:= v.velocidad;
                            patenteMax:= v.patente;
                        end;
                    if (v.velocidad < minVel) then
                        begin
                            minVel:= v.velocidad;
                            patenteMin:= v.patente;
                        end;
                end;
            writeln('La velocidad promedio del radar ', r.codigo, ' es: ', sumaVel / r.cantidadVehiculos:0:2);
            writeln('La cantidad de vehiculos multados en el radar ', r.codigo, ' es: ', cantMultados);
            leerRadar(r);
        end;
end;
var
    patenteMax, patenteMin: string;
begin
    patenteMax:= '';
    patenteMin:= '';
    procesarRadar(patenteMax, patenteMin);
    writeln('La patente del vehiculo con mayor velocidad es: ', patenteMax);
    writeln('La patente del vehiculo con menor velocidad es: ', patenteMin);
end.