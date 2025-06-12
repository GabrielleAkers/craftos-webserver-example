const express = require("express");
const expressWs = require("express-ws");
const app = express();
app.use(express.json())
expressWs(app);
const port = 8081;

const theData = [];

/** @type {WebSocket[]} */
const connectedListeners = [];

app.use(express.static("public"));

app.get("/", (req, res) => {
    res.send(res.sendFile(__dirname + "/public/index.html"));
})

app.post("/", (req, res) => {
    // you should do some validation here lol
    theData.push(req.body);

    connectedListeners.forEach(ws => {
        if (ws.readyState == ws.OPEN) {
            ws.send(JSON.stringify(theData));
        }
    });
    res.sendStatus(200);
})

app.ws("/", /** @param {WebSocket} ws */(ws, req) => {
    console.log("someone connected");
    connectedListeners.push(ws);
    ws.on("open", () => {
        ws.send(JSON.stringify(theData));
    });
})

app.listen(port, "0.0.0.0", () => console.log(`listening ...`));