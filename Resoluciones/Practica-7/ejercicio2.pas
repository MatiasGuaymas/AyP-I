{2. Dada una lista de lugares turísticos identificados por nombre y país, escribir un programa que implemente los
siguientes módulos:
a. Calcular la longitud de la lista.
b. Calcular la cantidad de veces que aparece un país dado (un país puede aparecer más de una vez, ya que
puede haber diferentes lugares turísticos).
c. Eliminar un lugar turístico que se recibe como parámetro
d. Eliminar todas las ocurrencias de un país que se recibe como parámetro
e. Dado un país, si existe, generar una nueva lista con los nombres de sus lugares turísticos.
f. Agregar al principio de la lista creada en e) un nuevo lugar turístico.}

program ejercicio2;
Uses GenericLinkedList;
type
    lugar = record
        nombre: string;
        pais: string;
    end;
    ListaLugares = specialize LinkedList <lugar>;
    ListaPaisConLugares = specialize LinkedList <string>;
//La lista de lugares turísticos se dispone, no es necesario declarar los módulos de lectura y armado de lista
Procedure LeerLugar (var l: lugar);
Begin
    readln(l.nombre);
    if (l.nombre <> '0') then begin
        readln(l.pais);
    end;
end;
Procedure armarLista (var ll:ListaLugares); 
var
    l: lugar;
begin
    ll:= ListaLugares.create();
    leerLugar(l);
    while (l.nombre <> '0') do
        begin
            ll.add(l);
            leerLugar(l);
        end;
end;
function longitud (ll:ListaLugares): integer;
var
    cont: integer;
begin
    cont:= 0;
    ll.reset();
    while(not ll.eol()) do begin
        cont:= cont + 1;
        ll.next();
    end;
    longitud:= cont;
end;
function cantidadPais (ll:ListaLugares; pais: string): integer;
var
    cont: integer;
begin
    cont:= 0;
    ll.reset();
    while(not ll.eol()) do begin
        if (ll.current().pais = pais) then
            cont:= cont + 1;
        ll.next();
    end;
    cantidadPais:= cont;
end;
Procedure eliminarLT (var lt: ListaLugares; lugar: string; var encontre: boolean);
begin
    lt.reset();
    encontre:= false;
    while (not lt.eol()) and not encontre do begin
        if (lt.current().nombre=lugar) then
            encontre:= true
        else
            lt.next();
    end;
    if (encontre) then
        lt.removeCurrent();
end;
Procedure eliminarPais (var lt: ListaLugares; pais: string);
begin
    lt.reset();
    while (not lt.eol()) do begin
        if (lt.current().pais = pais) then
            lt.removeCurrent()
        else
            lt.next();
    end;
end;
procedure generarLista (ll: ListaLugares; pais: string; var ll2: ListaPaisConLugares);
begin
    ll2:= ListaPaisConLugares.create();
    ll.reset();
    while (not ll.eol()) do begin
        if (ll.current().pais = pais) then
            ll2.add(ll.current().nombre);
        ll.next();
    end;
end;
procedure agregarLugar (var ll2: ListaPaisConLugares; lugar: string);
begin
    ll2.addFirst(lugar);
end;
procedure imprimirLista (ll: ListaLugares);
begin
    ll.reset();
    while (not ll.eol()) do begin
        writeln(ll.current().nombre, ' ', ll.current().pais);
        ll.next();
    end;
end;
procedure imprimirLista2 (ll: ListaPaisConLugares);
begin
    ll.reset();
    while (not ll.eol()) do begin
        writeln(ll.current());
        ll.next();
    end;
end;
var
    ll: ListaLugares;
    ll2: ListaPaisConLugares;
    l: lugar;
    pais, lugarElim: string;
    encontre: boolean;
begin
    armarLista(ll); // Se dispone la lista de lugares turísticos
    imprimirLista(ll);
    writeln('La longitud de la lista es: ', longitud(ll));
    writeln('Ingrese un pais: ');
    readln(pais);
    writeln('La cantidad de veces que aparece el pais ', pais, ' es: ', cantidadPais(ll, pais));
    writeln('Ingrese un lugar turistico a eliminar: ');
    readln(lugarElim);
    eliminarLT(ll, lugarElim, encontre);
    if (encontre) then
        writeln('Se elimino el lugar turistico ', lugarElim)
    else
        writeln('No se encontro el lugar turistico ', lugarElim);
    writeln('Ingrese un pais a eliminar: ');
    readln(pais);
    eliminarPais(ll, pais);
    imprimirLista(ll);
    writeln('Ingrese un pais para generar una nueva lista: ');
    readln(pais);
    generarLista(ll, pais, ll2);
    imprimirLista2(ll2);
    writeln('Ingrese un lugar turistico a agregar al principio de la lista: ');
    readln(lugarElim);
    agregarLugar(ll2, lugarElim);
    imprimirLista2(ll2);
end.

