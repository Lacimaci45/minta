//Backend felépítése

const express=require('express');
const cors=require('cors');
const mysql=require('mysql');
const app=express();
const {becenevek,dolgozok,munkavallalok,ujbecenev,modositbecenev,torolbecenev, elerhetoseg} =require('./dbrepo.js');

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended:true}));

const conn=mysql.createConnection(
    {
        host:"localhost",
        user:"root",
        password:"",
        database:"munkaero"
    }
);


app.listen(8000,()=>{
    console.log("A szerver működik és fut!");
});


app.get('/',(req,res)=>{
    res.send("Munkavállaló nyilvántartás projekt");
});


app.get('/becenevek',async (req,res)=>{
    becenevek(conn)
    .then(adat=>res.json(adat))
    .catch(err=>res.send(err));

});


app.get('/dolgozok',async (req,res)=>{
    dolgozok(conn)
    .then(adat=>res.json(adat))
    .catch(err=>res.send(err));
});


app.get('/munkavallalok',async (req,res)=>{
    munkavallalok(conn)
    .then(adat=>res.json(adat))
    .catch(err=>res.send(err));
});


app.post('/ujbecenev',async (req,res)=>{
    ujbecenev(conn,req.body.becenev)
    .then(adat=>res.json(adat))
    .catch(err=>res.send(err));
});


app.patch('/modositbecenev',async (req,res)=>{
    modositbecenev(conn,req.body)
    .then(adat=>res.json(adat))
    .catch(err=>res.send(err));
});


app.delete('/torolbecenev',async (req,res)=>{
    torolbecenev(conn,req.body.id)
    .then(adat=>res.json(adat))
    .catch(err=>res.send(err));
});


app.get('/elerhetoseg',async (req,res)=>{
    elerhetoseg(conn)
    .then(adat=>res.json(adat))
    .catch(err=>res.send(err));
});
