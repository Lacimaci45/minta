//JS felépítése SQL adatbázis fogadására

const express=require('express'); //behívja az expresst
const cors=require('cors'); 
const app=express();

const sqlite3=require('sqlite3'); // behívja az SQL nyelvet
const db=new sqlite3.Database('./autok.db'); // behívja az sql doksit 
//const db_alldata  = require('./dbfunc');

app.use(cors()); //függvény miatt kell a zárójel, behívja a cors-ot
app.use(express.urlencoded({extended:true})); //behívja az urlencoded-et
app.use(express.json()); // behívja a JSON fájlt

app.listen(8000,()=>{
    console.log('A szerver fut')
}); // X számú protú szerver kiválasztása, ahol futni fog a program

app.get('/',(req,res)=>{
    res.send('<h1>Üdvözöl az autók adatbázis szervere!</h1>');
}); // első végpont, ha beírja elsőkét a címet

//1, 127.0.0.1:8000 böngészőbe beírva


//SQL lekérdezés aktiválása

app.get('/alldata',(req,res)=>{
    db.all("select * from autok",(error,rows)=>{
        if(error){
            res.send(error);
        } 
        else {
            res.json(rows);
        }

    });
});

// 2, 127.0.0.1:8000/alldata 


// Új adat felvitele

app.post('/ujauto',(req,res)=>{ //végpont adat létrehozás
    db.run("insert into autok values(?,?,?,?,?)", 
    [req.body.rendszam, 
     req.body.marka, 
     req.body.tipus, 
     req.body.szin, 
     req.body.gyartasiev],
    error=>{
        if(error){
            res.send(error);
        } else {
            res.status(200).json({status:"Ok",message:'Adatok beszúrva'});
        }
    });
});

// API parancsok SQL-ben 
// Get= select/ Post =insert / Put-Patch= update
