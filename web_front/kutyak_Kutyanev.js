import {useState} from 'react';

function Kutyanev({elem,setRefresh}) {
    const [formON,setFormOn]=useState(false);
    const [kutyanev,setKutyanev]=useState(elem.kutyanev);

    const sendAdat=async(adat)=>{
        const res=await fetch('http://localhost:8000/modositkutyanev',
        {
            method:"PATCH",
            headers:{"Content-type":"application/json"},
            body:JSON.stringify(adat)
        });

        const valasz=await res.json();
        alert(valasz.message);
    }

    const kutyanevTorles=async(id)=>{
        const res=await fetch('http://localhost:8000/torolkutyanev',
        {
            method:"DELETE",
            headers:{"Content-type":"application/json"},
            body:JSON.stringify(id)
        });

        const valasz=await res.json();
        if(valasz.sqlMessage){
            alert("A név nem törölhető, mert"+valasz.sqlMessage);
        } else {
            alert(valasz.message);
        }
        setRefresh(prev=>!prev);
    }


    const onSubmit=(e)=>{
        e.preventDefault();
        sendAdat({"id":elem.id, "kutyanev":kutyanev});
        setRefresh(prev=>!prev);
    }

  return (<div>

        {!formON ? 
        <h4>{elem.kutyanev}
        <br></br>  
        <span 
            onClick={()=>setFormOn(prev=>!prev)} 
            className="badge rounded-pill bg-primary">
                Módosítás
        </span>
        <span 
            onClick={()=>kutyanevTorles({"id":elem.id})}
            className="badge rounded-pill bg-danger">
                Törlés
        </span>
        <br></br>  
        </h4>

        :

        <div>
        <span 
        onClick={()=>setFormOn(prev=>!prev)} 
        className="badge rounded-pill bg-primary">
            Vissza
        </span> 
        <br></br>  
        <form onSubmit={onSubmit}>
        <br></br> 
        <div className="mb-3">
             <label for="kutyanev" className="form-label">
                 Kutyanév módosítás
             </label>
             <br></br> 
             <input 
             type="text" 
             class="form-control" 
             id="kutyanev" 
             placeholder="új kutyanév" 
             onChange={(e)=>setKutyanev(e.target.value)} 
             value={kutyanev}
             />
             <br></br> 
             <button type="submit">Küldés</button>
        </div>
        </form>
        </div>
        } 

        
  </div>);
}

export default Kutyanev;
