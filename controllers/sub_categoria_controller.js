const SubCategoria = require('../models/sub_categoria');



module.exports = {

    async subirSubCategoriaController(req, res, next) {
        try {
            const image = req.file;
            const datos = req.body;
            //  const datos = JSON.parse(req.body);

            data = await SubCategoria.subirSubCategoria(datos, image);
            console.log(data);
            return res.status(201).json({
                success: true,
                message: 'SubCategoria Creada con exito',
                data
            })
        } catch (error) {
            console.log(`Error: ${error}`)
            return res.status(501).json({
                success: false,
                message: 'Error al subir'
            })
        }
    },







    async listarSubCategoria(req, res, next) {
        try {
            const id = req.body;
            const lista = await SubCategoria.listarSubCategoria(id);

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