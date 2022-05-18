

function Varos({elem}) {
  return (
    <div className="justify-self-center rounded-full">
        <div className="card w-96 bg-sky-200 text-sky-700 shadow-xl rounded-full">
            <div className="card-body rounded-full">
                <h2 className="card-title rounded-full">{elem.varos}</h2>
                <p>Elsőfokú készültség: {elem.ksz1} cm</p>
                <p>Másodfokú készültség: {elem.ksz2} cm</p>
                <p>Harmadfokú készültség: {elem.ksz3} cm</p>
            </div>
        </div>
    </div>
  )
}

export default Varos;