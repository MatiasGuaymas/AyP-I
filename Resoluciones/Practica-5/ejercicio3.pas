{3. Se dispone de un vector de 140 números enteros sin ningún orden. Realice los siguientes pasos y pase este ejercicio
a Pascal para probar su funcionamiento con el archivo ordenarVector.pas:
1. Imprima el vector.
2. Aplique el método de selección para ordenar el vector.
3. Imprima el vector nuevamente.}

program ejercicio3;
const
	TOTAL = 140;
type
	vector = array [1..TOTAL] of integer;

procedure generarVector(var v: vector); // No lo deberían implementar porque se dispone
var 
	i: integer;
begin
	for i := 1 to TOTAL  do
		//readln(v[i]);  // La lectura es lo que hacen en un parcial para cargar un vector
		v[i]:= random(150)-50; // asigna numeros entre -50 y 99
end;

procedure imprimirVector(v: vector);
var
    i: integer;
begin
    for i := 1 to TOTAL do
        write(v[i], ' | ');
    writeln;
end;

Procedure ordenarVector (var v: vector);
var 
    i, j, p, elemento: integer;
begin
    for i:=1 to TOTAL-1 do begin
    { busca el mínimo v[p] entre v[i], ..., v[N] }
        p := i;
        for j := i+1 to TOTAL do
            if (v[ j ] < v[ p ]) then p:=j;
        {intercambia v[i] y v[p] }
        elemento := v[ p ];
        v[ p ] := v[ i ];
        v[ i ] := elemento;
    end;
end;

var
    v: vector;
begin
    randomize;
    generarVector(v);
    imprimirVector(v);
    ordenarVector(v);
    writeln('-----------------');
    writeln('Vector ordenado: ');
    imprimirVector(v);
end.