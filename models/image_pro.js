const db = require('../config/config');

const ImagePro = {};



ImagePro.subirImagePro = (producto, image) => {

    const sql = `
    INSERT INTO image_producto (
        image_pro,
        id_pro,
        fecha_image_pro
    )
    VALUES ($1, $2, $3)
    RETURNING *`;
    return db.oneOrNone(sql, [
        image.filename,
        producto.id_pro,
        new Date()
    ]);
}



// Categoria.listar = () => {
//     const sql = `select * from categoria order by fecha_categoria desc`;
//     return db.manyOrNone(sql);
// };




module.exports = ImagePro;