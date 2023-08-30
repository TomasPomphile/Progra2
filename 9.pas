Program encomiendas;
Type

   encomienda = record
                  codigo: integer;
                  peso: integer;
                end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    dato: encomienda;
    sig: lista;
    end;
  subLista = ^nodosubL;
  nodosubL = record
        cod:integer;
        sig:subLista;
        end;
  arbol=^nodoA;
   nodoA = record
   peso:integer;
   codigo:integer;
   HI,HD:arbol;
   sig:subLista;
   end;


{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
procedure agregarAdelante(var l: Lista; enc: encomienda);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l:= aux;
end;


{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }
procedure crearLista(var l: Lista);
var
  e: encomienda;
  i: integer;
begin
 l:= nil;
 for i:= 1 to 20 do begin
   e.codigo := i;
   e.peso:= random (10);
   while (e.peso = 0) do e.peso:= random (10);
   agregarAdelante(L, e);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
   l:= l^.sig;
 End;
end;

procedure agregarAdelantesubL(var l: subLista; cod:integer);
var
  aux: subLista;
begin
  new(aux);
  aux^.cod := cod;
  aux^.sig := l;
  l:= aux;
end;

procedure Insertar(var a:arbol;datos:encomienda);

        begin
            if(a=nil) then
            begin
                new(a);
                a^.HI:=nil;
                a^.HD:=nil;
                a^.sig:=nil;
                a^.peso:=datos.peso;
            end
            else
                if(a^.peso>datos.peso) then
                        Insertar(a^.HI,datos)
                else if (a^.peso<datos.peso) then
                        Insertar(a^.HD,datos)
                else begin
                        agregarAdelantesubL(a^.sig,datos.codigo);
                     end;
        end;

procedure AgregarDatosARbol(var a:arbol;l:lista);
        begin
             if(l<>nil) then
             begin
             Insertar(a,l^.dato);
             AgregarDatosArbol(a,l^.sig);
             end;
        end;

procedure ImprimirL(l:subLista);
        begin
            if(l<>nil) then begin
                writeln('Codigo:',l^.cod);
                ImprimirL(l^.sig);
            end;
        end;

procedure RecorrerArbol(a:arbol);
        begin
         if(a<>nil) then
                begin
                    RecorrerArbol(a^.HI);
                    writeln('Peso:',a^.peso);
                    if(a^.sig<>nil) then
                    begin
                        ImprimirL(a^.sig);
                    end;
                    RecorrerArbol(a^.HD);
                end;
        end;

Var

 l: lista;
 a: arbol;
begin
 Randomize;
 a:=nil;
 crearLista(l);
 writeln ('Lista de encomiendas generada: ');
 imprimirLista(l);
 AgregarDatosArbol(a,l);
 RecorrerArbol(a);
 readln;
end.
