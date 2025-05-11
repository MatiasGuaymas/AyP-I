{1. Una remisería dispone de información acerca de los 550 viajes realizados durante el mes de mayo de 2023. De
cada viaje se conoce: número de viaje, código de auto, categoría del viaje (1..5), dirección de origen, dirección
de destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código de auto
y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Informar las dos categorías de viaje que menos kilómetros recorrieron.
c. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de viaje.
Nota: Ver Video de resolución del ejercicio}

Program ejercicio1;
uses GenericLinkedList;
Const
	DIMF = 550;
Type

	viaje = record
		numviaje: integer;
		codauto: integer;
		categoria: integer;
		dirOrigen: string;
		dirDestino: string;
		kms: real;
	end;

	vectorViajes = array [1..DIMF] of viaje;

	vectorCategorias = array[1..5] of real;

	ListaViajes = specialize LinkedList<viaje>;


{No hay que implementarlo en el parcial, pueden poner o no el encabezado, simular la invocación}
procedure cargarVectorViajes(var vv:vectorViajes);//se dispone

{los procesos en la hoja pueden quedar en cualquier orden}
procedure inicializarCategorias(var vc: vectorCategorias);
var
	i:integer;
begin
	for i:= 1 to 5 do 
		vc[i] := 0;
end;

procedure insertarOrdenado(var lv: listaViajes; v: viaje);
begin
	lv.reset(); // se coloca al inicio de la lista. 
	While not(lv.eol()) and (lv.current().numviaje < v.numviaje) do // termina cuando llego al final de la lista o encontro un elemento que es más grande que el que quiero agregar
		lv.next(); 
	lv.insertCurrent(v); // lo agrega y mantiene el orden en la lista. 
end;

{podria agrupar los maximos en registros para pasar menos parámetros}
procedure maximos(var max1:real; var max2: real; var codmax1: integer; var codmax2: integer; cod: integer; cantKms: real);
begin
	if (cantKms > max1) then begin
		max2:= max1;
		codmax2:= codmax1;
		max1:= cantKms;
		codmax1:= cod;
	end
	else
		if (cantKms > max2) then begin
			max2:= cantKms;
			codmax2:= cod;
		end
end;

procedure categoriasMenores(vc: vectorCategorias; var catmin1: integer; var catmin2: integer);
var
	i: integer;
	min1, min2: real;
begin
	min1:= 9999; // inicializo las dos variables mínimas en un valor muy alto (más alto que el posible)
	min2:= 9999; 
	For i:= 1 to 5 do begin
		if (vc[i]< min1) then begin
			min2:= min1;
			catmin2:= catmin1;
			min1:= vc[i];
			catmin1:= i
		end
		else
			if (vc[i]< min2) then begin
				min2:= vc[i];
				catmin2:= i
			end
	end;
end;


procedure recorrerVector (vv: vectorViajes; var lv: listaViajes; var vc: vectorCategorias; var codmax1: integer; var codmax2: integer);
var
	codActual, pos: integer;
	max1, max2, cantKms: real;
begin
	max1:= -1; 
	max2:= -1;
	pos:= 1;
	While (pos <= DIMF) do begin // Recorro con una variable pos para hacer el corte de control. 
		codActual := vv[pos].codauto; //5
		cantKms:= 0;
		While(pos<=DIMF) and (codActual = vv[pos].codauto) do begin // avanza en el vector mientras haya elementos y sea el mismo código
			cantKms:= cantKms + vv[pos].kms; // a. acumulo los kilometros de este codigo de viaje
			vc[vv[pos].categoria]:= vc[vv[pos].categoria] + vv[pos].kms; //b. acumulo los kilometros para las categorias
			if (vv[pos].kms > 5) then // c. agrega a la lista nueva que viene creada
				insertarOrdenado(lv, vv[pos]);
			pos:= pos + 1
		end;
		maximos(max1, max2, codmax1, codmax2, codActual, cantKms); // voy a calcular los maximos con el codigoactual y no vv[pos].codauto porque es diferente, cambio. 
	end;
end;

var
	vv: vectorViajes;
	vc: vectorCategorias;
	lv: listaViajes;
	codmax1, codmax2, catmin1, catmin2:integer;
begin
	cargarVectorViajes(vv); // se dispone
	inicializarCategorias(vc); // punto b. inicializo el vector contador
	lv := listaViajes.create(); // punto c . inicializo la lista
	recorrerVector(vv, lv, vc, codmax1, codmax2); // punto a, b y c
	categoriasMenores(vc, catmin1, catmin2); // punto b
	{Puedo informar en el programa principal o puedo informar en los procedimientos}
	Writeln ('Los dos codigos de auto que más kilometros recorrieron son ', codmax1, ' y ', codmax2); // punto a
	Writeln ('Las dos categorias que menos kilometros recorrieron son ', catmin1, ' y ', catmin2); // punto b
end.