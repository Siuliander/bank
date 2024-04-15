const express = require('express');
const router = express.Router();

const ControllerUsuarios = require('../controllers/controller-usuarios');

// usando ou ou criando os controllers: BUSCAR
router.get('/', ControllerUsuarios.getUsuarios);
router.get('/:id', ControllerUsuarios.getUsuarios);
router.get('/identidade/:identidade', ControllerUsuarios.getUsuarios);

router.get('/add/add', ControllerUsuarios.createUsuario);

/*
// usando ou ou criando os controllers: INSERIR, CRIAR ou ADICIONAR
router.post('/', ControllerUsuarios.postUsuarios);
router.post('/add', ControllerUsuarios.postUsuarios);

// usando ou ou criando os controllers: ACTUALIZAR ou MODIFICAR
router.put('/', ControllerUsuarios.putUsuarios);
router.put('/update', ControllerUsuarios.putUsuarios);
router.post('/update', ControllerUsuarios.putUsuarios);

// usando ou ou criando os controllers: APAGAR, ELIMINAR ou EXCLUIR
router.delete('/', ControllerUsuarios.deleteUsuarios);
router.delete('/del', ControllerUsuarios.deleteUsuarios);
router.delete('/delete', ControllerUsuarios.deleteUsuarios);
router.post('/delete', ControllerUsuarios.deleteUsuarios);
*/
// exportando as Rotas
module.exports = router;