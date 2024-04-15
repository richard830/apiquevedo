const db = require('../config/config');

const SubCategoria = {};



SubCategoria.subirSubCategoria = (sub) => {

    const sql = `
    INSERT INTO subcategoria (nombre_sub, image_sub, id_categoria, fecha_sub)
    VALUES ($1, $2, $3, $4)
    RETURNING *`;
    return db.oneOrNone(sql, [
        sub.nombre_sub,
        sub.image_sub,
        sub.id_categoria,
        new Date()
    ]);
}



SubCategoria.listarSubCategoria = () => {
    const sql = `select * from subcategoria order by fecha_sub desc`;
    return db.manyOrNone(sql);
};


SubCategoria.listarSubCategoriaID = (id_categoria) => {
    const sql = `select * from subcategoria WHERE id_categoria = $1 order by fecha_sub desc`;
    return db.manyOrNone(sql, id_categoria);
};


SubCategoria.verificarExisteNombreSubCategoria = async(nombre) => {
    try {
        const sql = `SELECT * FROM subcategoria where nombre_sub = $1;`;
        const result = await db.manyOrNone(sql, nombre);
        return result.length > 0; // Devuelve true si hay al menos un resultado, lo que significa que el nombre ya existe
    } catch (error) {
        console.error('Error al verificar si la categoría ya existe:', error);
        throw error; // Propaga el error para que pueda ser manejado por el controlador
    }
};


// SubCategoria.verificarExisteNombreSubCategoria = (nombre) => {
//     const sql = `SELECT * FROM subcategoria where nombre_sub = $1;`;
//     return db.manyOrNone(sql, nombre);
// };


module.exports = SubCategoria;
