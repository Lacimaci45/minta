import Username from "./Username";
import Userdetails from "./Userdetails";
import {useState} from "react";

function User({user}) {
  const[details,setDetails]=useState(false);

/* Második elágazás megoldása

if (!details){
    return( <Username user={user} setDetails={setDetails}/>);
}

return (<div>
    <Username user={user} setDetails={setDetails}/>    
    <Userdetails user={user}/>
    </div>);
*/

//Első elágazás megoldás 
  return (
    <div className='text-center'>
        {
            
            !details ? 
            <div>
            
            <Username user={user} setDetails={setDetails}/>
            
            </div> 
            : 
            <div>
            <p>--------------------------------------</p>
            <Username user={user} setDetails={setDetails}/>    
            <Userdetails user={user}/>
            <br></br>
            <p>--------------------------------------</p>
            </div>
        }
    </div>
  )
}

export default User;