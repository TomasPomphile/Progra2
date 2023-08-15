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
			sigT:ListaT;
     end;
     ListaU=^nodoListaU;
     nodoListaU = record
			nombreU:string;
			codigoU: integer;
			sigU:ListaU;
			sigT:ListaT;
     end;
			
{Completar agregando aquí las estructuras de datos necesarias en el ejercicio}
procedure imprimirlistausuario(l_interna:listaU);
	begin
		while(l_interna<>nil) do begin
			writeln(l_interna^.codigoU,l_interna^.nombreU);
			while(l_interna^.sigT<>nil) do begin
				writeln(l_interna^.sigT^.msg,l_interna^.sigT^.esRet);
				l_interna^.sigT:=l_interna^.sigT^.sigT;
			end;
			l_interna:=l_interna^.sigU;
		end;
	end;
	
procedure AgregarALista(var L_interna:ListaT;msg:string;rt:boolean);
	var
	aux:ListaT;
	begin
		new(aux);
		aux^.msg:=msg;
		aux^.esRet:=rt;
		aux^.sigT:=L_interna;
		L_interna:=aux;
	end;

procedure CrearListaNueva(var L_MSG:listaU;nom:string;cod:integer);
	var
	aux:listaU;
	begin
		new(aux);
		aux^.sigU:=nil;
		aux^.nombreU:=nom;
		aux^.codigoU:=cod;
		aux^.sigU:=L_MSG;
		L_MSG:=aux;
	end;


procedure RecorrerListaOrdenada(l_ordenada:listaTweets;var L_interna:ListaU);
	var
	aux,ant:listaTweets;
	begin
		aux:=l_ordenada;
		while(aux<>nil) do begin
			if(ant^.dato.nombreUsuario<>aux^.dato.nombreUsuario) then begin
				//writeln(aux^.dato.nombreUsuario);
				CrearListaNueva(L_interna,aux^.dato.nombreUsuario,aux^.dato.codigoUsuario);
				AgregarALista(L_interna^.sigT,aux^.dato.mensaje,aux^.dato.esRetweet);
			end else
			begin
				if(ant^.dato.mensaje<>aux^.dato.mensaje) then begin
				//writeln(aux^.dato.nombreUsuario);
				AgregarALista(L_interna^.sigT,aux^.dato.mensaje,aux^.dato.esRetweet);
				end;
			end;
			ant:=aux;
			aux:=aux^.sig;
			
		end;
	end;

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
     t.codigoUsuario := random(11);
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

var
   l, l_ordenada : listaTweets;
   l_interna:ListaU;
begin
     l:= nil;
     L_interna:=nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);
     {Se crea la estructura ordenada}
     l_ordenada:= nil;
     generarNuevaEstructura(l,l_ordenada);
     writeln ('Lista ordenada: ');
     imprimirLista(l_ordenada);
     {Completar el programa}
     writeln('Fin del programa');
     RecorrerListaOrdenada(l_ordenada,L_interna);
     imprimirlistausuario(l_interna);
     readln;
end.
