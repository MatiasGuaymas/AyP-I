{2. La billetera virtual MP dispone de una lista de transferencias realizadas entre Enero y Diciembre del 2024. De
cada transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta
destino, DNI de titular de cuenta destino, fecha, hora y monto. Esta estructura no posee orden alguno.
Se pide:
a. Generar una lista que contenga sólo las transferencias a terceros (son aquellas en las que las cuentas origen
y destino no pertenecen al mismo titular). Debe estar ordenada por número de cuenta origen.
Utilizar la lista del inciso a. para:
b. Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c. Calcular e informar el mes que más transferencias a terceros tuvo.
d. Calcular e informar el promedio de monto transferido a terceros en el mes de octubre.}

program ejercicio2;
uses GenericLinkedList;
type
    regFecha = record
        dia: integer;
        mes: integer;
        anio: integer;
    end;

    transferencia = record
        numCuentaOrigen: integer;
        dniTitularOrigen: integer;
        numCuentaDestino: integer;
        dniTitularDestino: integer;
        fecha: regFecha; 
        hora: string;
        monto: real;
    end;

    listaTransferencias = specialize LinkedList<transferencia>;

    vecMeses = array[1..12] of integer;

procedure cargarListaTransferencias(var lt: listaTransferencias); //se dispone
begin
end;

procedure insertarOrdenado(var lt: listaTransferencias; t: transferencia);
begin
    lt.reset();
    while not(lt.eol()) and (lt.current().numCuentaOrigen < t.numCuentaOrigen) do 
        lt.next(); 
    lt.insertCurrent(t); 
end;

procedure transferenciasATerceros(lt: listaTransferencias; var ltATerceros: listaTransferencias);
begin
    lt.reset();
    ltATerceros:= listaTransferencias.create();
    while not(lt.eol()) do begin
        if (lt.current().dniTitularOrigen <> lt.current().dniTitularDestino) then
            insertarOrdenado(ltATerceros, lt.current());
        lt.next();
    end;
end;

procedure inicializarMeses(var vm: vecMeses);
var
    i: integer;
begin
    for i:= 1 to 12 do 
        vm[i]:= 0;
end;

procedure procesarLista(ltATerceros: listaTransferencias; var vm: vecMeses; var totalOctubre: real);
var
    cuentaActual, cantTransferencias: integer;
    montoTotal, montoPorCuenta: real;
begin
    ltATerceros.reset();
    montoTotal:= 0;
    cantTransferencias:= 0;
    while not(ltATerceros.eol()) do begin
        cuentaActual:= ltATerceros.current().numCuentaOrigen;
        montoPorCuenta:= 0;
        while (not(ltATerceros.eol())) and (cuentaActual = ltATerceros.current().numCuentaOrigen) do begin
            vm[ltATerceros.current().fecha.mes]:= vm[ltATerceros.current().fecha.mes] + 1;
            montoPorCuenta:= montoPorCuenta + ltATerceros.current().monto;
            if (ltATerceros.current().fecha.mes = 10) then begin
                montoTotal:= montoTotal + ltATerceros.current().monto;
                cantTransferencias:= cantTransferencias + 1;
            end;
            ltATerceros.next();
        end;
        writeln('Cuenta: ', cuentaActual, ' - Monto total transferido a terceros: ', montoPorCuenta:0:2);
    end;
    if (cantTransferencias > 0) then
        totalOctubre:= montoTotal / cantTransferencias
    else
        writeln('No se realizaron transferencias a terceros en octubre.');
end;

function mesConMasTransferencias(vm: vecMeses): integer;
var
    i, mesMaximo, maximo: integer;
begin
    mesMaximo:= -1;
    maximo:= -1;
    for i:= 1 to 12 do begin
        if (vm[i] > maximo) then begin
            maximo:= vm[i];
            mesMaximo:= i;
        end;
    end;
    mesConMasTransferencias:= mesMaximo;
end;

var
    lt, ltATerceros: listaTransferencias;
    vm: vecMeses;
    totalOctubre: real;
    mesMaximo: integer;
begin
    lt:= listaTransferencias.create();
    cargarListaTransferencias(lt); //se dispone
    transferenciasATerceros(lt, ltATerceros);
    inicializarMeses(vm);
    procesarLista(ltATerceros, vm, totalOctubre);
    mesMaximo:= mesConMasTransferencias(vm);
    writeln('Mes con más transferencias a terceros: ', mesMaximo, ' - Cantidad: ', vm[mesMaximo]);
    writeln('Promedio de monto transferido a terceros en octubre: ', totalOctubre:0:2);
end.