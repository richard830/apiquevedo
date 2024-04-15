const db = require('../config/config');

const SubCategoria = {};



SubCategoria.subirSubCategoria = (sub, image) => {

    const sql = `
    INSERT INTO subcategoria (nombre_sub, image_sub, id_categoria, fecha_sub)
    VALUES ($1, $2, $3, $4)
    RETURNING *`;
    return db.oneOrNone(sql, [
        sub.nombre_sub,
        image.filename,
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

SubCategoria.verificarExisteNombreSubCategoria = (nombre) => {
    const sql = `SELECT * FROM subcategoria where nombre_sub = $1;`;
     const categorias = await db.manyOrNone(sql, nombre);
    
    if (categorias.length === 0) {
        // No hay categorías con ese nombre en la base de datos
        return null;
    } else {
        // Hay categorías con ese nombre en la base de datos
        return categorias;
    }
   // return db.manyOrNone(sql, nombre);
};


module.exports = SubCategoria;
