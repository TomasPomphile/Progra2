
/**
 * Write a description of class FlotaMicro4B here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;
public class FlotaMicro4B
{
    public static void main(String [] args)
    {
        String patente;
        int asientos;
        String destino;
        String salida;
        FlotaMicros flota = new FlotaMicros();
        Micro4A micro;
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese patente");
        patente = in.next();
        while(flota.estaCompleta()==false && patente!="ZZZ000"){
            System.out.println("Cantidad de asientos");
            asientos = in.nextInt();
            System.out.println("Ingrese destino");
            destino = in.next();
            System.out.println("Ingrese horario de salida");
            salida = in.next();
            micro = new Micro4A(patente,salida,destino,asientos);
            flota.agregarMicro(micro);
            System.out.println("Ingrese patente");
            patente = in.next();
        }
    }
}
