const SubCategoriaController = require('../controllers/sub_categoria_controller');




module.exports = (app, subirImagen) => {


    app.post('/api/sub_categoria/subir_subcategoria', subirImagen.single('image_sub'), SubCategoriaController.subirSubCategoriaController);
    app.get('/api/sub_categoria/listarsubCategoria', SubCategoriaController.listarSubCategoria);


}