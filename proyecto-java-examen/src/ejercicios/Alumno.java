package ejercicios;

public class Alumno {
	 private Persona persona;
	 private int Legajo;
	 
	 public Alumno(Persona persona, int Legajo)
	 {
		 this.persona=persona;
		 this.Legajo=Legajo;
	 }
	 public Alumno() {}
	 public Persona getPersona() 
	 {
		 return persona;
	 }
	 public void setPersona(Persona persona) 
	 {
		 this.persona = persona;
	 }
	 public int getLegajo() 
	 {
		 return Legajo;
	 }
	 public void setLegajo(int legajo) 
	 {
		 Legajo = legajo;
	 }	 
}
