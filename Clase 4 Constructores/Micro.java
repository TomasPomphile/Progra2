
/**
 * Write a description of class Micro here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Micro
{
    // instance variables - replace the example below with your own
    private int DimAsientos;
    private String patente;
    private String destino;
    private String salida;
    private boolean [] asiento;
    private int asientosllenos;
    public Micro(String patente,String destino,String salida){
        this.patente=patente;
        this.destino=destino;
        this.DimAsientos=20;
        this.salida=salida;
        this.asientosllenos=0;
        asiento= new boolean [DimAsientos];
        this.setAsientosVacios(asiento);
    }
    public Micro()
    {
    }
    public void setAsientosVacios(boolean []asiento){
        int i;
        for (i=0;i<DimAsientos;i++)
            asiento[i] = false;
        
    }
    public int getCantAsientosOcupados(){
        int i;
        int cont = 0;
        for (i=0;i<DimAsientos;i++){
            if(asiento[i] = true){
                cont++;
            }
        }
        return cont;
    }
    public boolean AsientoValido(int dato){
        boolean verificar = false;
        if(dato<20 && dato>=0){
                verificar = true;
        }
        return verificar;
    }
    public boolean EstadoAsiento(int dato){
        boolean verificar = false;
            if(this.AsientoValido(dato)==true){
                verificar = asiento[dato];
            }
        return verificar;
    }
    public boolean OcuparAsiento(int dato){
        boolean verificar = false;
            if(this.EstadoAsiento(dato)==false){
                asiento[dato] = true;
                asientosllenos++;
                verificar = true;
            }
        return verificar;
    }
    public boolean LiberarAsiento(int dato){
        boolean verificar = false;
            if(this.EstadoAsiento(dato)==true){
                asiento[dato] = false;
                asientosllenos--;
            }
        return verificar;
    }
    public int PrimerLibre(){
        int i=0;
        int devolver = 0;
        boolean encontro = false;
        do{
            if(asiento[i]==false){
                devolver=i;
                encontro=true;
            }
            i++;
        }while(i<20 && encontro==false);
        return devolver;
    }
    public boolean getEstaLleno(){
        boolean verificar = false;
            if(asientosllenos==19)
                verificar = true;
        return verificar;
    }
    public String getPatente(){
        return patente;    
    }
    public String getDestino(){
        return destino;    
    }
    public String getSalida(){
        return salida;    
    }
    public void setPatente(String patente){
        this.patente=patente;    
    }
    public void setDestino(String destino){
        this.destino=destino;    
    }
    public void setSalida(String salida){
        this.salida=salida;    
    }
}
