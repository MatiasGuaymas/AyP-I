{1. Cargue una lista de números enteros. Se leen números enteros positivos hasta que se lee el número 999. Una
vez finalizada la carga, recorra la lista una sola vez para calcular e informar:
a. El promedio de números.
b. El porcentaje de números múltiplos de 3.
c. El mayor número.
d. El menor número
Nota: Utilice el archivo listasimple.pas para implementar este ejercicio.}

program ejercicio1;
uses GenericLinkedList;
type
  ListaEnteros = specialize LinkedList <integer>;
 
 Procedure armarLista (var le:ListaEnteros);
 var
   num: integer;
 begin
   le:= ListaEnteros.create();
   read(num);
   While (num <> 0) do begin
		// Agregar a la lista - puede utilizar cualquier operación de agregado a la lista, no se pide ninguna en el enunciado. 
        le.add(num); //agrega al final de la lista
        read(num);
   end;
 end;
 function calcularPromedio(suma, cantNumeros: integer): real;
 begin
    if cantNumeros = 0 then begin
      calcularPromedio := 0; // evitar división por cero
    end else begin
      calcularPromedio := suma / cantNumeros;
    end;
  end;
  function calcularPorcentaje(cant3, cantNumeros: integer): real;
  begin
    if cantNumeros = 0 then begin
      calcularPorcentaje := 0; // evitar división por cero
    end else begin
      calcularPorcentaje := (cant3 / cantNumeros) * 100;
    end;
  end;
 Procedure recorrerLista (le:ListaEnteros; var promedio, porcentaje: real; var max, min: integer); //completar la lista de parametros
 var
   suma, cant3, cantNumeros: integer;
 begin
   suma:= 0;
   cant3:= 0;
   cantNumeros:= 0;
   le.reset(); // Se posiciona al principio de la lista le. 
   While not le.eol() do begin //recorrer hasta el fin de lista
    suma:= suma + le.current; //suma todos los números
    cantNumeros:= cantNumeros + 1; //cuenta la cantidad de números
    if (le.current > max) then begin //compara el número actual con el máximo
      max:= le.current;
    end;
    if (le.current < min) then begin //compara el número actual con el mínimo
      min:= le.current;
    end;
		if (le.current mod 3 = 0) then begin //contar múltiplos de 3
      cant3:= cant3 + 1;
    end;
		le.next(); //avanza en la lista para evitar el bucle infinito
   end;
   //calcular el promedio - hacer una función
   promedio:= calcularPromedio(suma, cantNumeros); //llama a la función para calcular el promedio
   //Calcular el porcentaje - hacer una función
   porcentaje:= calcularPorcentaje(cant3, cantNumeros); //llama a la función para calcular el porcentaje
 end;
 {declaración de variables del programa principal}
 var
    le : ListaEnteros;
    promedio, porcentaje: real;
    max, min: integer;
 begin 
   armarLista(le);// crea y carga la lista
   writeln(le.current);
   max:= -1; //inicializa el máximo con un valor bajo
   min:= 9999; //inicializa el mínimo con un valor alto
   recorrerLista(le, promedio, porcentaje, max, min);//procesa la lista y calcula todos los puntos juntos. Retorna todos los valores a informar.
   writeln('El promedio es: ', promedio:0:2);
   writeln('El porcentaje de múltiplos de 3 es: ', porcentaje:0:2, '%');
   writeln('El mayor número es: ', max);
   writeln('El menor número es: ', min);
   readln();
 end.