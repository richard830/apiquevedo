const db = require('../config/config');

const Categoria = {};



Categoria.subirCategoria = (categoria) => {

    const sql = `
    INSERT INTO categoria (nombre, image, fecha_categoria)
    VALUES ($1, $2, $3)
    RETURNING *`;
    return db.oneOrNone(sql, [
        categoria.nombre,
        categoria.image,
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

Categoria.verificarExisteNombreCategoria = async(nombre) => {
    try {
        const sql = `SELECT * FROM categoria where nombre = $1;`;
        const result = await db.manyOrNone(sql, nombre);
        return result.length > 0; // Devuelve true si hay al menos un resultado, lo que significa que el nombre ya existe
    } catch (error) {
        console.error('Error al verificar si la categoría ya existe:', error);
        throw error; // Propaga el error para que pueda ser manejado por el controlador
    }
};


// Categoria.verificarExisteNombreCategoria = (nombre) => {
//     const sql = `SELECT * FROM categoria where nombre = $1;`;
//     return db.manyOrNone(sql, nombre);
// };




module.exports = Categoria;
