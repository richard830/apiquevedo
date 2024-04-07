
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
		'Usuario',
		'/inicio',
		'2022-05-02',
		'2022-05-02'
	);

INSERT INTO roles(name,route,created_at,updated_at)
	VALUES(
		'ADMIN',
		'/admin',
		'2022-05-02',
		'2022-05-02'
	);




DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(300) NOT NULL UNIQUE,
	password VARCHAR(300) NOT NULL,
	phone VARCHAR(15) NOT NULL,
	cedula VARCHAR(15) NOT NULL,
	session_token VARCHAR(255) NULL,
	created_at TIMESTAMP(0) NOT NULL,
);


DROP TABLE IF EXISTS categoria CASCADE;
CREATE TABLE categoria (
  id_categoria BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(200),
  image text,
  fecha_categoria TIMESTAMP(0) NOT NULL,
);

DROP TABLE IF EXISTS subcategoria CASCADE;
CREATE TABLE subcategoria (
  id_sub BIGSERIAL PRIMARY KEY,
  nombre_sub VARCHAR(200),
  image_sub text,
  id_categoria INT,
  fecha_sub TIMESTAMP(0) NOT NULL,
  FOREIGN KEY(id_categoria) REFERENCES categoria(id_categoria) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS producto CASCADE;
CREATE TABLE producto (
  id_pro BIGSERIAL PRIMARY KEY,
  nombre_pro VARCHAR(300),
  descripcion_pro TEXT,
  precio_pro DECIMAL DEFAULT 0,
  direccion_pro TEXT,
  telefono_pro TEXT,
  id_sub INT,
  fecha_pro TIMESTAMP(0) NOT NULL,
  FOREIGN KEY(id_sub) REFERENCES subcategoria(id_sub) ON UPDATE CASCADE ON DELETE CASCADE
)

DROP TABLE IF EXISTS image_producto CASCADE;
CREATE TABLE image_producto (
  id_image_pro BIGSERIAL PRIMARY KEY,
  image_pro VARCHAR(300),
  id_pro INT,
  fecha_image_pro TIMESTAMP(0) NOT NULL,
  FOREIGN KEY(id_pro) REFERENCES producto(id_pro) ON UPDATE CASCADE ON DELETE CASCADE
)