package ejercicios;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;


/**
 * A. Crear una clase Persona con los siguientes campos
 * (con sus respectivos getters, setters y constructor)
 * 
 * TipoDocumento - enum (dni/libretacivica) 
 * NroDocumento - Integer
 * Nombre - String
 * Apellido - String
 * FechaNacimiento - Date
 * 
 * B. En el método main de la clase "Ejercicio2" crear una nueva instancia
 * de la clase persona y settearle valores reales con tus datos
 * 
 * 
 * C. En el método main de la clase "Ejercicio 2" imprimir los valores en 
 * consola 
 * (crear método main e imprimir valores) 
 *  
 * @author examen
 *
 */
public class Ejercicio2 {

	/**
	 * 
	 */
	public Ejercicio2() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String d="06/21/1993";
		SimpleDateFormat sd= new SimpleDateFormat("MM/dd/yyyy");
		Date fecha;
		try {
			fecha = sd.parse(d);
			Persona per=new Persona(Persona.tipo.dni, 37607895,"Antonella","Gorosito",fecha);
			System.out.println("Tipo de documento: "+per.getTipoDocumento());
			System.out.println("Numero de documento: "+per.getNroDocumento());
			System.out.println("Nombre: "+per.getNombre());
			System.out.println("Apellido: "+per.getApellido());
			System.out.println("Fecha de nacimiento: "+per.getFechaNacimiento());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
