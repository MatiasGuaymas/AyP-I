{4. La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar información de
préstamos de libros efectuados en febrero de 2024. Para ello, se debe leer la información de los préstamos
realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro prestado, nro. de socio al que se prestó el
libro, día del préstamo (1..29). La información de los préstamos se lee de manera ordenada por ISBN y finaliza
cuando se ingresa el ISBN -1.
Se pide:
a. Generar una lista que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado. Debe quedar
ordenada por ISBN de libro.
b. Calcular e informar el día del mes en que se realizaron menos préstamos.
c. Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par.}

program ejercicio4;
uses GenericLinkedList;
type
    regPrestamo = record
        nroPrestamo: integer;
        isbn: integer;
        nroSocio: integer;
        dia: integer; // 1..29
    end;

    listaPrestamos = specialize LinkedList<regPrestamo>;

    regCantPrestamos = record
        isbn: integer;
        cantPrestamos: integer;
    end;

    listaCantPrestamos = specialize LinkedList<regCantPrestamos>;
    vecDias = array[1..29] of integer;
procedure leerPrestamo(var p: regPrestamo);
begin
    writeln('Ingrese nro. de prestamo: ');
    readln(p.nroPrestamo);
    if (p.nroPrestamo <> -1) then begin
        writeln('Ingrese ISBN del libro prestado: ');
        readln(p.isbn);
        writeln('Ingrese nro. de socio al que se prestó el libro: ');
        readln(p.nroSocio);
        writeln('Ingrese dia del prestamo (1..29): ');
        readln(p.dia);
    end;
end;
// Estaría mal hacer un insert ordenado en la lista de prestamos, ya que el enunciado aclara que se lee de manera ordenada por ISBN. La lista va a terminar ordenada por ISBN
procedure cargarListaPrestamos(var lp: listaPrestamos);
var
    p: regPrestamo;
begin
    lp:= listaPrestamos.create();
    leerPrestamo(p);
    while (p.nroPrestamo <> -1) do begin
        lp.add(p);
        leerPrestamo(p);
    end;
end;
procedure inicializarDias(var vd: vecDias);
var
    i: integer;
begin
    for i:= 1 to 29 do 
        vd[i]:= 0;
end;
// Corte de control. La lista de prestamos original ya se encuentra ordenada por ISBN, por lo que no es necesario hacer un insert ordenado en la lista de cantidad de prestamos. La lista va a terminar ordenada por ISBN
procedure procesarLista(lp: listaPrestamos; var lNueva: liscaCantPrestamos; var vd: vecDias; var porcentaje: real);
var
    isbnActual, cantPrestamosTotal, cantPrestamosISBN, cantCumple: integer;
    reg: regCantPrestamos;
begin
    lp.reset();
    cantPrestamosTotal:= 0;
    cantCumple:= 0;
    while not(lp.eol()) do begin
        isbnActual:= lp.current().isbn;
        cantPrestamosISBN:= 0;
        while (not(lp.eol()) and (lp.current().isbn = isbnActual)) do begin
            cantPrestamosISBN:= cantPrestamosISBN + 1;
            vd[lp.current().dia]:= vd[lp.current().dia] + 1;
            if (lp.current().nroPrestamo mod 2 = 1) and (lp.current().nroSocio mod 2 = 0) then 
                cantCumple:= cantCumple + 1;
            lp.next();
        end;
        cantPrestamosTotal:= cantPrestamosTotal + cantPrestamosISBN;
        reg.isbn:= isbnActual;
        reg.cantPrestamos:= cantPrestamosISBN;
        lNueva.add(reg);
    end;
    if (cantPrestamosTotal > 0) then 
        porcentaje:= (cantCumple * 100) / cantPrestamosTotal
    else
        porcentaje:= 0;
end;
procedure calcularDiaMinimo(vd: vecDias; var diaMinimo: integer);
var
    i, min: integer;
begin
    min:= 9999;
    diaMinimo:= -1;
    for i:= 1 to 29 do begin
        if (vd[i] < min) then begin
            min:= vd[i];
            diaMinimo:= i;
        end;
    end;
end;
var
    lp: listaPrestamos;
    lNueva: listaCantPrestamos;
    vd: vecDias;
    diaMinimo: integer;
    porcentaje: real;
begin
    cargarListaPrestamos(lp);
    inicializarDias(vd);
    lNueva:= listaCantPrestamos.create();
    procesarLista(lp, lNueva, vd, porcentaje);
    calcularDiaMinimo(vd, diaMinimo);
    writeln('El dia del mes en que se realizaron menos prestamos es: ', diaMinimo);
    writeln('El porcentaje de prestamos que poseen nro. de prestamo impar y nro. de socio par es: ', porcentaje:0:2, '%');
end.