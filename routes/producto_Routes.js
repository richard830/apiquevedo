const ProductoController = require('../controllers/producto_controller');




module.exports = (app, subirImagen) => {


    app.post('/api/producto/subir_producto', ProductoController.subirProdcutoController);
    app.get('/api/producto/listarProducto', ProductoController.listarProducto);
    app.get('/api/producto/listarProductoImagen', ProductoController.listarProductoImagen);
    app.get('/api/producto/listarProductosubCategoria/:id_sub', ProductoController.listarProductoIdSubCategoria);


    // app.post('/api/producto/subir_producto', subirImagen.single('image'), CategoriaController.subirCategoriaController);


}
