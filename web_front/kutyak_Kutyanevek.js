import {useState,useEffect} from 'react';
import Kutyanev from './Kutyanev';

function Kutyanevek() {
    const [kutyanevek,setKutyanevek]=useState([]);
    const [refresh,setRefresh]=useState(false);
    
    useEffect(()=>{
        fetch('http://localhost:8000/kutyanevek')
        .then(adat=>adat.json())
        .then(adat=>setKutyanevek(adat))
        .catch(err=>console.log(err));
    },[refresh]);
    return (
        <div>
            <h1>Kutyanevek</h1>
            
            {
                kutyanevek.map((elem,index)=>(<Kutyanev key={index} elem={elem} setRefresh={setRefresh}/>))
            }
        </div>
    )
}

export default Kutyanevek;
