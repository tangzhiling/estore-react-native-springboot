const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql");
const crypto = require("crypto");
const nodemailer = require("nodemailer");

const app = express();
const cors = require("cors");
app.use(cors());

app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

const jwt = require("jsonwebtoken");

const db = mysql.createConnection({

    host: 'localhost',
    user: 'root',
    password: '',
    database: 'test_db'
});

db.connect((err) => {
    if (err) throw err;
    console.log('Connected to the database.'); 
});

const PORT = 8080;
app.listen(PORT, () => {
    console.log('Server is running on port: ${PORT}');
});



//endpoint to register in the app
app.post("/register"), async(req, res) => {
    try{
        const {user, email, password} = req.body;

        //const existingUser = await 


    } catch(error) {
        console.log("错误：注册用户失败", error);
        res.status(500).json({message:"注册失败"});
    } 
}

