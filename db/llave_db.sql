DROP TABLE IF EXISTS roles CASCADE;
CREATE TABLE roles(
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(180) NOT NULL UNIQUE,
	image VARCHAR(255) NULL,
	route VARCHAR(255) NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);


INSERT INTO roles(name,route,created_at,updated_at)
	VALUES(
		'CLIENTE',
		'client/list',
		'2022-05-02',
		'2022-05-02'
	);


INSERT INTO roles(name,route,created_at,updated_at)
	VALUES(
		'ADMIN',
		'cliente/admin/list',
		'2022-05-02',
		'2022-05-02'
	);




DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
	id BIGSERIAL PRIMARY KEY,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255) NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	phone VARCHAR(80) NOT NULL UNIQUE,
	image VARCHAR(255) NULL,
	password VARCHAR(255) NOT NULL,
	is_available BOOLEAN NULL,
	session_token VARCHAR(255) NULL,
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



DROP TABLE IF EXISTS categoria CASCADE;
CREATE TABLE categoria (
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	id_user BIGINT NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL,
	FOREIGN KEY(id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
	
);


DROP TABLE IF EXISTS productos CASCADE;
CREATE TABLE productos (
	id BIGSERIAL PRIMARY KEY,
	titulo VARCHAR(255) NOT NULL,
	description VARCHAR(255) NOT NULL,
	id_category BIGINT NULL,
	id_user BIGINT NOT NULL,
	fechacreated BIGINT NOT NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL,
	FOREIGN KEY(id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(id_category) REFERENCES categoria(id) ON UPDATE CASCADE ON DELETE CASCADE
	
)




























