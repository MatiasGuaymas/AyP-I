{4. Utilizando el programa del ejercicio 3, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero G, y retorna la cantidad de elementos de la
lista que son mayores a G.}

program ejercicio4;
uses GenericLinkedList;
type
    ListaEnteros = specialize LinkedList <integer>;
Procedure armarLista (var le:ListaEnteros);
var
    num: integer;
begin
    le:= ListaEnteros.create(); // crea la lista vacía
    read(num);
    While (num <> 0) do begin
        le.add(num);
        read(num);
    end;
end;
procedure imprimirLista(le: ListaEnteros);
begin
    le.reset();
    while not le.eol() do begin
        write(le.current, ' '); 
        le.next(); 
    end;
end;
Procedure multiplosX (le:listaEnteros; x: integer);
begin
    le.reset();
    while (not (le.eol()) ) do begin
        if (le.current() mod x = 0) then
            write(le.current(), ' ');
        le.next ();
    end;
end;
function maximo(le: ListaEnteros): integer;
var
    max: integer;
begin
    le.reset();
    max:= -1;
    while not le.eol() do begin
        if le.current() > max then
            max := le.current();
        le.next();
    end;
    maximo := max;
end;
function minimo(le: ListaEnteros): integer;
var
    min: integer;
begin
    le.reset();
    min:= 9999;
    while not le.eol() do begin
        if le.current() < min then
            min := le.current();
        le.next();
    end;
    minimo := min;
end;
function mayoresX(le: ListaEnteros; x: integer): integer;
var
    cont: integer;
begin
    cont := 0;
    le.reset();
    while not le.eol() do begin
        if le.current() > x then
            cont := cont + 1;
        le.next();
    end;
    mayoresX := cont;
end;
var
    le : ListaEnteros;
    x: integer;
begin
    armarLista(le);
    imprimirLista(le); // Imprimir lista
    writeln('Ingrese un número para informar sus múltiplos: ');
    readln(x);
    writeln('Los múltiplos de ', x, ' son: ');
    multiplosX(le, x); // Informar múltiplos de x
    writeln('El máximo de la lista es: ', maximo(le)); // Imprimir máximo
    writeln('El mínimo de la lista es: ', minimo(le)); // Imprimir mínimo
    writeln('La cantidad de elementos mayores a ', x, ' es: ', mayoresX(le, x)); // Imprimir cantidad de elementos mayores a x
end. 