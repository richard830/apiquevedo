
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(300) NOT NULL,
	email VARCHAR(300) NOT NULL UNIQUE,
    image VARCHAR(300),
    telefono int NOT NULL UNIQUE,
	password VARCHAR(300) NOT NULL,
	session_token VARCHAR(300) NULL,
	created_at TIMESTAMP(0) NOT NULL,
);

DROP TABLE IF EXISTS roles CASCADE;
CREATE TABLE roles(
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(180) NOT NULL UNIQUE,
	image VARCHAR(255) NULL,
	route VARCHAR(255) NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);

DROP TABLE IF EXISTS user_has_roles CASCADE;
CREATE TABLE user_has_roles(
	id_user BIGSERIAL NOT NULL,
	id_rol BIGSERIAL NOT NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL,
	FOREIGN KEY(id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(id_rol) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(id_user, id_rol)
);

INSERT INTO roles(name,route,created_at,updated_at)
	VALUES(
		'TIENDA',
		'/inicio',
		'2022-05-02',
		'2022-05-02'
	);

INSERT INTO roles(name,route,created_at,updated_at)
	VALUES(
		'ADMIN',
		'/perfilAdmin',
		'2022-05-02',
		'2022-05-02'
	);


DROP TABLE IF EXISTS ubicacion CASCADE;
CREATE TABLE ubicacion(
	id_ubicacion BIGSERIAL PRIMARY KEY,
	provincia VARCHAR(300) NOT NULL,
	ciudad VARCHAR(300) NOT NULL,
   
	fecha_ubicacion TIMESTAMP(0) NOT NULL,
);

DROP TABLE IF EXISTS empresa_s CASCADE;
CREATE TABLE empresa_s(
	id_empresa_s BIGSERIAL PRIMARY KEY,
	nombre_empresa_s VARCHAR(300) NULL,
	image_empresa_s VARCHAR(300) NULL,
	id_ubicacion BIGSERIAL,
	fecha_empresa_s TIMESTAMP(0) NOT NULL,
	FOREIGN KEY(id_ubicacion) REFERENCES ubicacion(id_ubicacion)
);

DROP TABLE IF EXISTS tipo_empresa CASCADE;
CREATE TABLE tipo_empresa(
	id_tipo_empresa BIGSERIAL PRIMARY KEY,
	nombre_tipo_empresa VARCHAR(300) NULL,
	image_tipo_empresa VARCHAR(300) NULL,
	id_empresa_s BIGSERIAL,
	fecha_tipo_empresa TIMESTAMP(0) NOT NULL,
	FOREIGN KEY(id_empresa_s) REFERENCES empresa_s(id_empresa_s) ON UPDATE CASCADE ON DELETE CASCADE,
);

DROP TABLE IF EXISTS empresa CASCADE;
CREATE TABLE empresa(
	id_empresa BIGSERIAL PRIMARY KEY,
	nombre_empresa VARCHAR(300) NULL,
	ciudad_empresa VARCHAR(300),
	descripcion_empresa VARCHAR(300),
	telefono_empresa VARCHAR(20),
  vista_empresa int DEFAULT 0,
  latitud text,
  longitud text,

	image_empresa VARCHAR(300) NULL,
	id_tipo_empresa BIGSERIAL,
	fecha_empresa TIMESTAMP(0) NOT NULL,
	FOREIGN KEY(id_tipo_empresa) REFERENCES tipo_empresa(id_tipo_empresa) ON UPDATE CASCADE ON DELETE CASCADE,
);


DROP TABLE IF EXISTS producto_categoria CASCADE;
CREATE TABLE producto_categoria (
  id_producto_categoria BIGSERIAL PRIMARY KEY,
  nombre_producto_categoria VARCHAR(200),
  image_producto_categoria text,
  id_empresa BIGSERIAL,
  fecha_producto_categoria TIMESTAMP(0) NOT NULL,
 FOREIGN KEY(id_empresa) REFERENCES empresa(id_empresa) ON UPDATE CASCADE ON DELETE CASCADE
)


DROP TABLE IF EXISTS producto CASCADE;
CREATE TABLE producto (
  id_producto BIGSERIAL PRIMARY KEY,
  nombre_producto VARCHAR(200),
  descripcion_producto text,
  precio_producto DECIMAL DEFAULT 0,
  vista_producto int DEFAULT 0,
  id_producto_categoria BIGSERIAL,
  id_empresa BIGSERIAL,
  fecha_producto TIMESTAMP(0) NOT NULL,
 FOREIGN KEY(id_producto_categoria) REFERENCES producto_categoria(id_producto_categoria) ON UPDATE CASCADE ON DELETE CASCADE,
 FOREIGN KEY(id_empresa) REFERENCES empresa(id_empresa) ON UPDATE CASCADE ON DELETE CASCADE
)

DROP TABLE IF EXISTS producto_foto CASCADE;
CREATE TABLE producto_foto (
  id_producto_foto BIGSERIAL PRIMARY KEY,
  imagen_producto_foto VARCHAR(300),
  id_producto BIGSERIAL,
  fecha_producto_foto TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON UPDATE CASCADE ON DELETE CASCADE

);


DROP TABLE IF EXISTS producto_like CASCADE;
CREATE TABLE producto_like (
  id_producto_like BIGSERIAL PRIMARY KEY,
  id_usuario BIGSERIAL,
  id_producto BIGSERIAL,
  fecha_producto_like TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_usuario) REFERENCES users(id),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)

);




DROP TABLE IF EXISTS publicidad_empresa CASCADE;
CREATE TABLE publicidad_empresa (
  id_publicidad_empresa BIGSERIAL PRIMARY KEY,
  imagen_publicidad_empresa VARCHAR(70),
  estado_publicidad_empresa boolean DEFAULT true,
  id_empresa BIGSERIAL,
  fecha_publicidad_empresa TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY(id_empresa) REFERENCES empresa(id_empresa) ON UPDATE CASCADE ON DELETE CASCADE
);




DROP TABLE IF EXISTS hotel CASCADE;
CREATE TABLE hotel (
  id_hotel BIGSERIAL PRIMARY KEY,
  tipo_hotel VARCHAR(200),
  nombre_hotel VARCHAR(200),
  detalle_hotel text,
  ciudad_hotel VARCHAR(200),
  telefono_hotel int,
  estrella_hotel VARCHAR(20),
  vista_hotel int DEFAULT 0,
  latitud text,
  longitud text,
  fecha_hotel TIMESTAMP(0) NOT NULL
)

DROP TABLE IF EXISTS hotel_foto CASCADE;
CREATE TABLE hotel_foto (
  id_hotel_foto BIGSERIAL PRIMARY KEY,
  imagen_hotel_foto VARCHAR(300),
  id_hotel BIGSERIAL,
  fecha_hotel_foto TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel) ON UPDATE CASCADE ON DELETE CASCADE

)

DROP TABLE IF EXISTS hotel_like CASCADE;
CREATE TABLE hotel_like (
  id_like_hotel BIGSERIAL PRIMARY KEY,
  id_usuario INT,
  id_hotel INT,
  fecha_like_hotel TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_usuario) REFERENCES users(id),
  FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel)

);

DROP TABLE IF EXISTS habitacion_hotel CASCADE;
CREATE TABLE habitacion_hotel (
  id_habitacion_hotel BIGSERIAL PRIMARY KEY,
  tipo_habitacion text,
  descripcion_habitacion text,
  precio_habitacion int,
  precio_hora_habitacion int,
  dormitorio_habitacion int,
  cama_habitacion int,
  disponible_habitacion boolean DEFAULT TRUE,
  id_hotel BIGSERIAL,
  fecha_habitacion_hotel TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel)
)







DROP TABLE IF EXISTS servicio_hotel CASCADE;
CREATE TABLE servicio_hotel (
  id_servicio_hotel BIGSERIAL PRIMARY KEY,
  nombre_servicio text,
  id_hotel BIGSERIAL,
  fecha_servicio TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel)
)




DROP TABLE IF EXISTS turismo CASCADE;
CREATE TABLE turismo (
  id_turismo BIGSERIAL PRIMARY KEY,
  ciudad VARCHAR(100),
  nombre VARCHAR(200),
  descripcion text,
  gastronomia text,
  horario text,
  latitud text,
  longitud text,
  vista_turismo int DEFAULT 0,
  id_empresa_s BIGSERIAL,
  fecha_turismo TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY(id_empresa_s) REFERENCES empresa_s(id_empresa_s) ON UPDATE CASCADE ON DELETE CASCADE
 
);


DROP TABLE IF EXISTS turismo_foto CASCADE;
CREATE TABLE turismo_foto (
  id_turismo_foto BIGSERIAL PRIMARY KEY,
  imagen_turismo_foto VARCHAR(300),
  id_turismo BIGSERIAL,
  fecha_turismo_foto TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_turismo) REFERENCES turismo(id_turismo) ON UPDATE CASCADE ON DELETE CASCADE

)


DROP TABLE IF EXISTS turismo_like CASCADE;
CREATE TABLE turismo_like (
  id_turismo_like BIGSERIAL PRIMARY KEY,
  id_usuario BIGSERIAL,
  id_turismo BIGSERIAL,
  fecha_turismo_like TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_usuario) REFERENCES users(id),
  FOREIGN KEY (id_turismo) REFERENCES turismo(id_turismo)

);



