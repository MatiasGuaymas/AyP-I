{2. a. Dado un vector de enteros de 500 valores enteros, realice un módulo que reciba dicho vector y un valor n y
retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.}

program ejercicio2;
const
    DIMF = 500;
type
    Tvector = array[1..DIMF] of integer;
procedure cargarVector(var v: Tvector); // Se dispone
var
    i: integer;
begin
    for i := 1 to DIMF do
    begin
        v[i] := random(100); // Carga el vector con valores aleatorios entre 0 y 999
    end;
end;
function buscarEnVector(v: Tvector; n: integer): boolean;
var
    i: integer;
begin
    i := 1;
    while (i <= DIMF) and (v[i] <> n) do
        i := i + 1;
    buscarEnVector := (i <= DIMF); // Retorna true si se encontró el numero, false si no
end;
function buscarEnVectorOrdenado(v: Tvector; n: integer): boolean;
var
    i: integer;
begin
    i := 1;
    while (i <= DIMF) and (v[i] < n) do
        i := i + 1;
    buscarEnVectorOrdenado := (i <= DIMF) and (v[i] = n); // Retorna true si se encontró el numero, false si no
end;
procedure imprimirVector(v: Tvector);
var
    i: integer;
begin
    writeln('Contenido del vector:');
    for i := 1 to DIMF do
    begin
        write(v[i], ' ');
    end;
    writeln;
end;
var
    v: Tvector;
    n: integer;
begin
    randomize;
    cargarVector(v); // Se dispone
    imprimirVector(v);
    writeln('Ingrese un numero a buscar en el vector: ');
    readln(n);
    writeln('Buscando el numero ', n, ' en el vector...');
    if buscarEnVector(v, n) then
        writeln('El numero ', n, ' se encuentra en el vector.')
    else
        writeln('El numero ', n, ' no se encuentra en el vector.');
    
    writeln('Ingrese otro numero a buscar en el vector (ordenado): ');
    readln(n);
    writeln('Buscando el numero ', n, ' en el vector...');
    if buscarEnVector(v, n) then
        writeln('El numero ', n, ' se encuentra en el vector ordenado.')
    else
        writeln('El numero ', n, ' no se encuentra en el vector ordenado.');
end.