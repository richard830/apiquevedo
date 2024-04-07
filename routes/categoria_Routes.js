const CategoriaController = require('../controllers/categoria_controller');




module.exports = (app, subirImagen) => {


    app.post('/api/categoria/subir_categoria', subirImagen.single('image'), CategoriaController.subirCategoriaController);
    app.get('/api/categoria/listarCategoria', CategoriaController.listarCategoria);


}