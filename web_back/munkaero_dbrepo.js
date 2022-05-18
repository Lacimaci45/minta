//Promise-ok létrehozása az index.js Backend végpontjaihoz

module.exports.becenevek=function(conn){
    return new Promise((reject,resolve)=>{
        conn.query("select * from becenevek",(err,rows)=>{
            if(err){
                reject(err);
            } else {
                resolve(rows);
            }
        });
    });
}

module.exports.munkavallalok=function(conn){
    return new Promise((reject,resolve)=>{
        conn.query("select * from munkavallalok",(err,rows)=>{
            if(err){
                reject(err);
            } else {
                resolve(rows);
            }
        });
    })
}

module.exports.dolgozok=function(conn){
    return new Promise((reject,resolve)=>{
        conn.query(
        "SELECT dolgozok.id,munkavallaloid,becenevid,eletkor,belepesdatum,becenev,munkakor,eredetinev FROM dolgozok "+
        "INNER JOIN becenevek ON becenevid=becenevek.id "+
        "INNER JOIN munkavallalok ON munkavallaloid=munkavallalok.id",(err,rows)=>{
            if(err){
                reject(err);
            } else {
                resolve(rows);
            }

        });
    })
}

module.exports.ujbecenev=function(conn,becenev){
    return new Promise((reject,resolve)=>{
        conn.query("insert into becenevek (becenev) values(?)",[becenev],error=>{
            if(error){
                reject(error);
            } else {
                resolve({status:201,message:"Becenév sikeresen beillesztve!"});
            }

        });
    });

}

module.exports.modositbecenev=function(conn,beceNevAdat){
    return new Promise ((reject,resolve)=>{
        conn.query("update becenevek set becenev=? where id=?",
        [beceNevAdat.becenev,beceNevAdat.id],
        (error)=>{
            if (error){
                reject(error);
            } else {
                resolve({status:201,message:"Becenév sikeresen módosítva!"});
            }
        });
    });

}

module.exports.torolbecenev=function(conn,id){
    return new Promise ((reject,resolve)=>{
        conn.query("delete from becenevek where id=?",
        [id],
        (error)=>{
            if(error){
                reject(error);
            } else{
                resolve({status:201,message:"Becenév sikeresen törölve lett!"});
            }
        }
        );
    });
}

module.exports.elerhetoseg=function(conn){
    return new Promise((reject,resolve)=>{
        conn.query("select * from elerhetoseg",(err,rows)=>{
            if(err){
                reject(err);
            } else {
                resolve(rows);
            }
        });
    });
}

