const Categoria = require('../models/categoria');



module.exports = {

    async subirCategoriaController(req, res, next) {
        try {
            const image = req.file;
            const datos = req.body;
            const nombre = req.body.nombre;
            const myuser = await Categoria.verificarExisteNombreCategoria(nombre);

            if (myuser) {
                return res.status(401).json({
                    success: false,
                    message: 'La Categoria ya existe'
                });

            }

            data = await Categoria.subirCategoria(datos, image);
            console.log(data);
            return res.status(201).json({
                success: true,
                message: 'Categoria Creada',
                data
            })
        } catch (error) {
            console.log(`Error: ${error}`)
            return res.status(501).json({
                success: false,
                message: 'Error al eliminar Producto'
            })
        }
    },







    async listarCategoria(req, res, next) {
        try {
            const id = req.body;
            const lista = await Categoria.listarCategoria(id);

            return res.status(200).json(lista);
        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(500).json({
                success: false,
                message: 'Error al obtener la lista de empresas'
            });
        }
    },
    async listarCategoriaLimites(req, res, next) {
        try {
            const id = req.body;
            const lista = await Categoria.listarCategoriaLimite(id);

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
