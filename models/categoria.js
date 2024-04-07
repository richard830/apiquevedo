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




module.exports = Categoria;