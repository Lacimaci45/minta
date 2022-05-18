import {useState,useEffect} from 'react';

function Epizodok(){
    const[epizodok,setEpizodok]=useState([]);
    const[page,setPage]=useState(1);
    const[info,setInfo]=useState({});

    useEffect(()=>{
        fetch(`https://rickandmortyapi.com/api/episode?page:${page}`)
        .then(res=>res.json())
        .then(adatok=>{
            setEpizodok(adatok.results);
            setInfo(adatok.info);
        });
    },[page])

    return (
        <h1>Epizódok</h1>
    );
}

export default Epizodok;