module.exports.kutyanevek=function(conn){
    return new Promise((reject,resolve)=>{
        conn.query("select * from kutyanevek",(err,rows)=>{
            if(err){
                reject(err);
            } else {
                resolve(rows);
            }
        });
    });
}

module.exports.kutyafajtak=function(conn){
    return new Promise((reject,resolve)=>{
        conn.query("select * from kutyafajtak",(err,rows)=>{
            if(err){
                reject(err);
            } else {
                resolve(rows);
            }
        });
    })
}

module.exports.kutyak=function(conn){
    return new Promise((reject,resolve)=>{
        conn.query(
        "SELECT kutyak.id,fajtaid,nevid,eletkor,utolsoell,kutyanev,nev,eredetinev FROM kutyak "+
        "INNER JOIN kutyanevek ON nevid=kutyanevek.id "+
        "INNER JOIN kutyafajtak on fajtaid=kutyafajtak.id",(err,rows)=>{
            if(err){
                reject(err);
            } else {
                resolve(rows);
            }

        });
    })
}

module.exports.ujkutyanev=function(conn,kutyanev){
    return new Promise((reject,resolve)=>{
        conn.query("insert into kutyanevek (kutyanev) values(?)",[kutyanev],error=>{
            if(error){
                reject(error);
            } else {
                resolve({status:201,message:"Kutyanév beillesztve!"});
            }

        });
    });

}

module.exports.modositkutyanev=function(conn,kutyaNevAdat){
    return new Promise ((reject,resolve)=>{
        conn.query("update kutyanevek set kutyanev=? where id=?",
        [kutyaNevAdat.kutyanev,kutyaNevAdat.id],
        (error)=>{
            if (error){
                reject(error);
            } else {
                resolve({status:201,message:"Kutyanév módosítva!"});
            }
        });
    });

}

module.exports.torolkutyanev=function(conn,id){
    return new Promise ((reject,resolve)=>{
        conn.query("delete from kutyanevek where id=?",
        [id],
        (error)=>{
            if(error){
                reject(error);
            } else{
                resolve({status:201,message:"A kutyanév törölve!"});
            }
        }
        );
    });
}


//SELECT kutyak.id,fajtaid,nevid,eletkor,utolsoell,kutyanev,nev,eredetinev FROM `kutyak`
//INNER JOIN kutyanevek ON nevid=kutyanevek.id
//INNER JOIN kutyafajtak on fajtaid=kutyafajtak.id