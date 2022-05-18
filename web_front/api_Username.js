

function Username({user,setDetails}) {
  return (
    <div className='text-center'>
        <p className='text-center'>Name: {user.first_name} {user.last_name} <i onClick={()=>setDetails(prev=>!prev)} className="bi bi-arrow-right-square-fill"> </i></p>
    </div>
  )
}

export default Username;