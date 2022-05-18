const express=require('express');
const cors=require('cors');
const mysql=require('mysql');
const app=express();
const {kutyanevek,kutyafajtak,kutyak,ujkutyanev,modositkutyanev,torolkutyanev} =require('./dbrepo.js');

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended:true}));


const conn=mysql.createConnection(
    {
        host:"localhost",
        user:"root",
        password:"",
        database:"kutyak"
    }
);


app.listen(8000,()=>{
    console.log("A szerver fut");
});


app.get('/',(req,res)=>{
    res.send("Állatorvosi rendelő");
});


app.get('/kutyanevek',async (req,res)=>{
    kutyanevek(conn)
    .then(adat=>res.json(adat))
    .catch(err=>res.send(err));

});


app.get('/kutyak',async (req,res)=>{
    kutyak(conn)
    .then(adat=>res.json(adat))
    .catch(err=>res.send(err));
});



app.get('/kutyafajtak',async (req,res)=>{
    kutyafajtak(conn)
    .then(adat=>res.json(adat))
    .catch(err=>res.send(err));
});


app.post('/ujkutyanev',async (req,res)=>{
    ujkutyanev(conn,req.body.kutyanev)
    .then(adat=>res.json(adat))
    .catch(err=>res.send(err));
});


app.patch('/modositkutyanev',async (req,res)=>{
    modositkutyanev(conn,req.body)
    .then(adat=>res.json(adat))
    .catch(err=>res.send(err));
});


app.delete('/torolkutyanev',async (req,res)=>{
    torolkutyanev(conn,req.body.id)
    .then(adat=>res.json(adat))
    .catch(err=>res.send(err));
});
