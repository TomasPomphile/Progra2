public class Entrenador {
    private String nombre;
    private int basico;
    private int campeonatos; 
    private int sueldo;
    public Entrenador(String Nombre, int Basico, int campeonatos){
        this.nombre = Nombre;
        this.basico = Basico;
        this.campeonatos = campeonatos; 
    }
    public Entrenador(){
     
    }
    public int getSueldo() {
        return sueldo;
    }
    public int getCampeonatos() {
        return campeonatos;
    }
    public int getBasico() {
        return basico;
    }
    public String getNombre() {
        return nombre;
    }
    public void setBasico(int unBasico) {
        basico = unBasico;
    }
    public void setCampeonatos(int unosCampeonatos) {
        campeonatos = unosCampeonatos;
    }
    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    public void CalcularSueldo(){
        sueldo = basico;
        if(campeonatos>1 && campeonatos<4){
            sueldo = sueldo + 5000;
        }else{
            if(campeonatos>5 && campeonatos<10){
                sueldo = sueldo + 30000;
            }
            else{
                if(campeonatos>10)
                    sueldo = sueldo + 50000;
            }
        }
    }
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi Sueldo es " + sueldo + " y tengo " + campeonatos + " campeonatos ganados.";
        return aux;
    }
}

