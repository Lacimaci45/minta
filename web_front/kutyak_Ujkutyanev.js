import {useState} from 'react';

function Ujkutyanev() {

    const [kutyanev,setKutyanev]=useState('');

    const sendAdat=async(adat)=>{
        const res=await fetch('http://localhost:8000/ujkutyanev',
        {
            method:"POST",
            headers:{"Content-type":"Application/json"},
            body:JSON.stringify(adat)
        });

        const valasz=await res.json();
        alert(valasz.message);
    }
    const onSubmit=(e)=>{
        e.preventDefault();
        sendAdat({kutyanev});
        setKutyanev('');
    }


  return <div>
      <form onSubmit={onSubmit}>
      <div className="mb-3">
        <br></br>
        <label for="kutyanev" className="form-label">Új kutyanév</label>
        <br></br>
        <input type="text" class="form-control" id="kutyanev" placeholder="új kutyanév bevitele" onChange={(e)=>setKutyanev(e.target.value)} value={kutyanev}/>
        <br></br>
        <button type="submit">Küldés</button>
      </div>
      </form>
  </div>;
}

export default Ujkutyanev;
