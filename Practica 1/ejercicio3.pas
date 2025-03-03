{3. Modifique el programa anterior para que el mensaje de salida muestre la suma de los tres números:
a. Utilizando una variable adicional
b. Sin utilizar una variable adicional}

program ejercicio3;
var
    num1, num2, num3, suma: integer;
begin
    writeln('Ingrese un primer numero entero');
    readln(num1);
    writeln('Ingrese un segundo numero entero');
    readln(num2);
    writeln('Ingrese un tercer numero entero');
    readln(num3);
    if (num1 > num2) and (num1 > num3) then
    begin
        Write(num1, ' ');
        if num2 > num3 then
        Write(num2, ' ', num3)
        else
        Write(num3, ' ', num2);
    end
    else if (num2 > num1) and (num2 > num3) then
    begin
        Write(num2, ' ');
        if num1 > num3 then
        Write(num1, ' ', num3)
        else
        Write(num3, ' ', num1);
    end
    else
    begin
        Write(num3, ' ');
        if num1 > num2 then
        Write(num1, ' ', num2)
        else
        Write(num2, ' ', num1);
    end;

    suma:= num1 + num2+ num3;
    writeln('La suma de los tres numeros es: ', suma);
    writeln('La suma de los tres numeros es: ', num1+num2+num3);
end.