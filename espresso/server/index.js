const express = require("express");
const http = require("http");
const url = require("url");
const WebSocket = require("ws");

const app = express();
const server = http.createServer(app);
const wss = new WebSocket.Server({ server });

function heartbeat() {
  this.isAlive = true;
}

wss.on("connection", function connection(ws, req) {
  function message() {
    date = new Date();
    data = JSON.stringify({ msg: Math.random(), ts: date });
    ws.send(data, function(err) {
      if (err) {
        ws.terminate();
      }
    });
  }

  var interval = setInterval(message, 5000);
  ws.on("close", function() {
    clearInterval(interval);
  });
});

server.listen(4000, function listening() {
  console.log("Listening on %d", server.address().port);
});
