const db = require('../config/config');

const Producto = {};



Producto.subirProducto = (producto) => {

    const sql = `
    INSERT INTO producto (
        nombre_pro,
        descripcion_pro,
        precio_pro,
        direccion_pro,
        telefono_pro,
        latitud,
        longitud,
        id_sub,
        fecha_pro
    )
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8,$9)
    RETURNING *`;
    return db.oneOrNone(sql, [
        producto.nombre_pro,
        producto.descripcion_pro,
        producto.precio_pro,
        producto.direccion_pro,
        producto.telefono_pro,
        producto.latitud,
        producto.longitud,
        producto.id_sub,
        new Date()
    ]);
}



Producto.getProducto = () => {
    const sql = `select * from producto order by fecha_pro desc`;
    return db.manyOrNone(sql);
};


Producto.getProductoidSubCategor = (id_sub) => {
    const sql = `SELECT
    p.nombre_pro,
    p.descripcion_pro,
    p.precio_pro,
    p.direccion_pro,
    p.telefono_pro,
    p.latitud,
    p.longitud,
    p.id_sub,
    COALESCE(image_aggregation.imagenes) AS imagenes
FROM 
    producto AS p
LEFT JOIN (
    SELECT
        ip.id_pro,
        JSON_AGG(
            JSON_BUILD_OBJECT(
                'id_image_pro', ip.id_image_pro,
                'image_pro', ip.image_pro
            ) ORDER BY ip.id_image_pro DESC
        ) AS imagenes
    FROM 
        image_producto AS ip
    GROUP BY 
        ip.id_pro
) AS image_aggregation ON p.id_pro = image_aggregation.id_pro
where id_sub = $1
ORDER BY p.fecha_pro DESC `;
    return db.manyOrNone(sql, id_sub);
};


Producto.listaProducto = () => {
    const sql = `SELECT
    p.nombre_pro,
    p.descripcion_pro,
    p.precio_pro,
    p.direccion_pro,
    p.telefono_pro,
    p.latitud,
    p.longitud,
    p.id_sub,
    COALESCE(image_aggregation.imagenes) AS imagenes
FROM 
    producto AS p
LEFT JOIN (
    SELECT
        ip.id_pro,
        JSON_AGG(
            JSON_BUILD_OBJECT(
                'id_image_pro', ip.id_image_pro,
                'image_pro', ip.image_pro
            ) ORDER BY ip.id_image_pro DESC
        ) AS imagenes
    FROM 
        image_producto AS ip
    GROUP BY 
        ip.id_pro
) AS image_aggregation ON p.id_pro = image_aggregation.id_pro
ORDER BY p.fecha_pro DESC LIMIT 8`;
    return db.manyOrNone(sql);
};




module.exports = Producto;
