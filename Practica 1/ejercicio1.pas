{1. Implemente una solución para los siguientes enunciados simples:
a. Calcular e imprimir el promedio de 2 números que se leen del teclado.
b. Leer 2 números por teclado e imprimir el mayor.
c. Leer un número desde teclado e imprimir si es par o no.
d. Leer un número e imprimir si es o no múltiplo de 5 (termina en 0 o 5).
e. Leer un número del 0 al 9 e imprimir la tabla de multiplicar de ese número.
f. Leer base y altura de un rectángulo e imprimir el área (base x altura) y perímetro (2x(base+altura))
de este.
g. Leer la cantidad de millas de un boleto de avión y determinar las millas de regalo que les
corresponden al comprador, sabiendo que se acumula 1 milla de regalo cada 100 millas de viajes.
h. Leer la edad de un estudiante e informar si pertenece al preescolar (edad menor a 7), primaria
(entre 7 y 12), secundaria (entre 13 y 18) y universitario (mayor que 18).
i. Leer edad y sexo de una persona e indicar la cantidad de años que le faltan para jubilarse,
considerando la edad de jubilación para hombres (65 años) y mujeres (60 años) en Argentina. Tener
en cuenta que el valor de los años para jubilarse no puede ser menor que 0.
j. Leer el año de nacimiento de una persona e indicar a qué generación pertenece (Baby Boomers:
1946-1964, Generación X: 1965-1980, Millennials: 1981-1996, Generación Z: 1997-presente).}

program ejercicio1;
var
    anio, num, num1, num2: integer;
    base, altura: real;
    sexo: char;
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
    if (num1 MOD 5 = 0) then
        writeln('El numero ', num1, ' es multiplo de 5')
    else
        writeln('El numero ', num1, ' no es multiplo de 5');

    writeln('Ingresa otro numero'); // E
    readln(num);
    if (num >= 0) and (num <= 9) then
        begin
            writeln(num, ' x 0= ', num*0);
            writeln(num, ' x 1= ', num*1);
            writeln(num, ' x 2= ', num*2);
            writeln(num, ' x 3= ', num*3);
            writeln(num, ' x 4= ', num*4);
            writeln(num, ' x 5= ', num*5);
            writeln(num, ' x 6= ', num*6);
            writeln(num, ' x 7= ', num*7);
            writeln(num, ' x 8= ', num*8);
            writeln(num, ' x 9= ', num*9);
        end;

    writeln('Ingrese la base de un rectangulo'); // F
    readln(base);
    writeln('Ingrese la altura de un rectangulo');
    readln(altura);
    writeln('Area: ', base*altura, ' Perimetro:', (2*(base+altura)):0:2);

    writeln('Ingrese la cantidad de millas'); // G
    readln(num1);
    writeln('Le corresponden: ', num1 div 100, ' millas de regalo');

    writeln('Ingrese la edad del estudiante'); // H
    readln(num1);
    if (num < 7) then
        writeln('Es prescolar')
    else
        if (num <= 12) then
            writeln('Es de secundaria')
        else
            writeln('Es universitario');

    writeln('Ingrese la edad de la persona'); // I
    readln(num1);
    writeln('Ingrese el sexo de la persona');
    readln(sexo);
    if (sexo = 'F') then
        writeln('Le faltan ', 60-num1, ' anios para jubilarse')
    else
        if (sexo = 'M') then writeln('Le faltan ', 65-num1, ' anios jubilarse');
    
    writeln('Ingrese el anio de nacimiento'); // J
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