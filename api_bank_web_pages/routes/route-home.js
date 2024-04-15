const express = require('express');
const router = express.Router();

const ViewHome = '../views/view-home';

// usando ou ou criando a View
router.get('/', (req, res, next) =>{ res.status(200).render(ViewHome); });

// exportando as Rotas
module.exports = router;