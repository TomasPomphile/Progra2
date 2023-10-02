
/**
 * Write a description of class TrianguloB here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class TrianguloB
{
    public static void main(String[] args)
    {
        Triangulo ObjTri = new Triangulo(10,20,43,"rojo","verde");
        System.out.println(ObjTri.getLado1());
        System.out.println(ObjTri.getLado2());
        System.out.println(ObjTri.getLado3());
        System.out.println(ObjTri.getRelleno());
        System.out.println(ObjTri.getColorLinea());
    }
}
