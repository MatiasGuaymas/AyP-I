{8. Se cuenta con una lista que contiene información de las ventas realizadas por una empresa de venta de pasajes
aéreos. Cada venta está compuesta por un nombre de persona, código de vuelo, categoría de pasaje (1..4) y
número de asiento. La lista puede contener 0, 1 o más registros por cada código de vuelo, y está ordenada por
este campo. El costo de un pasaje depende de su categoría. Se dispone de una estructura que por cada categoría
(1..4 ) se almacena su precio.
a. Generar una lista de registros que contenga por cada código de vuelo, el total de pasajes vendidos y el
monto total recaudado.
b. Generar una lista de los códigos de vuelos cuya cantidad de pasajes vendidos sea mayor que 46. La lista
debe ir generándose ordenada por monto total a medida que se realiza el punto a).}

program ejercicio8;
Uses GenericLinkedList;
const
    CATEG = 4;
Type 
    pasaje= record
        nombre: string;
        codigo: integer; 
        categoria: integer; 
        asiento: integer;
    end;
    resumen= record
        codigo: integer;
        cantidad: integer; 
        monto: real; 
    end;
    listaPasajes = specialize LinkedList <pasaje>;
    listaResumen = specialize LinkedList <resumen>;
    vectorPrecios = array [1..CATEG] of real;  
procedure generarListaPasajes(var lp: listaPasajes); // Se dispone
procedure generarVectorPrecios(var vp: vectorPrecios); // Se dispone
procedure ProcesarLista(lp:listaPasajes; vp:vectorPrecios; var la,lb: listaResumen);
var 
    actual: resumen;
Begin
    lp.reset();
    la:=ListaResumen.create();   
    lb:=ListaResumen.create();
    while (not (lp.eol()) ) do begin
        actual.codigo:=lp.current().codigo; //guarda el código actual
        actual.cantidad:=0; //acumula el total de pasajes para el código actual 
        actual.monto:=0; // acumula el monto total para el código actual
        while (not (lp.eol()) and (actual.codigo =lp.current().codigo)) do begin
            actual.cantidad := actual.cantidad + 1;
            actual.monto := actual.monto + vp[lp.current().categoria]; //accedo al precio
            lp.next();
        end;
        la.add(actual); // almaceno en lista a acumulando por codigo de vuelo;
        if (actual.cantidad > 46) then
            insertarOrdenado(lb,actual); // almaceno en lista b por cantidad de pasajes;
    end;     
end;  
procedure insertarOrdenado(var l: listaResumen; res: resumen);
begin
    l.reset(); // se coloca al inicio de la lista. 
    while not(l.eol()) and (l.current().monto < res.monto) do 
	    l.next(); 
    l.insertCurrent(res);  
end;
Var {variables del programa principal}
    lpasajes:listaPasajes;
    listaA,listaB:listaResumen;
    vPrecios: vectorPrecios;
begin
    cargarprecios(vPrecios);  // se dispone
    cargarlista(lPasajes); // se dispone
    procesarLista(lPasajes,vPrecios,listaA,listaB);       
    // Imprimir lista A y lista B
end.



