// Sütik alkalmazása API felépítése

const express=require('express');
const cors=require('cors');
const cookieParser=require('cookie-parser');

const app=express();
app.use(cors());
app.use(cookieParser());

app.listen(8000,()=>{console.log("A szerver fut")});

//végpont/-ok

app.get('/',(req,res)=>{
    console.log(req.cookies);
    console.log(req.cookies.Suti2);
    res.send("Süti projekt");
});


//süti végpontok


//süti2 végpont időzítés nélkül
app.get('/suti1',(req,res)=>{
    res.cookie("Suti1","Ez a süti1 adata");
    res.send("Süti1 beállítva");
});

//süti2 végpont időzítése meddig tartson //'strict' vagy 'lax'
app.get('/suti2',(req,res)=>{
    const cookieOptions={
        maxAge:1000*60*2,
        httpOnly:true,
        sameSite:'strict',
    };
    res.cookie("Suti2","Ez a süti2 adata",cookieOptions);
    res.send("Süti2 beállítva");
});


