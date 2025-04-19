{1. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para ello, para
cada una de las 200 fotos publicadas en su Instagram, cuenta con la siguiente información: título de la foto, el autor
de la foto, cantidad de Me gusta, cantidad de clics y cantidad de comentarios de usuarios. Realizar un programa que
lea y almacene esta información. Una vez finalizada la lectura, el programa debe procesar los datos e informar:
● Título de la foto más vista (la que posee mayor cantidad de clics).
● Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
● Cantidad de comentarios recibidos para cada una de las fotos publicadas.}

program ejercicio1;
const
    MAX = 200;
type
    TFoto = record
        titulo: string;
        autor: string;
        meGusta: integer;
        clics: integer;
        comentarios: integer;
    end;
    TVector = array[1..MAX] of TFoto;
procedure leerFoto(var foto: TFoto);
begin
    writeln('Ingrese el titulo de la foto: ');
    readln(foto.titulo);
    writeln('Ingrese el autor de la foto: ');
    readln(foto.autor);
    writeln('Ingrese la cantidad de Me gusta: ');
    readln(foto.meGusta);
    writeln('Ingrese la cantidad de clics: ');
    readln(foto.clics);
    writeln('Ingrese la cantidad de comentarios: ');
    readln(foto.comentarios);
end;
procedure cargarVector(var vector: TVector);
var
    i: integer;
begin
    for i := 1 to MAX do begin
        writeln('Ingrese los datos de la foto ', i, ': ');
        leerFoto(vector[i]);
    end;
end; 
procedure maximo(var maximo: integer; var titulo: string; tituloFoto: string; clics: integer);
begin
    if clics > maximo then begin
        maximo := clics;
        titulo := tituloFoto;
    end;
end;
procedure procesarDatos(vector: TVector; var tituloMasVista: string; var totalMeGusta: integer);
var
    i, maxClics: integer;
begin
    maxClics := -1;
    for i := 1 to MAX do begin
        maximo(maxClics, tituloMasVista, vector[i].titulo, vector[i].clics);
        if vector[i].autor = 'Art Vandelay' then begin
            totalMeGusta := totalMeGusta + vector[i].meGusta;
        writeln('Cantidad de comentarios para la foto ', vector[i].titulo, ': ', vector[i].comentarios);
        end;
    end;
end;
var
    fotos: TVector;
    tituloMasVista: string;
    totalMeGusta: integer;
begin
    totalMeGusta := 0;
    cargarVector(fotos);
    procesarDatos(fotos, tituloMasVista, totalMeGusta);
    writeln('La foto mas vista es: ', tituloMasVista);
    writeln('La cantidad total de Me gusta recibidas a las fotos de Art Vandelay es: ', totalMeGusta);
end.
