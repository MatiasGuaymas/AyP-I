{6. Un banco dispone de una lista con la información sus jubilados (documento, apellido, nombre y monto a pagar).
Debido a que la cantidad de jubilados para cobrar es muy grande se decidió pagarles en 10 días diferentes
agrupándolos por el último dígito de su documento. Escribir un programa que implemente la separación de la
lista en 10 listas diferentes conservando el orden original en cada lista.}

program ejercicio6;
uses GenericLinkedList;
type
    jubilado = record
        documento: integer;
        apellido: string;
        nombre: string;
        monto: real;
    end;
    ListaJubilados = specialize LinkedList <jubilado>;
    ListaJubiladosPorDia = array[0..9] of ListaJubilados;
procedure leerJubilado(var j: jubilado); // Se dispone
begin
    readln(j.documento);
    if (j.documento <> 0) then begin
        readln(j.apellido);
        readln(j.nombre);
        readln(j.monto);
    end;
end;
procedure armarLista(var lj: ListaJubilados); // Se dispone
var
    j: jubilado;
begin
    lj:= ListaJubilados.create();
    leerJubilado(j);
    while (j.documento <> 0) do begin
        lj.add(j);
        leerJubilado(j);
    end;
end;
procedure inicializarListas(var lJubiladosPorDia: ListaJubiladosPorDia);
var
    i: integer;
begin
    for i:= 0 to 9 do
        lJubiladosPorDia[i]:= ListaJubilados.create();
end;
procedure separarPorDia(lj: ListaJubilados; var lJubiladosPorDia: ListaJubiladosPorDia);
begin
    lj.reset();
    while (not lj.eol()) do begin
        lJubiladosPorDia[lj.current().documento mod 10].add(lj.current());
        lj.next();
    end;
end;
procedure imprimirListas(lJubiladosPorDia: ListaJubiladosPorDia);
var
    i: integer;
begin
    for i:= 0 to 9 do begin
        writeln('Lista de jubilados para el dia ', i, ':');
        lJubiladosPorDia[i].reset();
        while (not lJubiladosPorDia[i].eol()) do begin
            writeln('Documento: ', lJubiladosPorDia[i].current().documento, 
                    ' Apellido: ', lJubiladosPorDia[i].current().apellido, 
                    ' Nombre: ', lJubiladosPorDia[i].current().nombre, 
                    ' Monto: ', lJubiladosPorDia[i].current().monto:0:2);
            lJubiladosPorDia[i].next();
        end;
    end;
end;
var
    lj: ListaJubilados;
    lJubiladosPorDia: ListaJubiladosPorDia;
begin
    armarLista(lj);
    inicializarListas(lJubiladosPorDia);
    separarPorDia(lj, lJubiladosPorDia);
    imprimirListas(lJubiladosPorDia);
end.