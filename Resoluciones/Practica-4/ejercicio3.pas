{3. Se dispone de un vector con números enteros de tamaño TAM.
a. Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b. Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c. Realizar un módulo que imprima el vector desde la mitad (TAM DIV 2) hacia la primera posición, y desde la mitad
más uno hacia la última posición.
d. Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la posición
X hasta la Y. Asuma que tanto X como Y son menores o igual a TAM. Y considere que, dependiendo de los valores
de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e. Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}

program ejercicio3;
const
	TAM = 30;
type
	vector = array [1..TAM] of integer;
procedure cargarVector(var v: vector); //Se dispone#
var
    i: integer;
begin
    for i:= 1 to TAM do
        begin
            //v[i]:= Random(100); //Cargar el vector con valores aleatorios entre 0 y 99
            writeln('Ingrese un numero: ');
            readln(v[i]);
        end;
end;
procedure imprimirVectorOrden(v: vector);
var
	i: integer;
begin
	for i:= 1 to TAM do
		write(v[i], ' | ');
end;
procedure imprimirVectorInvertido(v: vector);
var
	i: integer;
begin
	for i:= TAM downto 1 do
		write(v[i], ' | ');
end;
procedure imprimirVectorMitad(v: vector);
var
	i: integer;
	mitad: integer;
begin
	mitad:= TAM DIV 2;
	writeln('Primera mitad:');
	for i:= mitad downto 1 do
		write(v[i], ' | ');
    writeln();
	writeln('Segunda mitad: ');
	for i:= mitad+1 to TAM do
		write(v[i], ' | ');
end;
procedure imprimirEntreValores(v: vector; x, y: integer);
var
	i: integer;
begin
	if(x > y) then
		for i:= x downto y do
			write(v[i], ' | ')
	else
		for i:= x to y do
			write(v[i], ' | ');
end;
var
	v: vector;
	x, y: integer;
begin
    Randomize;
	cargarVector(v);
	imprimirVectorOrden(v);
    writeln();
	imprimirVectorInvertido(v);
    writeln();
	imprimirVectorMitad(v);
    writeln();
	writeln('Ingrese un valor x');
	readln(x);
	writeln('Ingrese un valor y');
	readln(y);
	imprimirEntreValores(v, x, y);
    writeln();
    writeln('Reutilizando el modulo entre valores');
	imprimirEntreValores(v, 1, TAM);
    writeln();
	imprimirEntreValores(v, TAM, 1);
    writeln();
	imprimirEntreValores(v, 1, TAM DIV 2);
    writeln();
	imprimirEntreValores(v, (TAM div 2) + 1, TAM);
end.
