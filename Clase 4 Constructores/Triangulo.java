
/**
 * Write a description of class Triangulo here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Triangulo
{
    //Declaracon de atributos
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;
    //Constructor
    public Triangulo(int lado1,int lado2, int lado3, String colorRelleno, String colorLinea){
        this.lado1=lado1;
        this.lado2=lado2;
        this.lado3=lado3;
        this.colorRelleno=colorRelleno;
        this.colorLinea=colorLinea;
    }
    public Triangulo(){
    }
    //Metodos de la clase
    public double getLado1(){
        return lado1;
    }
    public double getLado2(){
        return lado2;
    }
    public double getLado3(){
        return lado3;
    }
    public String getRelleno(){
        return colorRelleno;
    }
    public String getColorLinea(){
        return colorLinea;
    }
    public void setLado1(double ladoA){
        lado1=ladoA;
    }
    public void setLado2(double ladoB){
        lado2=ladoB;
    }
    public void setLado3(double ladoC){
        lado3=ladoC;
    }
    public void setColorRelleno(String Relleno){
        colorRelleno=Relleno;
    }
    public void setColorLinea(String Linea){
        colorLinea=Linea;
    }
    public double CalcularArea(){
        double Area=0;
        double aux=0;
        aux = (lado1+lado2+lado3)/2;
        Area = Math.sqrt(aux*(aux-lado1)*(aux-lado2)*(aux-lado3));
        return Area;
    }
    public double CalcularPerimetro(){
        double perimetro=0;
        perimetro = lado1 + lado2 + lado3;
        return perimetro;
    }
}
