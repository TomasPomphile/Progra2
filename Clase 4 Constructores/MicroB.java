
/**
 * Write a description of class MicroB here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;
public class MicroB
{
    public static void main(String [] args)
    {
        Micro ObjMicro = new Micro("ABC123","Mar del Plata","5:00 AM");
        int asiento;
        boolean lleno;
        Scanner in = new Scanner(System.in);
        lleno = ObjMicro.getEstaLleno();
        System.out.println("Ingrese numero de asiento");
        asiento = in.nextInt();
        while(asiento!=-1 && lleno==false){
            if(ObjMicro.EstadoAsiento(asiento)==false){
                 ObjMicro.OcuparAsiento(asiento);
                 System.out.println("Se ocupo el asiento "+asiento);
            }else{
                System.out.println("El asiento esta ocupado");
                System.out.println("El asiento libre de 0 a 19 es:" + ObjMicro.PrimerLibre());
            }
            System.out.println("Ingrese numero de asiento");
            asiento = in.nextInt();
            lleno = ObjMicro.getEstaLleno();
        }
        in.close();
    }
}
