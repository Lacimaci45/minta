// Kliens JS az új SQL adat elküldéséhez

const fetch=require('cross-fetch'); // a fetch asyncron képes működni, ezért kell async függvény

const ujauto={
    rendszam:"zqk-630",
    marka:"Opel",
    tipus:"Corsa",
    szin:"zöld",
    gyartasiev:2006
}

async function ujadat(){

    const res=await fetch('http://127.0.0.1:8000/ujauto',{ // behívja a végpontot és elküldi az adatokat, erre kap egy választ
        method:'post',
        headers:{'Content-type':'application/json'},
        body:JSON.stringify(ujauto)
    });

    const valasz=await res.json(); // üzenet jön

    console.log(valasz);

}


ujadat(); // függvény meghívása

//  127.0.0.1:8000/alldata 
// + jellel új terminál nyitás utána node client.js + enter (beillesztésre kerül az új adat a szerver)