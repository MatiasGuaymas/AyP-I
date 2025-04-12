{5. a. Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea 250 números enteros desde
teclado y los almacene en un vector. Al finalizar la carga, se debe intercambiar la posición del mayor elemento por
la del menor elemento, e informe la operación realizada de la siguiente manera: “El elemento máximo ... que se
encontraba en la posición ... fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.
b. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y otra
para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas posiciones.}

program ejercicio5;
const
	dimF = 250;
type
	vector = array [1..dimF] of integer;
procedure cargarVector(var v: vector); //Se dispone
var
	i: integer;
begin
	for i:= 1 to dimF do
        begin
            writeln('Ingrese un numero: ');
            readln(v[i]);
        end;
end;
procedure imprimirVector(v: vector);
var
	i: integer;
begin
	for i:= 1 to DIMF do
		write(v[i], ' | ');
end;
procedure intercambio(var v: vector; x, y: integer);
var
	aux: integer;
begin
	aux:= v[x];
	v[x]:= v[y];
	v[y]:= aux;
end;
procedure elementoMaximo(v: vector; var posMax, numMax: integer);
var
	i: integer;
begin
	for i:= 1 to DIMF do
		if(v[i] > numMax) then
			begin
				numMax:= v[i];
				posMax:= i;
			end;
end;
procedure elementoMinimo(v: vector; var posMin, numMin: integer);
var
	i: integer;
begin
	for i:= 1 to DIMF do
		if(v[i] < numMin) then
			begin
				numMin:= v[i];
				posMin:= i;
			end;
end;
procedure elementoMaximoMinimo(v: vector; var posMax, posMin: integer);
var
    i: integer;
    numMax, numMin: integer;
begin
    numMax:= -9999;
    numMin:= 9999;
    for i:= 1 to DIMF do
        begin
            // Modularizar maximo
            if(v[i] > numMax) then
                begin
                    numMax:= v[i];
                    posMax:= i;
                end;
            // Modularizar minimo
            if(v[i] < numMin) then
                begin
                    numMin:= v[i];
                    posMin:= i;
                end;
        end;
end;
var
	v: vector;
	posMax, posMin, numMax, numMin, posMaxIncisoB, posMinIncisoB: integer;
begin
    Randomize;
	cargarVector(v);
	imprimirVector(v);
	writeln();
	posMax:= -1;
	posMin:= -1;
	numMax:= -9999;
	numMin:= 9999;
	elementoMaximo(v, posMax, numMax);
	elementoMinimo(v, posMin, numMin);
    elementoMaximoMinimo(v, posMaxIncisoB, posMinIncisoB);
	intercambio(v, posMin, posMax);
	imprimirVector(v);
	writeln();
	writeln('A. El elemento maximo ', numMax, ' que se encontraba en la posicion ', posMax, ' fue intercambiado con el elemento minimo ', numMin, ' que se encontraba en la posicion ', posMin);
    writeln('B. Posicion del maximo: ', posMaxIncisoB, ' | Posicion del minimo: ', posMinIncisoB);
end.
