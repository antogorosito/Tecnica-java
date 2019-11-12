--- EJERCICIO 1 - COMPLEJIDAD BAJA: 
--Realizar una consulta para consultar todos los alumnos existentes, 
--mostrar: TipoDoc, Documento, Nombre, Apellido, Legajo.
select tipodoc,documento,nombre,apellido,legajo
from alumno 
inner join persona on persona.identificador=alumno.idpersona;

--- EJERCICIO 2 - COMPLEJIDAD BAJA: --Realizar una consulta para consultar todas las carreras a la que un alumno 
--esta inscripto, mostrar: Legajo, nombre, apellido, nombre carrera, 
--fechainscripcioncarrera ordenado por legajo descendiente

select legajo, persona.nombre, persona.apellido, carrera.nombre, fechainscripcion
from alumno
inner join persona on persona.identificador=alumno.idpersona
inner join inscripciones_carrera on inscripciones_carrera.idalumno=alumno.identificador
inner join carrera on inscripciones_carrera.idcarrera=carrera.identificador
order by legajo desc;

--- EJERCICIO 3 - COMPLEJIDAD MEDIA: --Realizar una consulta para consultar la cantidad de inscriptos por curso, 
--mostrando: nombre carrera, nombre curso, cantidad inscriptos, cupo máximo por curso

select carrera.nombre, curso.nombre,count(inscripciones_curso.idalumno),cupomaximo
from inscripciones_curso
inner join curso on curso.identificador=inscripciones_curso.idcurso
inner join carrera on carrera.identificador=curso.idcarrera
group by curso.identificador,carrera.nombre;

--- EJERCICIO 4 - COMPLEJIDAD ALTA: 
--Sobre la consulta anterior (copiar y pegarla y modificarla) modificar la sql para que 
--la consulta retorne solo los cursos cuya cantidad de inscripciones supera su cupo maximo

select carrera.nombre, curso.nombre,count(inscripciones_curso.idalumno),cupomaximo
from inscripciones_curso
inner join curso on curso.identificador=inscripciones_curso.idcurso
inner join carrera on carrera.identificador=curso.idcarrera
group by curso.identificador,carrera.nombre
having count(inscripciones_curso.idalumno)> cupomaximo;

--- EJERCICIO 5 -  COMPLEJIDAD BAJA: 
--actualizar todos las cursos que posean anio 2018 y
--cuyo cupo sea menor a 5, y actualizar el cupo de todos ellos a 10.

start transaction;
update curso 
set cupomaximo=10
where anio=2018  and cupomaximo<5;

commit;

--- EJERCICIO 6 -  COMPLEJIDAD ALTA: :
-- actualizar todas las fechas de inscripcion a cursados que posean el siguiente error: 
--la fecha de inscripcion al cursado de un alumno es menor a la fecha de inscripcion a 
--la carrera. La nueva fecha que debe tener es la fecha del dia. Se puede hacer en dos pasos,
 --primero  realizando la consulta y luego realizando el update manual
 
select inscripciones_curso.idalumno,inscripciones_curso.idcurso,inscripciones_curso.fechainscripcion 
from inscripciones_curso
inner join inscripciones_carrera on inscripciones_curso.idalumno=inscripciones_carrera.idalumno
inner join curso on curso.identificador=inscripciones_curso.idcurso
where inscripciones_curso.fechainscripcion<inscripciones_carrera.fechainscripcion and 
curso.idcarrera=inscripciones_carrera.idcarrera;

update inscripciones_curso
set fechainscripcion=current_date
where idcurso=3 and idalumno=2 and fechainscripcion='2002-01-01';


 --- EJERCICIO 7 - COMPLEJIDAD BAJA:   --INSERTAR un nuevo registro de alumno con tus datos personales, 

start transaction;
insert into persona 
values(6,'dni',37607895,'Antonella','Gorosito','1993-06-21');

insert into alumno 
values(6,6,39772);
commit;


--- EJERCICIO 8 -  COMPLEJIDAD BAJA: 
--si se desea comenzar a persistir de ahora en mas el dato de direccion de un alumno
--y considerando que este es un único cambio string de 200 caracteres.
--Determine sobre que tabla seria mas conveniente persistir esta información 
--y realizar la modificación de estructuras correspondientes.

alter table persona
add direccion varchar(200); 
