const SubCategoria = require('../models/sub_categoria');



module.exports = {

    async subirSubCategoriaController(req, res, next) {
        try {
            const image = req.file;
            const datos = req.body;
           // const nombre_sub = req.body.nombre_sub;
          //  const myuser = await SubCategoria.verificarExisteNombreSubCategoria(nombre_sub);

            //if (myuser) {
             //   return res.status(401).json({
              //  success: false,
             //   message: 'La SubCategoría ya existe'
            //}); 
            
           

                //}

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



    async listarSubCategoriaxID(req, res, next) {
        try {
            const id = req.params.id_categoria;
            const lista = await SubCategoria.listarSubCategoriaID(id);
            const listas = lista.map(producto => {
                return {
                    nombre_sub: producto.nombre_sub,
                    image_sub: `https://apibacke-c332a15fe19e.herokuapp.com/uploads/${producto.image_sub}`,
                    id_categoria: producto.id_categoria,
                    id_sub: producto.id_sub,

                };
            });

            return res.status(200).json(listas);
        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(500).json({
                success: false,
                message: 'Error al obtener la lista de empresas'
            });
        }
    },







}
