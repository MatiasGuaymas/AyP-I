{6. a. Escriba un procedimiento que lea la altura de una cantidad de personas y devuelva el promedio de éstas. La cantidad
de personas se recibe como parámetro.
b. Escriba un programa que procese la altura de 48 personas utilizando el módulo desarrollado en a) e informe el
resultado.}

program ejercicio6;
procedure PromedioAlturas(cantPersonas: integer; var prom: real);
var
	i: integer;
	altura, suma: real;
begin
	suma:= 0;
	for i:= 1 to cantPersonas do begin
		readln(altura);		
		suma:= suma + altura;
    end;
    prom:= suma /cantPersonas;
end; 
{function PromedioAlturas(cantPersonas: integer): real;
var
    i: integer;
    altura, suma: real;
begin
    suma:= 0;
    for i:= 1 to cantPersonas do begin
        readln(altura);
        suma:= suma + altura;
    end;
    PromedioAlturas:= suma / cantPersonas;
end;}
Var
	cantPersonas: integer;
	prom: real;
begin
    cantPersonas:= 5; // o readln(cantPersonas);
	PromedioAlturas(cantPersonas, prom);
	Writeln('El promedio de alturas de ', cantPersonas, ' personas 	es ', prom:0:2); 
end.
