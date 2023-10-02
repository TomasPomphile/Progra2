
public class Micro4A
{
    private int asientos;
    private String patente;
    private String horaSalida;
    private String destino;
    public Micro4A(String patente,String horaSalida, String destino, int asientos)
    {
        this.patente=patente;
        this.horaSalida=horaSalida;
        this.destino=destino;
        this.asientos=asientos;
    }
    public Micro4A(){
    }
    public String getPatente(){
        return patente;
    }
    public String getHoraSalida(){
        return horaSalida;
    }
    public String getDestino(){
        return destino;
    }
    public void setPatente(String destino){
        destino=destino;
    }
    public void setHoraSalida(String horaSalida){
        horaSalida=horaSalida;
    }
    public void setDestino(String destino){
        destino=destino;
    }
}
