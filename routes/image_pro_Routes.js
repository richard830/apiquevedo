const ImageProController = require('../controllers/image_pro_controller');




module.exports = (app, subirImagen) => {


    app.post('/api/image/subir_image', subirImagen.single('image_pro'), ImageProController.subirImageController);

    // app.get('/api/categoria/listarCategoria', CategoriaController.listarCategoria);


}