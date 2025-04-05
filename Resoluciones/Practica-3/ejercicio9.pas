{9. En la ciudad de La Plata se llevó a cabo un importante concurso de Informática, en el cual se
presentaron participantes europeos, asiáticos y americanos. Una vez finalizado el concurso, se
evaluaron los exámenes. Se procesarán exámenes hasta que llegue el examen con nombre de la
persona igual a ‘zzz’. De cada examen se conoce el nombre de la persona que lo realizó, su
continente de origen y puntaje (de 0 a 100). La información se ingresa ordenada por continente de
origen.Calcular e informar:
a. Participante que obtuvo la mejor calificación.
b. Cantidad de participantes por continente que promocionaron ( puntaje mayor que 90).
c. Promedio de participantes por continente que aprobaron (puntaje mayor que 70) y no
promocionaron.
d. Puntaje promedio de los europeos.}

program ejercicio9;
type
    examen = record
        nombre: string;
        continente: string;
        puntaje: integer;
    end;
procedure leerExamen(var e: examen);
begin
    writeln('Ingrese el nombre del participante');
    readln(e.nombre);
    if(e.nombre <> 'zzz') then
        begin
            writeln('Ingrese el continente de origen del participante');
            readln(e.continente);
            writeln('Ingrese el puntaje del participante');
            readln(e.puntaje);
        end;
end;
procedure maximo(nombre: string; puntaje: integer; var nombreMax: string; var puntajeMax: integer);
begin
    if(puntaje > puntajeMax) then
        begin
            puntajeMax:= puntaje;
            nombreMax:= nombre;
        end;
end;
var
    e: examen;
    continenteActual, nombreMax: string;
    puntajeMax, cantEuropeos, puntajeTotalEuropeos, cantPromocionados, cantAprobados, cantParticipantes: integer;
begin
    leerExamen(e);
    puntajeMax:= -1;
    cantEuropeos:= 0;
    puntajeTotalEuropeos:= 0;
    while (e.nombre <> 'zzz') do
        begin
            continenteActual:= e.continente;
            cantPromocionados:= 0;
            cantAprobados:= 0;
            cantParticipantes:= 0;
            while ((e.nombre <> 'zzz') and (e.continente = continenteActual)) do
                begin
                    cantParticipantes:= cantParticipantes + 1;
                    maximo(e.nombre, e.puntaje, nombreMax, puntajeMax);
                    if(e.puntaje > 90) then
                        cantPromocionados:= cantPromocionados + 1
                    else 
                        if(e.puntaje > 70) then
                            cantAprobados:= cantAprobados + 1;
                    if(e.continente = 'Europa') then
                        begin
                            cantEuropeos:= cantEuropeos + 1;
                            puntajeTotalEuropeos:= puntajeTotalEuropeos + e.puntaje;
                        end;
                    leerExamen(e);
                end;
            writeln('La cantidad de participantes que promocionaron en ', continenteActual, ' es: ', cantPromocionados);
            writeln('El promedio de participantes que aprobaron y no promocionaron en ', continenteActual, ' es: ', (cantAprobados/cantParticipantes):0:2);
        end;
    writeln('El participante con mejor calificacion es: ', nombreMax, ' y su puntaje es: ', puntajeMax);
    writeln('El promedio de los europeos es: ', (puntajeTotalEuropeos/cantEuropeos):0:2);
end.