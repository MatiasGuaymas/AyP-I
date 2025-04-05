{2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2024. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2024. La lectura finaliza al
ingresar el año 2025, e informe la cantidad de casamientos realizados durante los
meses de verano (diciembre, enero y febrero) y la cantidad de casamientos realizados en los primeros 15 días del
mes de agosto. Nota: utilizar el módulo realizado en b) para la lectura de fecha.}

program ejercicio3;
type
    fecha = record
        dia: integer;
        mes: string;
        anio: integer;
    end;
procedure leerFecha(var f: fecha);
begin
    writeln('Ingrese un anio de casamiento');
    readln(f.anio);
    if(f.anio <> 2025) then
        begin
            writeln('Ingrese un mes de casamiento');
            readln(f.mes);
            writeln('Ingrese un dia de casamiento');
            readln(f.dia);
        end;
end;
function cumpleMes(mes: string): boolean;
begin
    cumpleMes:= (mes = 'Diciembre') or (mes = 'Enero') or (mes = 'Febrero');
end;
function cumpleFecha(dia: integer; mes: string): boolean;
begin
    cumpleFecha:= ((dia <= 15) and (mes = 'Agosto'));
end;
procedure casamientos(var cumple3Meses, cumpleFechaAgosto: integer);
var
    f: fecha;
begin
    leerFecha(f);
    while(f.anio <> 2025) do
        begin
            if(cumpleMes(f.mes)) then
                cumple3Meses:= cumple3Meses + 1;
            if(cumpleFecha(f.dia, f.mes)) then
                cumpleFechaAgosto:= cumpleFechaAgosto + 1;
            leerFecha(f);
        end;
end;
var
    cumple3Meses, cumpleFechaAgosto: integer;
begin
    cumple3Meses:= 0;
    cumpleFechaAgosto:= 0;
    casamientos(cumple3Meses, cumpleFechaAgosto);
    writeln('La cantidad de casamientos realizados durante los meses de verano fue: ', cumple3Meses);
    writeln('La cantidad de casamientos realizados durante los primeros 15 dias del mes de Agosto fue: ', cumpleFechaAgosto);
end.