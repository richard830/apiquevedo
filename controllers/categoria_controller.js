const Categoria = require('../models/categoria');
const storage = require('../utils/cloud_storage');


module.exports = {

    async subirCategoriaController(req, res, next) {
        try {
            const dato = JSON.parse(req.body.image)
            const file = req.files;
            const myuser = await Categoria.verificarExisteNombreCategoria(dato.nombre);

            if (myuser) {
                return res.status(401).json({
                    success: false,
                    message: 'La Categoria ya existe'
                });

            }

            if (file.length > 0) {
                const pathImage = `image_${Date.now()}`;
                const url = await storage(file[0], pathImage);
                if (url != undefined && url != null) {
                    console.log(url)
                    dato.image = url;

                }
            }


            data = await Categoria.subirCategoria(dato);
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
