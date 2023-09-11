Program twitter;
Uses
     sysutils;
Type
     tweet = record
	      codigoUsuario: integer;
	      nombreUsuario: string;
	      mensaje: string;
	      esRetweet: boolean;
     end;
     listaTweets = ^nodoLista;
     nodoLista = record
               dato: tweet;
               sig: listaTweets;
     end;
     ListaT=^nodoListaT;
     nodoListaT=record
			msg: string;
			esRet: boolean;
			sig:ListaT;
     end;
     ListaDlistas=^nodoListaDl;
     nodoListaDl = record
			nombreUsuario:string;
			codigoUsuario: integer;
			sig:ListaDlistas;
			datos:ListaT
     end;
			
{Completar agregando aquí las estructuras de datos necesarias en el ejercicio}


{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(var l: listaTweets; t: tweet);

var
   aux: listaTweets;
begin
     new(aux);
     aux^.dato := t;
     aux^.sig := l;
     l:= aux;
end;
{crearLista - Genera una lista con tweets aleatorios}
procedure crearLista(var l: listaTweets);
var
   t: tweet;
   texto: string;
   v : array [1..10] of string;
begin
     v[1]:= 'juan';
     v[2]:= 'pedro';
     v[3]:= 'carlos';
     v[4]:= 'julia';
     v[5]:= 'mariana';
     v[6]:= 'gonzalo';
     v[7]:='alejandro';
     v[8]:= 'silvana';
     v[9]:= 'federico';
     v[10]:= 'ruth';
     t.codigoUsuario := random(15)+1;
     while (t.codigoUsuario <> 0) do Begin
          texto:= Concat(v[t.codigoUsuario], '-mensaje-', IntToStr(random (200)));
          t.nombreUsuario := v[t.codigoUsuario];
          t.mensaje := texto;
          t.esRetweet := (random(2)=0);
          agregarAdelante(l, t);
          t.codigoUsuario := random(11);
     end;
end;

{imprimir - Muestra en pantalla el tweet}
procedure imprimir(t: tweet);
begin
     with (t) do begin
          write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
          if(esRetweet)then
               writeln(' Si')
          else
               writeln('No ');
     end;
end;

{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaTweets);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;


{agregarElemento - Resuelve la inserción de la estructura ordenada}
procedure agregarOrdenado(var pri:listaTweets; t:tweet);
var
   nuevo, anterior, actual: listaTweets;
begin
     new (nuevo);
     nuevo^.dato:= t;
     nuevo^.sig := nil;
     if (pri = nil) then
          pri := nuevo
     else
     begin
          actual := pri;
          anterior := pri;
          while (actual<>nil) and (actual^.dato.nombreUsuario < nuevo^.dato.nombreUsuario) do begin
               anterior := actual;
               actual:= actual^.sig;
          end;
          if (anterior = actual) then
               pri := nuevo
          else
               anterior^.sig := nuevo;
          nuevo^.sig := actual;
     end;
end;

{generarNuevaEstructura - Resuelve la generación estructura ordenada}
procedure generarNuevaEstructura (lT: listaTweets; VAR listaOrdenada: listaTweets);
begin
     listaOrdenada := nil;
     while(lT <> nil) do begin
          agregarOrdenado(listaOrdenada, lT^.dato);
          lT := lT^.sig;
     end;
end;

procedure Inicializar(var ldl:ListaDlistas);
	begin
		ldl:=nil;
	end;

procedure InsertarlInterna  (var l:ListaT;msg:string;rt:boolean);
	var
		aux:ListaT;
	begin
	    new(aux);
		aux^.msg:=msg;
		aux^.esRet:=rt;
		aux^.sig := l;
		l:= aux;
	end;

procedure insertar_adelante (var l:ListaDlistas; datos:tweet);
var
	nue: ListaDlistas;
begin
	if(l=nil) then
	begin
		l:=nil;
		new(nue);
		nue^.nombreUsuario := datos.nombreUsuario;
		nue^.codigoUsuario := datos.codigoUsuario;
		nue^.sig := l;
		l := nue;
		InsertarlInterna(l^.datos,datos.mensaje,datos.esRetweet)
	end
	else if(datos.nombreUsuario=l^.nombreUsuario) then
		InsertarlInterna(l^.datos,datos.mensaje,datos.esRetweet)
	else
		insertar_adelante(l^.sig,datos);
end;


procedure CrearLdL(var ldl:ListaDlistas;l:listaTweets);
	begin
		if(l<>nil) then
		begin
			insertar_adelante(ldl,l^.dato);
			CrearLdL(ldl,l^.sig);
		end;
	end;
	
procedure ImprimirSubL(l:ListaT);
	begin
		if(l<>nil) then
		begin
			writeln('Deja el msg: ',l^.msg,' si es rt: ',l^.esRet);
			ImprimirSubL(l^.sig);
		end;
	end;
	
procedure ImprimirListadeLista(ldl:ListaDlistas);
	begin
		if(ldl<>nil) then
		begin
			writeln('El usuario: ',ldl^.nombreUsuario,' De codigo: ',ldl^.codigoUsuario);
			ImprimirSubL(ldl^.datos);
			ImprimirListadeLista(ldl^.sig);
		end;
	end;

var
   l, l_ordenada : listaTweets;
   ldl:ListaDlistas;
begin
     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);
     {Se crea la estructura ordenada}
     l_ordenada:= nil;
     generarNuevaEstructura(l,l_ordenada);
     writeln ('Lista ordenada: ');
     imprimirLista(l_ordenada);
     {Completar el programa}
	 Inicializar(ldl);
	 CrearLdL(ldl,l_ordenada);
	 ImprimirListadeLista(ldl);
     writeln('Fin del programa');	
     readln;
end.
