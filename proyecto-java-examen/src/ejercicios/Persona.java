package ejercicios;

import java.util.Date;

public class Persona{
	
	private tipo TipoDocumento;
	private int NroDocumento;
	private String Nombre;
	private String Apellido;
	private Date FechaNacimiento;

	public enum tipo {
		dni,
		libretacivica;
	}

	
	public Persona(tipo tipoDoc,int nroDoc, String nombre, String apellido, Date fechaNac) {
		this.TipoDocumento=tipoDoc;
		this.NroDocumento=nroDoc;
		this.Nombre=nombre;
		this.Apellido=apellido;
		this.FechaNacimiento=fechaNac;
	}
	public Persona() {}
	
	public tipo getTipoDocumento()
	{
		return TipoDocumento;
	}
	
	public void setTipoDocumento(tipo TipoDocumento)
	{
		this.TipoDocumento=TipoDocumento;
	}
	public int getNroDocumento()
	{
		return NroDocumento; 
	}
	public void setNroDocumento(int NroDocumento)
	{
		this.NroDocumento=NroDocumento;
	}
	public String getNombre() 
	{
		return Nombre;
	}
	public void setNombre(String nombre) 
	{
		Nombre = nombre;
	}
	public String getApellido() 
	{
		return Apellido;
	}
	public void setApellido(String apellido) 
	{
		Apellido = apellido;
	}
	public Date getFechaNacimiento() 
	{
		return FechaNacimiento;
	}
	public void setFechaNacimiento(Date fechaNacimiento) 
	{
		FechaNacimiento = fechaNacimiento;
	}
	
}