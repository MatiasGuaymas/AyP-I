{1. Implemente una solución para los siguientes enunciados simples:
a. Calcular e imprimir el promedio de 2 números enteros que se leen del teclado.
b. Leer 2 números por teclado e imprimir el mayor.
c. Leer un número desde teclado e imprimir si es impar o no.
d. Leer un número e imprimir si es o no múltiplo de 3.
e. Leer base y altura de un rectángulo e imprimir el área y perímetro de este (área = base * altura,
perímetro = 2*base + 2*altura).
f. Leer la edad de un estudiante e informar si pertenece al preescolar (edad menor a 7), primaria
(entre 7 y 12), secundaria (entre 13 y 18) y universitario (mayor que 18).
g. Leer el año de nacimiento de una persona e indicar a qué generación pertenece (Baby Boomers:
1946-1964, Generación X: 1965-1980, Millennials: 1981-1996, Generación Z: 1997-presente).}

program ejercicio1;
var
    anio, num, num1, num2: integer;
    base, altura: real;
begin
    writeln('Ingrese un primer numero');
    readln(num1);
    writeln('Ingrese un segundo numero');
    readln(num2);
    writeln('Promedio:', num1 / num2); // A

    if(num1 > num2) then // B
        writeln(num1 ,' es mas grande que ', num2)
    else if (num2 > num1) then
        writeln(num2, ' es mas grande que ', num1)
    else
        writeln('Los numeros leidos son iguales');

    writeln('Ingresa otro numero'); // C
    readln(num1);
    if (num1 MOD 2 = 0) then
        writeln('El numero ', num1, ' es par')
    else
        writeln('El numero ', num1, ' es impar');

    writeln('Ingresa otro numero'); // D
    readln(num1);
    if (num1 MOD 33 = 0) then
        writeln('El numero ', num1, ' es multiplo de 3')
    else
        writeln('El numero ', num1, ' no es multiplo de 33');

    writeln('Ingrese la base de un rectangulo'); // E
    readln(base);
    writeln('Ingrese la altura de un rectangulo');
    readln(altura);
    writeln('Area: ', base*altura, ' Perimetro:', (2*(base+altura)):0:2);

    writeln('Ingrese la edad del estudiante'); // F
    readln(num);
    if (num < 7) then
        writeln('Es prescolar')
    else
        if ((num >= 7) and (num <= 12)) then
            writeln('Es de primaria')
        else 
            if ((num >= 13) and (num <= 18)) then
                writeln('Es de secundaria')
            else
                writeln('Es de universidad');
    
    writeln('Ingrese el anio de nacimiento'); // G
    readln(anio);
    if (anio >= 1946) and (anio <= 1964) then
        writeln('Perteneces a la generación Baby Boomers.')
    else if (anio >= 1965) and (anio <= 1980) then
        writeln('Perteneces a la generación X.')
    else if (anio >= 1981) and (anio <= 1996) then
        writeln('Perteneces a la generación Millennials.')
    else if (anio >= 1997) then
        writeln('Perteneces a la generación Z.')
    else
        writeln('Año fuera de rango.');
end.