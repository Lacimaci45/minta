function Header({szoveg,email,href}) {
    return (
        <div>
             <h1>{szoveg}</h1>
             <h3>{email}</h3>
             <h2>{href}<a href="Homepage\JS Game\game.html">JS Játék</a></h2>
        </div>
    )
}

export default Header;
