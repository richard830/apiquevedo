const SubCategoriaController = require('../controllers/sub_categoria_controller');




module.exports = (app, subirImagen) => {


    app.post('/api/sub_categoria/subir_subcategoria', subirImagen.array('image_sub', 1), SubCategoriaController.subirSubCategoriaController);
    app.get('/api/sub_categoria/listarsubCategoria', SubCategoriaController.listarSubCategoria);
    app.get('/api/sub_categoria/listarsubCategoriaxID/:id_categoria', SubCategoriaController.listarSubCategoriaxID);


}
