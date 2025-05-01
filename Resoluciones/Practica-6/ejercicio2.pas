{2. Se dispone de una lista de números reales.
a. Realice un módulo que imprima la lista.
b. Realice un módulo que retorne el porcentaje de números positivos.
c. Realice el programa principal que invoque el módulo del inciso a, e informe el módulo del inciso b.}

program Ejercicio2;
uses GenericLinkedList;
type
    ListaReales = specialize LinkedList <real>;
procedure cargarLista(var lr: ListaReales); // SE DISPONE
var
    num: real;
begin
    lr := ListaReales.create();
    num:= Random(20)-3;
    while (num <> 0) do begin
        lr.add(num);
        num:= Random(20)-3;
    end;
end;
procedure imprimirLista(lr: ListaReales); // MODULO A
begin
    lr.reset();
    while not lr.eol() do begin
        write(lr.current:0:2, ' '); 
        lr.next();
    end;
end;
function calcularPorcentajePositivos(lr: ListaReales): real; // MODULO B
var
    cantPositivos, totalNumeros: integer;
begin
    cantPositivos := 0;
    totalNumeros := 0;
    lr.reset();
    while not lr.eol() do begin
        if (lr.current > 0) then begin
            cantPositivos := cantPositivos + 1;
        end;
        totalNumeros := totalNumeros + 1;
        lr.next();
    end;
    if totalNumeros = 0 then begin
        calcularPorcentajePositivos := 0; // Evitar división por cero
    end else begin
        calcularPorcentajePositivos := (cantPositivos / totalNumeros) * 100;
    end;
end;
var
    lr: ListaReales;
begin
    cargarLista(lr); // SE DISPONE
    writeln('Lista de números reales:');
    imprimirLista(lr); // Imprimir la lista
    writeln('Porcentaje de números positivos: ', calcularPorcentajePositivos(lr):0:2, '%');
end.