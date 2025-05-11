{9. Realizar un programa que procese la información de las becas otorgadas durante el primer semestre del 2024.
Para ello se dispone de una lista con la información de las becas. De cada beca otorgada se conoce el DNI del
estudiante, tipo de beca (entre 1 y 15), la facultad en la que estudia y la ciudad de donde proviene el estudiante.
La información no posee ningún orden y los DNI no se repiten.
Además, se dispone de un vector que posee el monto de beca asignado para cada tipo de beca.
I. Se pide recorrer la lista una sola vez para:
a. Generar una nueva lista que contenga el DNI y monto asignado para aquellas becas otorgadas a
estudiantes cuyo tipo de beca sea impar.
b. Calcular e informar los dos tipos de beca con mayor cantidad de dinero otorgado.
c. Calcular e informar el porcentaje de estudiantes de la Facultad de Informática provenientes de
Quilmes, Avellaneda o Berazategui.
II. Realizar un módulo que elimine de la lista generada en el inciso 1a todos los estudiantes cuyo DNI sea
par y retorne la cantidad de estudiantes eliminados.
Nota: Hacer el programa principal. Modularizar la solución.}

program ejercicio9;
uses GenericLinkedList;
type
    regBeca = record
        dni: integer;
        tipoBeca: integer; // 1..15
        facultad: string;
        ciudad: string;
    end;

    listaBecas = specialize LinkedList<regBeca>;

    vecMontos = array[1..15] of real;

    regBecaImpar = record
        dni: integer;
        monto: real;
    end;

    listaBecaImpar = specialize LinkedList<regBecaImpar>;

procedure generarLista(var lista: listaBecas); // Se dispone
begin
end;

procedure generarVector(var v: vecMontos); // Se dispone
begin
end;

procedure inicializarVector(var v: vecMontos);
var
    i: integer;
begin
    for i := 1 to 15 do
        v[i] := 0;
end;

procedure recorrerLista(lista: listaBecas; v: vecMontos; var listaImpar: listaBecaImpar; var vecSuma: vecMontos; var porcentaje: real);
var
    beca: regBecaImpar;
    totalEstudiantes, cantCumple: integer;
begin
    lista.reset();
    totalEstudiantes := 0;
    cantCumple := 0;
    // En vez de hacer tantos lista.current() se puede hacer una variable auxiliar
    // y asignarle el valor de lista.current() para no repetir tanto el acceso a la lista
    while (not lista.eol()) do begin
        totalEstudiantes := totalEstudiantes + 1;
        if (lista.current().tipoBeca mod 2 = 1) then begin
            beca.dni := lista.current().dni;
            beca.monto:= v[lista.current().tipoBeca];
            listaImpar.add(beca);
        end;
        vecSuma[lista.current().tipoBeca] := vecSuma[lista.current().tipoBeca] + v[lista.current().tipoBeca];
        if ((lista.current().facultad = 'Informática') and ((lista.current().ciudad = 'Quilmes') or (lista.current().ciudad = 'Avellaneda') or (lista.current().ciudad = 'Berazategui'))) then
            cantCumple := cantCumple + 1;
        lista.next();
    end;
    if (totalEstudiantes > 0) then
        porcentaje := (cantCumple * 100) / totalEstudiantes
    else
        porcentaje := 0;
end;
procedure calcularMaximos(vecSuma: vecMontos; var becaMax1, becaMax2: integer);
var
    i: integer;
    max1, max2: real;
begin
    max1 := -1;
    max2 := -1;
    becaMax1 := -1;
    becaMax2 := -1;
    for i := 1 to 15 do begin
        if (vecSuma[i] > max1) then begin
            max2 := max1;
            becaMax2 := becaMax1;
            max1 := vecSuma[i];
            becaMax1 := i;
        end
        else if (vecSuma[i] > max2) then begin
            max2 := vecSuma[i];
            becaMax2 := i;
        end;
    end;
end;
procedure eliminarDNIPar(var lista: listaBecaImpar; var cantEliminados: integer);
begin
    cantEliminados := 0;
    lista.reset();
    while (not lista.eol()) do begin
        if (lista.current().dni mod 2 = 0) then begin
            lista.removeCurrent();
            cantEliminados := cantEliminados + 1;
        end
        else
            lista.next();
    end;
end;
var
    lista: listaBecas;
    v: vecMontos;
    listaImpar: listaBecaImpar;
    vecSuma: vecMontos;
    porcentaje: real;
    becaMax1, becaMax2, cantEliminados: integer;
begin
    lista := listaBecas.create();
    generarLista(lista); // Se dispone
    generarVector(v); // Se dispone
    inicializarVector(vecSuma);
    listaImpar := listaBecaImpar.create();
    recorrerLista(lista, v, listaImpar, vecSuma, porcentaje);
    calcularMaximos(vecSuma, becaMax1, becaMax2);
    writeln('Porcentaje de estudiantes de la Facultad de Informática provenientes de Quilmes, Avellaneda o Berazategui: ', porcentaje:0:2, '%');
    writeln('Los dos tipos de beca con mayor cantidad de dinero otorgado son: ', becaMax1, ' y ', becaMax2);
    eliminarDNIPar(listaImpar, cantEliminados);
    writeln('Cantidad de estudiantes eliminados: ', cantEliminados);
end.