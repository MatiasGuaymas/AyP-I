{5. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo y retorne cuál fue el
número impar más alto.
b. Implemente un programa que invoque al módulo del inciso a, e informe lo pedido.}

program ejercicio5;
procedure numeroImparMaximo(var max:integer);
var
    num:integer;
begin
    readln(num);
    while (num >= 0) do
        begin
            if (num mod 2 = 1) then
                if (num > max) then
                    max:= num;
            readln(num);
        end;
end;
var
    max:integer;
begin
    max:= -1;
    numeroImparMaximo(max);
    writeln('El numero impar mas alto es: ', max);
end.