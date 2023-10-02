
/**
 * Write a description of class FlotaMicros4A here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class FlotaMicros
{
    // instance variables - replace the example below with your own
    private Micro4A [] micros;
    private int cantidadMicros;
    public  FlotaMicros(){
        cantidadMicros = 0;
        micros = new Micro4A[15];
    }
    public boolean estaCompleta(){
        boolean verificar=false;
        if(cantidadMicros == 15)
            verificar=true;
        return verificar;
    }
    public void agregarMicro(Micro4A micro){
        int i = 0;
        if (estaCompleta()==false){
            micros[cantidadMicros] = micro;
            cantidadMicros++;
            System.out.println("Se agrego a la flota");
        }else{
            System.out.println("No se puede agregar porque esta llena la flota");
        }
    }
    public void eliminarMicroPorPatente(String patente){
        int i;
        boolean encontro=false;
        for (i=0;i<cantidadMicros;i++){
            if(micros[i].getPatente().equals(patente)){
                micros[cantidadMicros] = null;
                cantidadMicros--;
                encontro=true;
            }
        };
        if(encontro==true)
            System.out.println("Se elimino correctamente");
        else
            System.out.println("No se elimino por que no existe esa patente");
    }
    public Micro4A buscarMicroPorDestino(String destino){
        int i;
        boolean encontro=false;
        for (i=0;i<cantidadMicros;i++){
            if(micros[i].getDestino().equals(destino)){
                micros[cantidadMicros] = null;
                cantidadMicros--;
                encontro=true;
            }
        }
        return null;
    }
    
}
