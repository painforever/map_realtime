var app = require('express')();
var server = require('http').Server(app);
var io = require('socket.io')(server);

io.origins('*:*');

io.on('connection', function (socket) {
    console.log("user connected!");
    socket.broadcast.emit({ user: 'connected!' });
    socket.on('newTransaction', function (transaction) {
        console.log(transaction);
        io.emit('changeColor', { country_code: transaction.country_code });
    });

    socket.on('fromMobile', function(data){
        console.log(data);
    });
});

server.listen(8998);