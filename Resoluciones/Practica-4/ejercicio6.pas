{6. a. Realizar un programa que lea y almacene la información de 519 alumnos ingresantes de la carrera Ciencia de Datos
en Organizaciones en el año 2025. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y año de
nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
● El porcentaje de alumnos con DNI pares.
● Apellido y nombre de los dos alumnos de mayor edad}

program ejercicio6;
const
	dimf = 519;
type
	alumno = record
		nro: integer;
		dni: integer;
		apellido: string;
		nombre: string;
		nacimiento: integer;
	end;
	vecAlumnos = array [1..519] of alumno;
procedure leerAlumno(var a: alumno);
begin
	writeln('Ingrese el numero de inscripcion del alumno');
	readln(a.nro);
	writeln('Ingrese el dni del alumno');
	readln(a.dni);
	writeln('Ingrese el apellido del alumno');
	readln(a.apellido);
	writeln('Ingrese el nombre del alumno');
	readln(a.nombre);
	writeln('Ingrese el anio de nacimiento del alumno');
	readln(a.nacimiento);
end;
procedure cargarVector(var v: vecAlumnos);
var
	a: alumno;
	i: integer;
begin
	for i:= 1 to dimf do
		begin
			leerAlumno(a);
			v[i]:= a;
		end;
end;
procedure maximos(var max1, max2: integer; var apellidoMax1, apellidoMax2, nombreMax1, nombreMax2: string; edad: integer; ap, nom: string);
begin
	if(edad > max1) then
		begin
			apellidoMax2:= apellidoMax1;
			apellidoMax1:= ap;
			nombreMax2:= nombreMax1;
			nombreMax1:= nom;
			max2:= max1;
			max1:= edad;
		end
	else
		if(edad > max2) then
			begin
				apellidoMax2:= ap;
				nombreMax2:= nom;
				max2:= edad;
			end;
end;
procedure calcular(v: vecAlumnos; var porcentaje: real; var apellidoMax1, apellidoMax2, nombreMax1, nombreMax2: string);
var
	i: integer;
	max1, max2, cantAluPares, edad: integer;
begin
	max1:= -1;
	max2:= -1;
	cantAluPares:= 0;
	for i:= 1 to dimf do
		begin
			if(v[i].DNI MOD 2 = 0) then
				cantAluPares:= cantAluPares + 1;
			edad:= 2025 - v[i].nacimiento;
			maximos(max1, max2, apellidoMax1, apellidoMax2, nombreMax1, nombreMax2, edad, v[i].apellido, v[i].nombre);	
		end;
	porcentaje:= (cantAluPares / dimf)*100;
end;
var
	v: vecAlumnos;
	porcentaje: real;
	apellidoMax1, apellidoMax2, nombreMax1, nombreMax2: string;
begin
	cargarVector(v);
	calcular(v, porcentaje, apellidoMax1, apellidoMax2, nombreMax1, nombreMax2);
	writeln('El porcentaje de alumnos con DNI pares es: ', porcentaje:0:2);
	writeln('El apellido y nombre de los dos alumnos de mayor edad son: ', apellidoMax1, ' ', nombreMax1, ' y ', apellidoMax2, ' ', nombreMax2);
end.