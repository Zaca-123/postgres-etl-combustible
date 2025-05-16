-- SQLBook: Code
/*
Verificamos borrando las tablas si existen
*/
DROP TABLE IF EXISTS public.departamento;
 
DROP TABLE IF EXISTS public.provincia;

DROP TABLE IF EXISTS public.registro;

DROP TABLE IF EXISTS public.transferencia;

/* Se crean las tablas para la base de datos definitiva, respetando todas las formas normales
Las formas normales son reglas que se aplican a las bases de datos relacionales para asegurar la integridad de los datos, evitar la redundancia y facilitar la eficiencia de las operaciones de la base de datos. Hay varias formas normales, cada una con sus propias reglas. Aquí están las tres primeras:
1. Primera Forma Normal (1NF): Cada columna de una tabla debe contener valores atómicos (indivisibles) y cada valor en una columna debe ser del mismo tipo. Además, cada fila debe ser única.
2. Segunda Forma Normal (2NF): Se aplica a las bases de datos con claves primarias compuestas (más de un campo en la clave primaria). Para cumplir con la 2NF, todos los campos no clave de la tabla deben depender de toda la clave primaria, no solo de una parte de ella.
3. Tercera Forma Normal (3NF): Una tabla está en 3NF si está en 2NF y además, los campos no clave no deben tener dependencias entre sí. Es decir, cada campo no clave debe depender solo de la clave primaria.
Existen formas normales más avanzadas como la Cuarta Forma Normal (4NF), Quinta Forma Normal (5NF) o la Forma Normal de Boyce-Codd (BCNF), pero las tres primeras son las más utilizadas y suelen ser suficientes para la mayoría de las aplicaciones.
*/
CREATE TABLE public.departamento (
    id SERIAL PRIMARY KEY,
    nombe VARCHAR(50) NOT NULL
    CONSTRAINT fk_provincia FOREIGN KEY (provincia_id) REFERENCES public.provincia(id),
);

CREATE TABLE public.provincia (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
    
);

CREATE TABLE public.registro (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
    CONSTRAINT fk_provincia FOREIGN KEY (provincia_id) REFERENCES public.provincia(id),
);

CREATE TABLE public.transferencia (
    id SERIAL PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT fk_departamento FOREIGN KEY (departamento_id) REFERENCES public.departamento(id),
    CONSTRAINT fk_provincia FOREIGN KEY (provincia_id) REFERENCES public.provincia(id),
    CONSTRAINT fk_registro FOREIGN KEY (registro_id) REFERENCES public.registro(id)
);

/*
Se crean las tablas temporales para cargar los datos
*/

CREATE TEMPORARY TABLE temp_provincia(
    categoria VARCHAR,
    centroide_lat FLOAT,
    centroide_lon FLOAT,
    fuente VARCHAR,
    id VARCHAR,
    iso_id VARCHAR,
    iso_nombre VARCHAR,
    nombre VARCHAR,
    nombre_completo VARCHAR
    
)

CREATE TEMPORARY TABLE temp_departamento(
    categoria VARCHAR,
    centroide_lat FLOAT,
    centroide_lon FLOAT,
    fuente VARCHAR,
    id VARCHAR,
    nombre VARCHAR,
    nombre_completo VARCHAR,
    provincia_id VARCHAR,
    provincia_interseccion FLOAT,
    provincia_nombre VARCHAR
)

CREATE TEMPORARY TABLE temp_registro(
    competencia VARCHAR,
    codigo VARCHAR,
    denominacion VARCHAR,
    encargado VARCHAR,
    encargado_cuit VARCHAR,
    domicilio VARCHAR,
    localidad VARCHAR,
    provincia_nombre VARCHAR,
    provincia_letra VARCHAR,
    codigo_postal VARCHAR,
    telefono VARCHAR,
    horario_atencion VARCHAR,
    provincia_id VARCHAR

)

CREATE TEMPORARY TABLE temp_transferencia(
    tramite_tipo VARCHAR,
    tramite_fecha DATE,
    fecha_inscripcion_inicial DATE,
    registro_seccional_codigo VARCHAR,
    registro_seccional_descripcion VARCHAR,
    registro_seccional_provincia VARCHAR,
    automotor_origen VARCHAR,
    automotor_anio_modelo INT,
    automotor_tipo_codigo VARCHAR,
    automotor_tipo_descripcion VARCHAR,
    automotor_marca_codigo VARCHAR,
    automotor_marca_descripcion VARCHAR,
    automotor_modelo_codigo VARCHAR,
    automotor_modelo_descripcion VARCHAR,
    automotor_uso_codigo VARCHAR,
    automotor_uso_descripcion VARCHAR,
    titular_tipo_persona VARCHAR,
    titular_domicilio_localidad VARCHAR,
    titular_domicilio_provincia VARCHAR,
    titular_genero VARCHAR,
    titular_anio_nacimiento INT,
    titular_pais_nacimiento VARCHAR,
    titular_porcentaje_titularidad DECIMAL,
    titular_domicilio_provincia_id VARCHAR,
    titular_pais_nacimiento_id VARCHAR
)

/*
Cargo los datos en las tablas temporales
*/





)