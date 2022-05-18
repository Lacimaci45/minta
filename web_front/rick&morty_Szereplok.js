import {useState,useEffect} from 'react';
import SzereploCard from './SzereploCard';

function Szereplok(){
    const [szereplok,setSzereplok]=useState([]);
    const [page,setPage]=useState(1);

    useEffect(()=>{
        fetch(`https://rickandmortyapi.com/api/character?page=${page}`)
        .then(result=>result.json())
        .then(adatok=>setSzereplok(adatok.results));
    },[page]);

    const forwardClick=()=>{
        setPage(prev=>prev+1);
    }

    const backClick=()=>{
        if(page>1){
            setPage(prev=>prev-1);
        }
    }


    return (
        <>
        <h1>Szereplők</h1>
        <h1><i onClick={backClick} className="bi bi-backspace-fill"></i><i onClick={forwardClick} className="bi bi-backspace-reverse-fill"></i></h1>      
        {szereplok.map((elem,index)=>(<SzereploCard key={index} elem={elem} />))}

        </>
    );
}

export default Szereplok;