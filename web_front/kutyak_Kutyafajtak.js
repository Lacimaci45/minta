import {useState,useEffect} from 'react';
function Kutyafajtak(){
    const[kutyafajtak,setKutyafajtak]=useState([]);
    useEffect(()=>{
        fetch('http://localhost:8000/kutyafajtak')
        .then(adatok=>adatok.json())
        .then(adatok=>setKutyafajtak(adatok))
        .catch(err=>console.log(err));
    },[]);

    return(
        <div>
        <h1>Kutyafajták</h1>
        {
            kutyafajtak.map((elem)=>(<h3> Fajta: {elem.nev}, Eredeti fajta: {elem.eredetinev} </h3>))
        }
        </div>
    );
}

export default Kutyafajtak;