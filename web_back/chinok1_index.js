const express=require('express');
const cors=require('cors');
const sqlite3=require('sqlite3');
const db=new sqlite3.Database('./chinook.db');
const app=express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended:true}));

app.listen(8000,()=>{console.log("A szerver fut")});

app.get('/',(req,res)=>{
    res.json("Chinok adatbázis");
});


// 14/D 2022.05.12

app.get('/artists',(req,res)=>{
    db.all("select * from artists"
    ,(error,rows)=>{
        if(error){
            res.status(400).json(error);
        }
        res.status(200).json(rows);

    });
});

app.get('/genres',(req,res)=>{
    db.all("select * from genres"
    ,(error,rows)=>{
        if(error){
            res.status(400).json(error);
        }
        res.status(200).json(rows);

    });

});

app.post('/genres',(req,res)=>{
    const name=req.body.name;
    db.run("insert into genres (Name) values(?)"
    ,[name]
    ,function (error){
        if(error){
            res.status(400).json(error.message);
        }
        console.log(this.lastID);
      
        res.status(201).json({message:"Beszúrás rendben "+this.lastID});
        

    });
});

app.delete('/genres/:id',(req,res)=>{
    const id=req.params.id;
    db.run("delete from genres where GenreId=?"
    ,[id]
    ,function (error){
        
        if(error){
            res.status(404).json(error.message);
        }  
       
        if(this.changes==0){
            res.status(200).json({message:"Nincs ilyen kategória"});
        } else {
            res.status(204).send(`Törölve`);
        }

    });

});

app.get('/artist-albums/:artist',(req,res)=>{
    const artist=req.params.artist;

    db.all("select Title from albums,artists where albums.ArtistId=artists.ArtistId and artists.Name=?"
    ,[artist]
    ,(error,rows)=>{
        if(error){
            res.status(400).json(error.message);
        }
        if(rows.length>0){
            res.status(200).json(rows);     
        } else {
            res.status(200).json({message:"Nincs ilyen előadó"});     
        }                       
            
    });
});


// 14/GE 2022.05.14

//GET lekérdezás
app.get('/media',(req,res)=>{
    db.all("select * from media_types"
    ,(error,rows)=>{
        if(error){
            res.json(error);
        } else{
            if(rows.length>0){
                res.json(rows);
            } else {
                res.json("A tábla üres!");
            }
        }
    });
});

// POST mintára lehet megírni a PUT/PATCH-et az adatmódosításra
app.post('/media',(req,res)=>{
    db.run("insert into media_types (Name) values (?)"
    ,[req.body.name]
    ,function (error){
        if(error){
            res.json(error);
        } else{
            res.status(201).json("Adat beszúrva"+this.lastID);
        }
    });
});

//DELETE törlés
app.delete('/media/:id',(req,res)=>{
    const id=req.params.id;
    db.run("delete from media_types where MediaTypeId=?"
    ,[id]
    ,function (error){
        if(error){
            res.json(error);
        }  
       
         else {
            if(this.changes==0){
                res.status(200).json({message:"Nincs ilyen média típus!"});
            } else {
                res.status(200).send(`A média típus sikeresen törölve lett!`);
            }
        }
    });
});

//GET lekérdezés célzottan
app.get('/artist',(req,res)=>{
    db.all("select * from artists"
    ,(error,rows)=>{
        if(error){
            res.json(error);
        } else{
            if(rows.length>0){
                res.json(rows);
            } else {
                res.json("A tábla üres!");
            }
        }
    });
});