import {useEffect, useState} from 'react'; 
import {useLocation, Link} from 'react-router-dom';

function Albums({}) {

    let location = useLocation();
    let artist=location.userProps.artistName;


const   [albums, setAlbums] = useState([]);
    useEffect (()=>{},[]);

    fetch (`http://localhost:8000/artist-albums/${artist}`)
        .then (res=>res.json())
        .then (albumdata=>setAlbums(albumdata))
        .catch (err=>console.log (err))

},[];
  return (
   
   <div>Ex est cupidatat incididunt incididunt et qui quis excepteur.</div>
   

  )


export default Albums