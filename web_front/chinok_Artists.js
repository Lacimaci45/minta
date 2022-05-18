import {useState,useEffect} from 'react';
import { Link } from 'react-router-dom';
import Artist from './Artist';


function Artists() {
    const[artists,setArtists]=useState([]);

    useEffect(()=>{
        fetch('http://localhost:8000/artists')
        .then(res=>res.json())
        .then(adatok=>setArtists(adatok))
        .catch(err=>console.log(err))
    },[]);


  return (

    <div className="grid sm:grid-cols-1 bg-lime-100 md:grid-cols-2 lg:grid-cols-3 gap-4 p-4 justisy-items-stretch">
         {
           artists.map((artist,index)=>(<Artist key={index} artist={artist}/>))
       }
    </div> 
  )
}

export default Artists;