import Header from './components/Header';
import { NavLink,Switch,Redirect,BrowserRouter,Route } from 'react-router-dom';
import './App.css';
import Szereplok from './components/Szereplok';
import Helyszinek from './components/Helyszinek';
import Epizodok from './components/Epizodok';

function App() {
  return (
    <div className="container-fluid">
      <Header />
      <BrowserRouter>
      <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
        <div className="container-fluid">
          <NavLink to={'/'} className="nav-link">
          <span className="navbar-brand" href="#">Rick és Morty</span>
          </NavLink>
          
            <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
              <span className="navbar-toggler-icon"></span>
            </button>
            <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div className="navbar-nav">
             <NavLink to={'/szereplok'} className="nav-link">
            <span className="nav-link">Szereplők</span>
            </NavLink> 
            <NavLink to={'/helyszinek'} className="nav-link">
            <span className="nav-link">Helyszínek</span>
            </NavLink>
            <NavLink to={'/epizodok'} className="nav-link">
            <span className="nav-link">Epizódok</span>
            </NavLink>
            
      
            </div>
        </div>
        </div>
      </nav>
      <Switch>
        <Route path='/' exact></Route>
        <Route path='/szereplok'><Szereplok /></Route>
        <Route path='/helyszinek'><Helyszinek /></Route>
        <Route path='/epizodok'><Epizodok /></Route>
        <Redirect to={'/'} />
      </Switch>
      </BrowserRouter>
    
    
    </div>
  );
}

export default App;
