function Header() {
    return (
        <div className="grid sm:grid-cols-1 bg-lime-200 md:grid-cols-2 gap-4 p-4 justisy-items-stretch">
            <div className="bg-lime-500 rounded  sm:justify-self-center md:justify-self-end"><h1 class="text-2xl">Zenei adatbázis</h1></div>
            <div className="sm:justify-self-center md:justify-self-start"><p>A legnagyobb elérhető zenei adatbázis</p></div>
        </div>
    )
  }
  
  export default Header;