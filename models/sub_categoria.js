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




module.exports = SubCategoria;