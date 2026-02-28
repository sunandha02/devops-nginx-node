const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send("Hello Sir, Nginx + Node + Docker + Kubernetes Working 🚀");
});

app.listen(3000, () => {
    console.log("Node app running on port 3000");
});
