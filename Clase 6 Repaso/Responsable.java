//instanscia responsable
public class Responsable
{
    //atributos
    private int dni;
    private String nombreyapellido;
    //constructores
    public Responsable(int dni, String nombreyapellido)
    {
        this.dni=dni;
        this.nombreyapellido=nombreyapellido;
    }
    public Responsable(){
    }
    //metodos
    public int getdni(){
        return dni;
    }
    public String getnombreyapellido(){
        return nombreyapellido;
    }
    public void setdni(int dni){
        this.dni=dni;
    }
    public void setnombreyapellido(String nombreyapellido){
        this.nombreyapellido=nombreyapellido;
    }
}
