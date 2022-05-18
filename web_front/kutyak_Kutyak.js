import {useState,useEffect} from 'react';
function Kutyak() {
  const [kutyak,setKutyak]=useState([]);
  useEffect(()=>{
    fetch('http://localhost:8000/kutyak')
    .then(adatok=>adatok.json())
    .then(adatok=>setKutyak(adatok))
    .catch(err=>console.log(err));

  },[]);
  return <div>
      <h1>Kutya adatok</h1>
      {
        kutyak.map((elem)=>(<h4> Életkor: {elem.eletkor}, Ellenőrzés dátuma: {elem.utolsoell}, Név: {elem.kutyanev}, Fajta: {elem.nev}</h4>))
      }
  </div>;
}

export default Kutyak;


