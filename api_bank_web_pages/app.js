const express = require('express');
const app = express();

// usando, criando ou importando o Renderizador ou View Engine 
app.set('view engine', 'ejs');
 
// importando as minhas rotas/paginas
const rotaInicio = require('./routes/route-home');


// usando ou criando as minhas rotas/paginas
 app.use('/',rotaInicio);


module.exports = app;