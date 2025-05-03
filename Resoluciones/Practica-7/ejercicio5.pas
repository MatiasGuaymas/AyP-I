{5. Se dispone de información de vehículos que posee la empresa “DotCom”. De cada vehículo se conoce su patente,
marca, modelo, año y todos los choferes que lo conducen (no se repiten). De cada chofer se conoce su número
de licencia, nombre, apellido, día de la semana (1..7) y turno que cubre (mañana, tarde o noche). Calcular e
informar:
a. El día de la semana que más choferes trabajan.
b. Cantidad de vehículos que conduce el chofer “Alain Prost”.
c. La patente de los dos vehículos que más choferes tuvieron.}

program ejercicio5;
uses GenericLinkedList;
type
    chofer = record
        numero: integer;
        nombre: string;
        apellido: string;
        dia: integer;
        turno: string;
    end;
    ListaChoferes = specialize LinkedList <chofer>;
    vehiculo = record
        patente: string;
        marca: string;
        modelo: string;
        anio: integer;
        choferes: ListaChoferes;
    end;
    ListaVehiculos = specialize LinkedList <vehiculo>;
    vecContador = array[1..7] of integer;
procedure leerChofer(var c: chofer); // Se dispone
begin
    readln(c.numero);
    if (c.numero <> 0) then begin
        readln(c.nombre);
        readln(c.apellido);
        readln(c.dia);
        readln(c.turno);
    end;
end;
procedure leerVehiculo(var v: vehiculo); // Se dispone
var
    c: chofer;
begin
    readln(v.patente);
    if (v.patente <> '0') then begin
        readln(v.marca);
        readln(v.modelo);
        readln(v.anio);
        v.choferes:= ListaChoferes.create();
        leerChofer(c);
        while (c.numero <> 0) do begin
            v.choferes.add(c);
            leerChofer(c);
        end;
    end;
end;
procedure armarLista(var lv: ListaVehiculos); // Se dispone
var
    v: vehiculo;
begin
    lv:= ListaVehiculos.create();
    leerVehiculo(v);
    while (v.patente <> '0') do begin
        lv.add(v);
        leerVehiculo(v);
    end;
end;
procedure inicializarVector(var vC: vecContador);
var
    i: integer;
begin
    for i:= 1 to 7 do
        vC[i]:= 0;
end;
procedure maximo(var max1, max2: integer; var patenteMax1, patenteMax2: string; cantChoferes: integer; patente: string);
begin
    if (cantChoferes > max1) then begin
        max2:= max1;
        patenteMax2:= patenteMax1;
        max1:= cantChoferes;
        patenteMax1:= patente;
    end else if (cantChoferes > max2) then begin
        max2:= cantChoferes;
        patenteMax2:= patente;
    end;
end;
procedure procesarLista(lv: ListaVehiculos; var vC: vecContador; var cantAlainProst: integeR; var patenteMax1, patenteMax2: string);
var
    max1, max2, cantChoferes: integer;
    v: vehiculo;
begin
    max1:= -1;
    max2:= -1;
    lv.reset();
    while (not lv.eol()) do begin
        v:= lv.current();
        v.choferes.reset();
        cantChoferes:= 0;
        while (not v.choferes.eol()) do begin
            if ((v.choferes.current().nombre = 'Alain') and (v.choferes.current().apellido = 'Prost')) then
                cantAlainProst:= cantAlainProst + 1;
            vC[v.choferes.current().dia]:= vC[v.choferes.current().dia] + 1;
            v.choferes.next();
            cantChoferes:= cantChoferes + 1;
        end;
        maximo(max1, max2, patenteMax1, patenteMax2, cantChoferes, v.patente);
        lv.next();
    end;
end;
function maximo(var vC: vecContador): integer;
var
    i, max, posMax: integer;
begin
    max:= -1;
    posMax:= -1;
    for i:= 1 to 7 do begin
        if (vC[i] > max) then
            begin
                posMax:= i;
                max:= vC[i];
            end;
    end;
    maximo:= posMax;
end;
var
    lv: ListaVehiculos;
    vC: vecContador;
    cantAlainProst: integer;
    patenteMax1, patenteMax2: string;
begin
    armarLista(lv);
    cantAlainProst:= 0;
    patenteMax1:= '';
    patenteMax2:= '';
    inicializarVector(vC);
    procesarLista(lv, vC, cantAlainProst, patenteMax1, patenteMax2);
    writeln('El dia de la semana que mas choferes trabajan es el dia ', maximo(vC));
    writeln('Cantidad de vehiculos que conduce el chofer Alain Prost: ', cantAlainProst);
    writeln('Las patentes de los dos vehiculos que mas choferes tuvieron son: ', patenteMax1, ' y ', patenteMax2);

end.