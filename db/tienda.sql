
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL,
	session_token VARCHAR(255) NULL,
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







DROP TABLE IF EXISTS empresa_p CASCADE;
CREATE TABLE empresa_p (
  id_empresa_p BIGSERIAL PRIMARY KEY,
  nombre_p VARCHAR(200),
  image_p text,
  fecha_empresa_p TIMESTAMP(0) NOT NULL,
 
);

DROP TABLE IF EXISTS tipo_empresa CASCADE;
CREATE TABLE tipo_empresa (
  id_empresa BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(200),
  image text,
  id_empresa_p BIGSERIAL,
  fecha_empresa TIMESTAMP(0) NOT NULL,
 FOREIGN KEY(id_empresa_p) REFERENCES empresa_p(id_empresa_p) ON UPDATE CASCADE ON DELETE CASCADE,
);


DROP TABLE IF EXISTS empresa CASCADE;
CREATE TABLE empresa (
  id_e BIGSERIAL PRIMARY KEY,
  nombre_empresa VARCHAR(200),
  image_empresa text,
  ciudad_empresa VARCHAR(200),
  vista_empresa int DEFAULT 0,
  id_empresa BIGSERIAL,
  fecha_e TIMESTAMP(0) NOT NULL,
 FOREIGN KEY(id_empresa) REFERENCES tipo_empresa(id_empresa) ON UPDATE CASCADE ON DELETE CASCADE,
);


DROP TABLE IF EXISTS empresa_producto_categoria CASCADE;
CREATE TABLE empresa_producto_categoria (
  id_empresa_producto_categoria BIGSERIAL PRIMARY KEY,
  nombre_empresa_producto_categoria VARCHAR(200),
  image_empresa_producto_categoria text,
  id_e BIGSERIAL,
  fecha_empresa_producto_categoria TIMESTAMP(0) NOT NULL,
 FOREIGN KEY(id_e) REFERENCES empresa(id_e) ON UPDATE CASCADE ON DELETE CASCADE
)


DROP TABLE IF EXISTS empresa_producto CASCADE;
CREATE TABLE empresa_producto (
  id_empresa_producto BIGSERIAL PRIMARY KEY,
  nombre_empresa_producto VARCHAR(200),
  descripcion_empresa_producto text,
  precio_empresa_producto DECIMAL DEFAULT 0,
  vista_empresa_producto int DEFAULT 0,
  id_empresa_producto_categoria BIGSERIAL,
  id_e BIGSERIAL,
  fecha_empresa_producto TIMESTAMP(0) NOT NULL,
 FOREIGN KEY(id_empresa_producto_categoria) REFERENCES empresa_producto_categoria(id_empresa_producto_categoria),
 FOREIGN KEY(id_e) REFERENCES empresa(id_e) 
)


DROP TABLE IF EXISTS empresa_producto_foto CASCADE;
CREATE TABLE empresa_producto_foto (
  id_empresa_producto_foto BIGSERIAL PRIMARY KEY,
  imagen_empresa_producto_foto VARCHAR(200),
  id_empresa_producto BIGSERIAL,
  fecha_empresa_producto_foto TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_empresa_producto) REFERENCES empresa_producto(id_empresa_producto)

);


DROP TABLE IF EXISTS empresa_producto_like CASCADE;
CREATE TABLE empresa_producto_like (
  id_empresa_producto_like BIGSERIAL PRIMARY KEY,
  id_usuario BIGSERIAL,
  id_empresa_producto BIGSERIAL,
  fecha_empresa_like TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_usuario) REFERENCES users(id),
  FOREIGN KEY (id_empresa_producto) REFERENCES empresa_producto(id_empresa_producto)

);





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
  id_empresa BIGSERIAL,
  fecha_turismo TIMESTAMP(0) NOT NULL, 
   FOREIGN KEY(id_empresa) REFERENCES tipo_empresa(id_empresa) ON UPDATE CASCADE ON DELETE CASCADE
 
);












DROP TABLE IF EXISTS subempresa CASCADE;
CREATE TABLE subempresa (
  id_subempresa BIGSERIAL PRIMARY KEY,
  nombre_subempresa VARCHAR(200),
  image_subempresa text,
  ciudad VARCHAR(200),
  calle VARCHAR(200),
  telefono VARCHAR(200),
  fecha_empresa TIMESTAMP(0) NOT NULL,
  vista int DEFAULT 0,

  descripcion_subempresa text,
  horario_subempresa text,
  latitud_subempresa text,
  longitud_subempresa text,

  id_empresa BIGSERIAL,
  id_user BIGSERIAL,
  FOREIGN KEY(id_empresa) REFERENCES empresa(id_empresa) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
 
);

DROP TABLE IF EXISTS cat_producto CASCADE;
CREATE TABLE cat_producto (
  id_catproducto BIGSERIAL PRIMARY KEY,
  nombre_catproducto VARCHAR(200),
  imagen_catproducto VARCHAR(70),
  id_subempresa BIGSERIAL,
  fecha_catproducto TIMESTAMP(0) NOT NULL, 
  
  FOREIGN KEY(id_subempresa) REFERENCES subempresa(id_subempresa) ON UPDATE CASCADE ON DELETE CASCADE
 
);

DROP TABLE IF EXISTS producto CASCADE;
CREATE TABLE producto (
  id_producto BIGSERIAL PRIMARY KEY,
  nombre_producto VARCHAR(200),
  imagen_producto VARCHAR(70),
  imagen_producto1 VARCHAR(70),
  imagen_producto2 VARCHAR(70),
  imagen_producto3 VARCHAR(70),
  descripcion_producto text,
  precio_producto DECIMAL DEFAULT 0,
  estado boolean DEFAULT true;
  fecha_producto TIMESTAMP(0) NOT NULL, 
  id_subempresa BIGSERIAL,
  id_catproducto BIGSERIAL,
  id_user BIGSERIAL,
  FOREIGN KEY(id_subempresa) REFERENCES subempresa(id_subempresa) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(id_catproducto) REFERENCES cat_producto(id_catproducto) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
 
);










DROP TABLE IF EXISTS turismo_foto CASCADE;
CREATE TABLE turismo_foto (
  id_turismo_foto BIGSERIAL PRIMARY KEY,
  imagen_turismo_foto VARCHAR(100),
  id_turismo INT,
  fecha_turismo_foto TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_turismo) REFERENCES turismo(id_turismo)

);


DROP TABLE IF EXISTS evento CASCADE;
CREATE TABLE evento (
  id_evento BIGSERIAL PRIMARY KEY,
  imagen_evento VARCHAR(70),
  nombre_evento text,
  descripcion_evento text,
  hora_evento VARCHAR(50),
  fecha_evento VARCHAR(50),
  vista_evento int DEFAULT 0,
  like_evento int DEFAULT 0,
  lugar VARCHAR(900),
  fecha_evento_sistema TIMESTAMP(0) NOT NULL, 
 
);

DROP TABLE IF EXISTS comentario_evento CASCADE;
CREATE TABLE comentario_evento (
  id_comentario BIGSERIAL PRIMARY KEY,
  datos text,
  id_evento BIGSERIAL,
  id_usuario BIGSERIAL,
  fecha_comentario TIMESTAMP(0) NOT NULL, 
 
  FOREIGN KEY(id_evento) REFERENCES evento(id_evento) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(id_usuario) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);




DROP TABLE IF EXISTS publicidad CASCADE;
CREATE TABLE publicidad (
  id_publicidad BIGSERIAL PRIMARY KEY,
  imagen_publicidad VARCHAR(70),
  estado_publicidad boolean DEFAULT true,
  id_subempresa BIGSERIAL,
  id_empresa BIGSERIAL,
  fecha_publicidad TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY(id_subempresa) REFERENCES subempresa(id_subempresa) ON UPDATE CASCADE ON DELETE CASCADE
  FOREIGN KEY(id_empresa) REFERENCES empresa(id_empresa) ON UPDATE CASCADE ON DELETE CASCADE
 
);



DROP TABLE IF EXISTS liketurismo CASCADE;
CREATE TABLE liketurismo (
  id_liketurismo BIGSERIAL PRIMARY KEY,
  id_usuario INT,
  id_turismo INT,
  fecha_liketurismo TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_usuario) REFERENCES users(id),
  FOREIGN KEY (id_turismo) REFERENCES turismo(id_turismo)

);

DROP TABLE IF EXISTS likevento CASCADE;
CREATE TABLE likevento (
  id_likevento BIGSERIAL PRIMARY KEY,
  id_usuario INT,
  id_evento INT,
  fecha_likevento TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_usuario) REFERENCES users(id),
  FOREIGN KEY (id_evento) REFERENCES evento(id_evento)

);

DROP TABLE IF EXISTS vista_turismo CASCADE;
CREATE TABLE vista_turismo (
  id_vista_turismo BIGSERIAL PRIMARY KEY,
  id_usuario INT,
  id_turismo INT,
  fecha_vista_turismo TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_usuario) REFERENCES users(id),
  FOREIGN KEY (id_turismo) REFERENCES turismo(id_turismo)

);



DROP TABLE IF EXISTS vista_evento CASCADE;
CREATE TABLE vista_evento (
  id_vista_evento BIGSERIAL PRIMARY KEY,
  id_usuario INT,
  id_evento INT,
  fecha_vista_evento TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_usuario) REFERENCES users(id),
  FOREIGN KEY (id_evento) REFERENCES evento(id_evento)

);




DROP TABLE IF EXISTS hotel CASCADE;
CREATE TABLE hotel (
  id_hotel BIGSERIAL PRIMARY KEY,
  nombre_hotel VARCHAR(200),
  ciudad_hotel VARCHAR(100),
  tipo_hotel VARCHAR(100),
  
  descripcion text,
  precio_hora text,
  precio_dia text,
  descripcion_n text,

  precio_hora_f text,
  precio_dia_f text,
  descripcion_f text,
  estrella VARCHAR(10),
  telefono_hotel VARCHAR(18),
  vista_hotel int DEFAULT 0,

  latitud text,
  longitud text,
  fecha_hotel TIMESTAMP(0) NOT NULL,  
 
);





DROP TABLE IF EXISTS hotel_normal CASCADE;
CREATE TABLE hotel_normal (
  id_hotel_normal BIGSERIAL PRIMARY KEY,
  imagen_normal VARCHAR(100),
  id_hotel INT,
  fecha_hotel_normal TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel)

);

DROP TABLE IF EXISTS hotel_familiar CASCADE;
CREATE TABLE hotel_familiar (
  id_hotel_familiar BIGSERIAL PRIMARY KEY,
  imagen_familiar VARCHAR(100),
  id_hotel INT,
  fecha_hotel_familiar TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel)

);

DROP TABLE IF EXISTS hotel_foto CASCADE;
CREATE TABLE hotel_foto (
  id_hotel_foto BIGSERIAL PRIMARY KEY,
  imagen_foto VARCHAR(100),
  id_hotel INT,
  fecha_hotel_foto TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel)

);


DROP TABLE IF EXISTS hotel_like CASCADE;
CREATE TABLE hotel_like (
  id_like_hotel BIGSERIAL PRIMARY KEY,
  id_usuario INT,
  id_hotel INT,
  fecha_like_hotel TIMESTAMP(0) NOT NULL, 
  FOREIGN KEY (id_usuario) REFERENCES users(id),
  FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel)

);