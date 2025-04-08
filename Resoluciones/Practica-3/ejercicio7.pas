{7. Se desea procesar la información de todos los radares de velocidad que posee la ciudad de La Plata
en un día. Para ello se lee de cada radar: código de radar, velocidad máxima permitida y cantidad de
vehículos registrados, y para cada vehículo en cada radar, se lee patente y velocidad. La lectura
finaliza cuando se lee el código de radar -1. Se pide calcular e informar:
a. Para cada radar, la velocidad promedio de los automóviles.
b. Para cada radar, la cantidad de vehículos que fueron multados.
c. La patente del vehículo con mayor velocidad y la patente del vehículo con menor velocidad.}

Program ejercicio7;
Type

  vehiculo =record
    patente:string;
    velocidad:real;
  end;

  radar = record
     codigo:integer;
     velocidadMaxima: real;
     cantidadVehiculosRegistrados:integer;
  end;

Procedure maximaVelocidad (var maxV1: vehiculo; ve:vehiculo);
begin
	if (ve.velocidad > maxV1.velocidad) then begin
	    maxV1:= ve;
	end;

end;

Procedure minimaVelocidad (var minV:vehiculo; ve:vehiculo);
begin
	if (ve.velocidad < minV.velocidad) then
		minV:= ve;
end;

Procedure leerVehiculo (var ve:vehiculo);

begin
    Writeln ('ingrese patente');
    readln(ve.patente);
    Writeln ('ingrese velocidad');
    readln(ve.velocidad);
end;

Procedure procesarRadar (r:radar; var maxV1, minV:vehiculo);
var
  ve:vehiculo;
  i, cantMultados: integer;
  sumaVelocidades:real;
begin
	cantMultados:= 0;
	sumaVelocidades:= 0;
	For i:= 1 to r.cantidadVehiculosRegistrados do begin
		Writeln ('vehiculo ', i);
        leervehiculo(ve);
		minimaVelocidad(minV, ve);
		maximaVelocidad(maxV1, ve);
		sumaVelocidades:= sumaVelocidades + ve.velocidad;
		if (ve.velocidad > r.velocidadMaxima) then
			cantMultados:= cantMultados + 1;
	end;
	Writeln('La velocidad promedio de este radar es: ', (sumaVelocidades/r.cantidadVehiculosRegistrados):2:2);
	Writeln('La cantidad de vehiculos multados es: ', cantMultados);
end;

Procedure leerRadar (var r:radar);

begin
    Writeln ('codigo de radar');
    readln(r.codigo);
    if (r.codigo <> -1) then begin // ¿Es necesario el if?
        Writeln ('velocidad maxima');
        readln(r.velocidadMaxima);
        Writeln ('cantidad de vehiculos registrados');
        readln(r.cantidadVehiculosRegistrados);
    end;
end;

var
 r: radar;
 maxV1, minV:vehiculo;

begin
	maxV1.velocidad:= -1;
	minV.velocidad:= 999;
	Writeln ('ingrese los datos del radar (hasta ingresar -1)');
    leerRadar(r);
	While (r.codigo <> -1) do begin
		Writeln('Para el radar: ', r.codigo, ' se registraron ' , r.cantidadVehiculosRegistrados, ' vehiculos. Datos de cada vehiculo' );
		procesarRadar(r,maxV1, minV);
		leerRadar(r);
	end;
	Writeln('El vehiculo con Mayor velocidad es: ', maxV1.patente, ' con velocidad: ', maxV1.velocidad:2:2);
	Writeln('El vehiculo con menor velocidad es: ', minV.patente, 'con velocidad: ', minV.velocidad:2:2);
end.