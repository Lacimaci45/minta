

function Userdetails({user}) {
  return (
    <div className='text-center' style={{backgroundColor:"#036ED9"}}>
        <div>
            <p className='text-center'>E-mail: {user.email}</p>
        </div>

        <div>
            <img className='text-center' src={user.avatar}/>
        </div>
    </div>
  )
}

export default Userdetails;