{1. Utilizando el programa del ejercicio 3 Práctica 6, realizar los siguientes cambios:
a. Modificar el módulo armarLista para que los elementos se guarden en la lista en el orden inverso en que
fueron ingresados (agregar adelante).
b. Modificar el módulo armarLista para que los elementos se guarden en la lista en orden ascendente (insertar
ordenado).}

program ejercicio1;
Uses GenericLinkedList;
type
    ListaEnteros = specialize LinkedList <integer>;
Procedure armarLista (var le:ListaEnteros);
var
    num: integer;
begin
    le:= ListaEnteros.create();
    read(num);
    while (num <> 0) do begin
        le.addFirst(num);
        read(num);
    end;
end; 
Procedure insertar (var le:ListaEnteros; valor:integer);
begin
    le.reset();
    while((not le.eol()) and (le.current() < valor)) do 
        le.next();
    le.insertCurrent(valor);
end; 
procedure armarListaOrdenada(var le : ListaEnteros);
var
    num: integer;
begin
    le:= ListaEnteros.create(); 
    read(num);
    while (num <> 0) do begin
        insertar(le, num);
        read(num);
    end;
end;
procedure imprimirLista(le: ListaEnteros);
begin
    le.reset();
    while(not le.eol()) do begin
        write(le.current(), ' ');
        le.next();
    end;
end;
Var 
    le, leOrdenada : ListaEnteros;
Begin 
    armarLista(le);
    imprimirLista(le);
    writeln();
    armarListaOrdenada(leOrdenada);
    imprimirLista(leOrdenada);
end.