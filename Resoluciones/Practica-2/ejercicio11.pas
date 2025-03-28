{11. El factorial de un número n se expresa como n! y se define como el producto de todos los números desde 1 hasta
n. Por ejemplo, el factorial de 6 o 6! equivale a 6*5! es igual a 1*2*3*4*5*6 que equivale a 720. Escriba una
función que reciba un número n y retorne su factorial.}

program ejercicio11;
function factorial(n: integer): integer; // Sin recursion
var
    i, fact: integer;
begin
    fact:= 1;
    for i:= 1 to n do
        fact:= fact * i;
    {for i:= n downto 1 do
        fact:= fact * i;}
    factorial:= fact;
end;
begin
    writeln(factorial(6));
end.