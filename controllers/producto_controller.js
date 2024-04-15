const Producto = require('../models/producto');



module.exports = {

    async subirProdcutoController(req, res, next) {
        try {
            const datos = req.body;

            data = await Producto.subirProducto(datos);
            return res.status(201).json({
                success: true,
                message: 'Producto Creado',
                data
            })
        } catch (error) {
            console.log(`Error: ${error}`)
            return res.status(501).json({
                success: false,
                message: 'Error al subir Producto'
            })
        }
    },







    async listarProducto(req, res, next) {
        try {
            const id = req.body;
            const lista = await Producto.getProducto(id);

            return res.status(200).json(lista);
        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(500).json({
                success: false,
                message: 'Error al obtener la lista de empresas'
            });
        }
    },


    async listarProductoIdSubCategoria(req, res, next) {
        try {
            const id = req.params.id_sub;
            const lista = await Producto.getProductoidSubCategor(id);

            return res.status(200).json(lista);
        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(500).json({
                success: false,
                message: 'Error al obtener la lista de empresas'
            });
        }
    },


    async listarProductoImagen(req, res, next) {
        try {
            const id = req.body;
            const lista = await Producto.listaProducto(id);


            return res.status(200).json(lista);
        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(500).json({
                success: false,
                message: 'Error al obtener la lista de empresas'
            });
        }
    },







}
