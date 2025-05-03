{7. Un deportólogo está realizando una investigación sobre el rendimiento de los maratonistas. Se seleccionan 150
maratonistas para ser estudiados. De cada uno se conoce el nombre, apellido, género, y el tiempo (minutos y
segundos) registrado en cada maratón que ha corrido. Los tiempos se cargan hasta que llega el tiempo con
minuto 0. El deportólogo necesita un programa para:
a. Cargar la información de los 150 maratonistas.
b. Una vez finalizada la carga, recorrer la estructura una sola vez para:
• Informar para cada maratonista, la maratón con el mejor tiempo de desempeño.
• Calcular el promedio de tiempo de cada maratonista.}

program ejercicio7;
uses GenericLinkedList;
const
    MAX_MARATONISTAS = 150;
type
    tiempo = record
        minutos: integer;
        segundos: integer;
    end;
    ListaTiempo = specialize LinkedList <tiempo>;
    maratonista = record
        nombre: string;
        apellido: string;
        genero: string;
        tiempos: ListaTiempo;
    end;
    vecMaratonistas = array[1..MAX_MARATONISTAS] of maratonista;
procedure leerTiempo(var t: tiempo); 
begin
    readln(t.minutos);
    if (t.minutos <> 0) then begin
        readln(t.segundos);
    end;
end;
procedure leerMaratonista(var m: maratonista);
var
    t: tiempo;
begin
    readln(m.nombre);
    readln(m.apellido);
    readln(m.genero);
    m.tiempos:= ListaTiempo.create();
    leerTiempo(t);
    while (t.minutos <> 0) do begin
        m.tiempos.add(t);
        leerTiempo(t);
    end;
end;
procedure cargarMaratonistas(var maratonistas: vecMaratonistas);
var
    i: integer;
begin
    for i:= 1 to MAX_MARATONISTAS do 
        leerMaratonista(maratonistas[i]);
end;
procedure minimo(t1: tiempo; var t2: tiempo);
begin
    if (t1.minutos < t2.minutos) or ((t1.minutos = t2.minutos) and (t1.segundos < t2.segundos)) then begin
        t2.minutos:= t1.minutos;
        t2.segundos:= t1.segundos;
    end;
end;
procedure procesarVector(maratonistas: vecMaratonistas);
var
    mejorTiempo: tiempo;
    i, sumaMinutos, sumaSegundos, cantMaraton: integer;
    promedio: real;
begin
    for i:= 1 to MAX_MARATONISTAS do begin
        mejorTiempo.minutos:= 9999;
        mejorTiempo.segundos:= 9999;
        sumaMinutos:= 0;
        sumaSegundos:= 0;
        cantMaraton:= 0;
        maratonistas[i].tiempos.reset();
        while (not maratonistas[i].tiempos.eol()) do begin
            minimo(maratonistas[i].tiempos.current(), mejorTiempo);
            sumaMinutos:= sumaMinutos + maratonistas[i].tiempos.current().minutos;
            sumaSegundos:= sumaSegundos + maratonistas[i].tiempos.current().segundos;
            cantMaraton:= cantMaraton + 1;
            maratonistas[i].tiempos.next();
        end;
        writeln('Maratonista: ', maratonistas[i].nombre, ' ', maratonistas[i].apellido, ' Mejor tiempo: ', 
                mejorTiempo.minutos, ' minutos y ', mejorTiempo.segundos, ' segundos');
        if (cantMaraton > 0) then 
            writeln('Promedio de tiempo: ', (sumaMinutos * 60 + sumaSegundos) / cantMaraton, ' segundos');
    end;
end;
var
    maratonistas: vecMaratonistas;
begin
    cargarMaratonistas(maratonistas);
    procesarVector(maratonistas);
end.
