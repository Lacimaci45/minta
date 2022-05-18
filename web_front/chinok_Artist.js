
function Artist({artist}) {
    return (

        <div className="grid sm:grid-cols-1  md:grid-cols-2 lg:grid-cols-3 gap-4 p-4 justisy-items-stretch m-5 justify-self-center">
            <div className="card w-96 bg-lime-300 shadow-xl">
                <div className="card-body bg-lime-300">
                    <h2 className="card-title">{artist.Name}</h2>
                    <p>zenekar</p>
                </div>
            </div>
        </div>

    )
  }
  
  export default Artist;