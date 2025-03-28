{7. Dada la siguiente función marque las invocaciones a dicha función que considere válidas:
function cuadrado(x:integer): integer;
begin
cuadrado:= x*x;
end;

a. Write(cuadrado(8)); -> Es valida la invocacion
b. c:= cuadrado(8); Write(cuadrado); -> No es valida la invocacion
c. If ( cuadrado = 64 ) then -> No es valida la invocacion
d. Write('8*8=64'); -> No invoca la funcion
e. cuadrado(8); -> Es valida la invocacion
f. c:= cuadrado(8); Write (c); -> Es valida la invocacion
g. cuadrado(8, c); Write (c); -> No es valida la invocacion
h. If ( cuadrado(8) = 64 ) then -> Es valida la invocacion }

