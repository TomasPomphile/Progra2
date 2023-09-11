//ALGORITMOS PROGRA II
// Inserta dato en un arbol binario, este dato no se puede repetir
{procedure insertarDatoEnArbolABB(var a:arbol;dato:integer);
        begin
            if (a = nil) then
                begin
                new(A);
                a^.HI:=nil;
                a^.HD:=nil;
                a^.dato:=dato;
                end
              else
					if (a^.dato>dato) then
						insertarDatoEnArbolABB(a^.HI,dato)
					else
					if (a^.dato<dato) then
						insertarDatoEnArbolABB(a^.HD,dato)
        end;}
//Inserta dato en un arbol binario, el dato repetido se insertar en una sub lista o sub arbol;
{procedure Insertar(var a:arbol;datos:encomienda);
        begin
            if(a=nil) then
            begin
                new(a);
                a^.HI:=nil;
                a^.HD:=nil;
                a^.sig:=nil;
                a^.peso:=datos.peso;
                agregarAdelantesubL(a^.sig,datos.codigo);
            end
            else
                if(a^.peso>datos.peso) then
                        Insertar(a^.HI,datos)
                else if (a^.peso<datos.peso) then
                        Insertar(a^.HD,datos)
                else begin
                        agregarAdelantesubL(a^.sig,datos.codigo);
                     end;
        end;}
//Recorrido de una lista que inserta en un arbol binario
{procedure AgregarDatosArbol(var a:arbol;l:lista);
        begin
             if(l<>nil) then
             begin
                insertarDatoEnArbolABB(a,l^.dato);
                AgregarDatosArbol(a,l^.sig);
             end
        end;}

//En preorden, la raíz se recorre antes que los recorridos de los subárboles izquierdo y derecho
{procedure RecorridoPreOrden(a:arbol);
	begin
		if(a<>nil) then begin
			writeln(a^.dato);
			RecorridoPreOrden(a^.HI);
			RecorridoPreOrden(a^.HD);
		end;
	end;}
//En inorden, la raíz se recorre entre los recorridos de los árboles izquierdo y derecho, y
{procedure RecorridoENOrden(a:arbol);
	begin
		if(a<>nil) then begin
			RecorridoENOrden(a^.HI);
			writeln(a^.dato);
			RecorridoENOrden(a^.HD);
		end;
	end;}
//En postorden, la raíz se recorre después de los recorridos por el subárbol izquierdo y el derecho
{procedure RecorridoPostOrden(a:arbol);
	begin
		if(a<>nil) then begin
			RecorridoENOrden(a^.HI);
			RecorridoENOrden(a^.HD);
			writeln(a^.dato);
		end;
	end;}
//Recorre un arbol y devuelve el nodo de este
{function BuscarDatoENArbol(a:arbol;dato:integer): arbol;
	begin
		if (a=nil) then 
			BuscarDatoENArbol:=nil
		 else if (a^.dato=dato) then 
			BuscarDatoENArbol:=a
		else
		begin
			BuscarDatoENArbol:=BuscarDatoENArbol(a^.HI,dato);
			if (BuscarDatoENArbol=nil) then
				BuscarDatoENArbol:=BuscarDatoENArbol(a^.HD,dato);
		end;
	end;}
//Recorre el arbol solo a la izquierda y devuelve el menor
{function verMin(a:arbol):integer;
	begin
		if (a=nil)then
			verMin:=-1
		else if (a^.HI=nil) then
			verMin:=a^.dato
		else
			verMin:=verMin(a^.HI);
	
	end;}
//Recorre el arbol solo a la derecha y devuelve el mayor
{function verMax(a:arbol):integer;
	begin
		if (a=nil)then
			verMax:=-1
		else if (a^.HD=nil) then
			verMax:=a^.dato
		else
			verMax:=verMax(a^.HD);
	end;}
//Recorre el arbol y imprime valores de un determinado rando
{Procedure verValoresEnRango(a:Arbol;inf,sup:integer);
begin
if (a <> nil) then
	if (a^.dato >= inf) then
		if (a^.dato <= sup) then begin
		writeln(a^.dato);
		verValoresEnRango(a^.hi, inf, sup);
		verValoresEnRango (a^.hd, inf, sup);
		end
		else
		verValoresEnRango(a^.hi, inf, sup)
	else
	verValoresEnRango(a^.hd, inf, sup);
end;}
//Recorre el arbol y devuelve la cantidad de veces que ese dato aparece y este no existe es cero
{function ContarDatos(a:arbol;dato:str10):integer;
	begin
		if(a=nil) then
			ContarDatos:=0
		else if(a^.dato.posicion=dato) then
			ContarDatos:= 1 + ContarDatos(a^.HI,dato) + ContarDatos(a^.HD,dato)
		else
			ContarDatos:= ContarDatos(a^.HI,dato) + ContarDatos(a^.HD,dato)
	end;}






