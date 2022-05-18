function SzereploCard({elem}) {
    return (
        <div>
            <div className="card mb-3" style={{ "max-width":540 }}>
  <div className="row g-0">
    <div className="col-md-4">
      <img src={elem.image} className="img-fluid rounded-start" alt="..."></img>
    </div>
    <div className="col-md-8">
      <div className="card-body">
        <h5 className="card-title">Name:{elem.name}</h5>
        <p className="card-text">Species:{elem.species}</p>
        <p className="card-text">Status:{elem.status}</p>
        <p className="card-text">Gender:{elem.gender}</p>
        <p className="card-text"><small className="text-muted">{elem.origin.name}</small></p>
      </div>
    </div>
  </div>
</div>
        </div>
    )
}

export default SzereploCard;
