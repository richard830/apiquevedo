const ImagePro = require('../models/image_pro');
const storage = require('../utils/cloud_storage');


module.exports = {

    async subirImageController(req, res, next) {
        try {
            const dato = JSON.parse(req.body.image_pro)
            const file = req.files;

            if (file.length > 0) {
                const pathImage = `imagesub_${Date.now()}`;
                const url = await storage(file[0], pathImage);
                if (url != undefined && url != null) {
                    dato.image_pro = url;

                }
            }
            data = await ImagePro.subirImagePro(dato);
            console.log(data);
            return res.status(201).json({
                success: true,
                message: 'Imagen Subida',
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







}
