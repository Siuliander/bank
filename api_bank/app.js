const express = require('express');
const app = express();

// importando as minhas rotas
const rotaUsuarios = require('./routes/route-usuarios');


/*
app.use((req, res, next)=>{
	res.status(200).send({
		mensagem : "Ok, Deu Certo"
	});
});

// rota raiz da api
app.use('/',(req, res, next)=>{
	res.status(200).send({
		mensagem : "informações de utilização da api"
	});
});
*/

// usando ou criando as minhas rotas
app.use('/usuarios',rotaUsuarios);


module.exports = app;