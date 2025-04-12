{2. Dado el siguiente programa, complete las líneas indicadas, considerando que:
a. El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como parámetro. Al
finalizar, debe retornar el vector.
b. El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados con el valor
n y también debe devolver la suma de todos los elementos del vector.}

program ejercicio2;
const
    cant_datos = 150;
type
    vdatos = array[1..cant_datos] of real;
procedure cargarVector(var v:vdatos);
var
    i: integer;
begin
    for i:= 1 to cant_datos do
        begin
            writeln('Ingrese un numero real a agregar al vector');
            read(v[i]);
        end;
end;
procedure modificarVectorySumar(var v:vdatos; n: real; var suma: real);
var
    i: integer;
begin
    for i:= 1 to cant_datos do
        begin
            v[i]:= v[i] + n;
            suma:= suma + v[i]; // O al reves tambien. El ejercicio no aclara
        end;
end;
var
    datos : vdatos;
    i: integer;
    num, suma : real;
begin
    suma := 0;
    cargarVector(datos);
    writeln('Ingrese un valor a sumar');
    readln(num);
    modificarVectorySumar(datos, num, suma);
    writeln('La suma de los valores es: ', suma:0:2);
end.