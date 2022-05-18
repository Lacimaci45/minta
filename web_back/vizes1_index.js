//vizes backend felépítése / npm init -y, npm i express cors sqlite3, npm i --save-dev nodemon

//csomagok behívása
const express=require('express');
const cors=require('cors');
const sqlite3=require('sqlite3');
const db=new sqlite3.Database('./vizes.db');

//app.use alkalmazások aktiválása
const app=express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended:true}));

//szerver port + üzenet
app.listen(8000,()=>{console.log("A szerver fut")});

//végpontok
app.get('/', (req, res)=>{
    res.json({"program":"Vizes db","verzió":"1.0.7"});
});

//lekérdezés végpont1 minden adat szűrése
app.get('/igazgatosagok',(req,res)=>{
    db.all('select * from igazgatosag',
    (err,rows)=>{
        if(err){
            res.json(err);
        } else{
            res.json(rows);
        }
    });
});

//lekérdezés végpont2 kért adatok szűrése
app.get('/varosok',(req,res)=>{
    db.all('select varos, ksz1,ksz2,ksz3 from vizmerce',
    (err,rows)=>{
        if(err){
            res.json(err);
        } else{
            res.json(rows);
        }
    });
});

//lekérdezés végpont3 célzott szűrés egy adott beviteli adatra
app.get('/varosok/:varos',(req,res)=>{
    const varos=req.params.varos;
    db.all('select varos, ksz1,ksz2,ksz3 from vizmerce where varos=?',
    [varos],
    (err,rows)=>{
        if(err){
            res.json(err);
        } else{
            if(rows.length>0){
            res.json(rows);
        } else{
            res.status(404).json({message:"Nincs ilyen város az adatbázisban!"});
        }

        }
    });
});

//