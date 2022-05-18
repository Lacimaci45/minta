function Vizallas({elem}) {
  return (
    <div className="justify-self-center rounded-full">
        <div className="card w-96 bg-sky-200 text-sky-700 shadow-xl rounded-full">
            <div className="card-body rounded-full">
                <h2 className="card-title rounded-full">{elem.vizAllas}</h2>
                <p>Dátum: {elem.nap}</p>
                <p>Idő: {elem.ido}</p>
            </div>
        </div>
    </div>
  )
}

export default Vizallas;