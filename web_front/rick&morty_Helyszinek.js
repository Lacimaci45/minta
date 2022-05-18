import {useState, useEffect} from 'react';

// 2022_01_10 Helyszinek.js+
function Helyszinek(){

    const [helyszinek, setHelyszinek]=useState([]);
    const [info, setInfo]=useState({});
    const [page, setPage]=useState(1);

    useEffect(()=>{
        fetch(`https://rickandmortyapi.com/api/location?page:${page}`)
        .then(res=>res.json())
        .then(adatok=>{
            setHelyszinek(adatok.results);
            setInfo(adatok.info);
        });
    },[page]);

    return (
        
        <div>

        <h1>Helyszínek</h1>
        
        {helyszinek.map((elem,index)=>(
            <div key={index}>
                <h3>{elem.name}</h3>
                <p>{elem.type},{elem.dimension}</p>
                <ul>{elem.residents.map((elem)=>(<li><a href={elem}>{elem}</a></li>))}</ul>
            </div>
           ))}

        </div>
    );
}

export default Helyszinek;