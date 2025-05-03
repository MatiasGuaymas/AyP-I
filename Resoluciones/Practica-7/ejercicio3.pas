{3. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de todos
los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android instalada,
el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB). La información
disponible se encuentra ordenada por versión de Android. Realizar un programa que procese la información
disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.}

program ejercicio3;
Uses GenericLinkedList;
type
    dispositivo = record
        version: string;
        pantalla: real;
        ram: integer;
    end;
    ListaDispositivos = specialize LinkedList <dispositivo>;
procedure leerDispositivo(var d: dispositivo); // Se dispone
begin
    readln(d.version);
    if (d.version <> '0') then begin
        readln(d.pantalla);
        readln(d.ram);
    end;
end;
procedure armarLista(var ld: ListaDispositivos); // Se dispone
var
    d: dispositivo;
begin
    ld:= ListaDispositivos.create();
    leerDispositivo(d);
    while (d.version <> '0') do begin
        ld.add(d);
        leerDispositivo(d);
    end;
end;
procedure procesarLista(ld: ListaDispositivos);
var
    versionActual: string;
    contVersion, contDispositivos, contPantalla: integer;
    sumaPantallas: real;
begin
    contDispositivos:= 0;
    contPantalla:= 0;
    sumaPantallas:= 0.0;
    ld.reset();
    while (not ld.eol()) do begin
        versionActual:= ld.current().version;
        contVersion:= 0;
        while (not ld.eol()) and (ld.current().version = versionActual) do begin
            contVersion:= contVersion + 1;
            contDispositivos:= contDispositivos + 1;
            if (ld.current().ram > 3) and (ld.current().pantalla <= 5) then 
                contPantalla:= contPantalla + 1;
            sumaPantallas:= sumaPantallas + ld.current().pantalla;
            ld.next();
        end;
        writeln('Cantidad de dispositivos para la version ', versionActual, ': ', contVersion);
    end;
    writeln('Cantidad de dispositivos con mas de 3 GB de RAM y pantalla <= 5 pulgadas: ', contPantalla);
    writeln('Tamaño promedio de las pantallas: ', sumaPantallas / contDispositivos:0:2);
end;
var
    ld: ListaDispositivos;
begin
    armarLista(ld);
    procesarLista(ld);
end.