const db = require('../config/config');

const Categoria = {};



Categoria.subirCategoria = (categoria, image) => {

    const sql = `
    INSERT INTO categoria (nombre, image, fecha_categoria)
    VALUES ($1, $2, $3)
    RETURNING *`;
    return db.oneOrNone(sql, [
        categoria.nombre,
        image.filename,
        new Date()
    ]);
}



Categoria.listarCategoria = () => {
    const sql = `select * from categoria order by fecha_categoria desc`;
    return db.manyOrNone(sql);
};


Categoria.listarCategoriaLimite = () => {
    const sql = `SELECT * FROM categoria ORDER BY fecha_categoria DESC LIMIT 5;`;
    return db.manyOrNone(sql);
};



Categoria.verificarExisteNombreCategoria = (nombre) => {
    const sql = `SELECT * FROM categoria where nombre = $1;`;
    return db.manyOrNone(sql, nombre);
};




module.exports = Categoria;
