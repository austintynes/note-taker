const express = require('express');
const app = express();
const PORT = process.env.PORT || 3001;
const notes = require('./db/db.json');
const path = require('path');
const fs = require('fs');
app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use(express.static("public"))

//GET (Render)
//PUT (Update)
//POST (append to database)

//Routes to render files (front end routes)
app.get("/",(req, res) => {
    res.sendFile(path.join(__dirname, "./public/index.html"))
})

app.get("/notes",(req, res) => {
    res.sendFile(path.join(__dirname, "./public/notes.html"))
})

//Routes to work with data (api)

app.get("/api/notes",(req, res) => {
   res.json(notes)
})

app.post("/api/notes", (req, res) => {
    req.body.id = notes.length
    notes.push(req.body)
    fs.writeFileSync("./db/db.json", JSON.stringify(notes))
    res.json(notes)
})


app.delete("/api/notes/:id", (req, res) => {
for (i = 0; i < notes.length; i++) {
   if (notes[i].id == req.params.id) {



   
   }
}
fs.writeFileSync("./db/db.json", JSON.stringify(notes))
res.json(notes)
})








// last line in code
app.listen(PORT, ()=> console.log("Listening on http://localhost:3001"))

