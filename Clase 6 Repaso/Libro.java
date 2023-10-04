//subclase de la clase abstracta Ejemplar que hereda todos los atributos y metodos de la superclase
public class Libro extends Ejemplar
{
    //atributos
    private String titulo;
    private int capitulos;
    private boolean bolsillo;
    //metodos
    public Libro(String titulo, int capitulos, boolean bolsillo,int anio,int paginas,String codigo,
                                                                String resumen,Responsable responsable){
        super(anio,paginas,codigo,resumen,responsable); 
        this.titulo=titulo;
        this.capitulos=capitulos;
        this.bolsillo=bolsillo;
    }
    public Libro(String titulo, int capitulos,boolean bolsillo,int anio,int paginas,String codigo,String resumen,int dni,String nombreyapellido){
        super(anio,paginas,codigo,resumen,dni,nombreyapellido);
        this.titulo=titulo;
        this.capitulos=capitulos;
        this.bolsillo=bolsillo;
    }
    public Libro(){}
    //metodos
    public String gettitulo(){
        return titulo;
    }
    public boolean getbolsillo(){
        return bolsillo;
    }
    public int getcapitulos(){
        return capitulos;
    }
    public void settitulo(String titulo){
        this.titulo=titulo;
    }
    public void setbolsillo(boolean bolsillo){
        this.bolsillo=bolsillo;
    }
    public void setcapitulos(int capitulos){
        this.capitulos=capitulos;
    }
    public void sePublico(){
        if(super.getanio()!=0){
            super.setanio(2023);
            if(getbolsillo()==true)
                titulo = titulo + " - De bolsillo";
        }else{
            System.out.println("Aun no se publico");
        }
    }
    public String toString(){
        return "El libro tiene identificacion: " + getcodigo() +" de titulo: " + gettitulo() +" y el nombre del autor: "
        + super.getresponsable().getnombreyapellido();
    }
}
