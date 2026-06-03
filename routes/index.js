import express from "express"
const app = express();
const port = 3333;


app.get("/", (req, res) => {
  res.send("covarde")
})

app.listen(3333);