{3. Dado el siguiente programa:
program Listas;
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
var
    le : ListaEnteros;
    x: integer;
begin
    armarLista(le);
    //imprimir lista
    // informar múltiplos
end. 

a. Indicar qué hace el programa.
El programa crea una lista de números enteros a partir de la entrada del usuario. El usuario ingresa números enteros hasta que ingresa 0, que indica el final de la entrada. Luego, la lista se puede imprimir y se pueden informar los múltiplos de un número x.
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 80, 1, 63, 120, 0.
La lista quedará conformada por los números 80, 1, 63 y 120. El número 0 no se agrega a la lista, ya que indica el final de la entrada.
c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
d. Implementar un módulo que reciba la lista y un valor x, e informe los números múltiplos de x.}

program ejercicio3;
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
end. 