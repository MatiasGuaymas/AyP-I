{7. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (2500 empleados).
Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}

program ejercicio7;
const
	dimf = 2500;
type
	vecSalarios = array[1..2500] of real;
procedure cargarVector(var v: vecSalarios);
var
	i: integer;
begin
	for i:= 1 to dimf do
        begin
            writeln('Ingrese el salario del empleado ', i);
            readln(v[i]);
        end;
end;
procedure incrementarSalarios(var v: vecSalarios; x: real);
var
	i: integer;
    porcentaje: real;
begin
	porcentaje := 1 + x/100;
	for i:= 1 to dimf do
		begin
			v[i]:= v[i] * porcentaje;
		end;
end;
procedure imprimirVector(v: vecSalarios);
var
	i: integer;
begin
	for i:= 1 to dimf do
		writeln('Salario empleado ', i, '=',v[i]:0:2);
end;
Procedure promedio (vs:vecSalarios);
var
    suma: real;
    i: integer
begin
    suma:=0;
    for i:= 1 to dimF do
        suma:= suma+vs[i];
    writeln ('El salario promedio es :', suma/dimF)
end;
var
	v: vecSalarios;
begin
	cargarVector(v);
    imprimirVector(v);
	incrementarSalarios(v, 15);
	imprimirVector(v);
    promedio(v);
end.