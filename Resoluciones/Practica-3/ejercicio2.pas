{2. Realizar un programa que lea desde el teclado el ancho, alto y profundidad de un prisma rectangular
(cuerpo geométrico de 6 caras rectangulares, como una caja) e informe su volumen y área de la
superficie formada por sus caras. Elija una estructura de datos adecuada y modularice la solución.
Nota: Volumen del prisma rectangular = profundidad * ancho * altura
Área Total = 2 * (profundidad * altura + profundidad * ancho + altura * ancho)}

program ejercicio2;
type
    prisma = record
        ancho: real;
        alto: real;
        profundidad: real;
    end;
procedure leer(var p: prisma);
begin
    writeln('Ingrese el ancho del prisma: ');
    readln(p.ancho);
    writeln('Ingrese el alto del prisma: ');
    readln(p.alto);
    writeln('Ingrese la profundidad del prisma: ');
    readln(p.profundidad);
end;
function volumen(p: prisma): real;
begin
    volumen := p.ancho * p.alto * p.profundidad;
end;
function area(p: prisma): real;
begin
    area := 2 * (p.profundidad * p.alto + p.profundidad * p.ancho + p.alto * p.ancho);
end;
var
    p: prisma;
    vol: real;
    a: real;
begin
    leer(p);
    vol := volumen(p);
    a := area(p);
    writeln('El volumen del prisma es: ', vol:0:2);
    writeln('El area total del prisma es: ', a:0:2);
end.