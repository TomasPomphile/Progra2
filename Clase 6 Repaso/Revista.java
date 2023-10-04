// subclase bla bla bla
public class Revista extends Ejemplar
{  
    //atributos
    private int volumen;
    private String nombre;
    private int cantarticulos;
    private Generador generador;
    //constructores
    public Revista(int volumen,String nombre, int cantarticulos,int anio,int paginas,String codigo,
                                                                String resumen,Responsable responsable){
        super(anio,paginas,codigo,resumen,responsable);
        this.volumen=volumen;
        this.nombre=nombre;
        this.cantarticulos=cantarticulos;
    }
    public Revista(int volumen,String nombre, int cantarticulos,int anio,int paginas,String codigo,
                                                                String resumen,int dni,String nombreyapellido){
        super(anio,paginas,codigo,resumen,dni,nombreyapellido);
        this.volumen=volumen;
        this.nombre=nombre;
        this.cantarticulos=cantarticulos;
    }
    public Revista(){}
    //metodos
    public int getvolumen(){
        return volumen;
    }
    public int getcantarticulos(){
        return cantarticulos;
    }
    public String getnombre(){
        return nombre;
    }
    public void setvolumen(int volumen){
        this.volumen=volumen;
    }
    public void setcantarticulos(int cantarticulos){
        this.cantarticulos=cantarticulos;
    }
    public void setnombre(String nombre){
        this.nombre=nombre;
    }
    public void sePublico(){
        if(super.getanio()!=0){
            super.setanio(2023);
            setvolumen(generador.getNroVolumen());
        }else{
            System.out.println("Aun no se publico");
        }
    }
    public String toString(){
        return "Nombre : " + nombre +" de nº de volumen: " + volumen;
    }
}
