 
//instancia abstracta no se crean objetos de esta
public abstract class Ejemplar
{
    //atributos
    private String codigo;
    private int paginas;
    private String resumen;
    private int anio;
    private Responsable responsable;
    //constructores
    public Ejemplar(int anio,int paginas,String codigo,String resumen,Responsable responsable){
        this.anio=anio;
        this.paginas=paginas;
        this.codigo=codigo;
        this.resumen=resumen;
        this.responsable=responsable;
    }
    public Ejemplar(int anio,int paginas,String codigo,String resumen,int dni,String nombreyapellido){
        this.anio=anio;
        this.paginas=paginas;
        this.codigo=codigo;
        responsable.setnombreyapellido(nombreyapellido);
        responsable.setdni(dni);
    }
    public Ejemplar(){}
    //metodos
    public void setresponsable(Responsable responsable){
        this.responsable=responsable;
    }
    public Responsable getresponsable(){
        return responsable;
    }
    public int getanio(){
        return anio;
    }
    public int getpaginas(){
        return paginas;
    }
    public String getcodigo(){
        return codigo;
    }
    public String getresumen(){
        return resumen;
    }
    public void setanio(int anio){
        this.anio=anio;
    }
    public void setpaginas(int paginas){
        this.paginas=paginas;
    }
    public void setcodigo(String codigo){
        this.codigo=codigo;
    }
    public void setresumen(String resumen){
        this.resumen=resumen;
    }
    //metodos abstractos
    public abstract void sePublico();
}
