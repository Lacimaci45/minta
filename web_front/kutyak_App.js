import Header from './components/Header';
import Kutyanevek from './components/Kutyanevek';
import Kutyafajtak from './components/Kutyafajtak';
import Kutyak from './components/Kutyak';
import Ujkutyanev from './components/Ujkutyanev';
import Footer from './components/Footer';

import {BrowserRouter,NavLink,Switch,Route, Redirect} from 'react-router-dom';

import './App.css';

function App() {
  return (
  <div className="container" >
   
     <Header szoveg="Állatorvosi rendelés" email="doki@doki.hu" href="JS Game"/>
     <BrowserRouter>
     <nav className="navbar navbar-expand-lg navbar-light bg-light">
       <div className="container-fluid">
    
        <NavLink to={'/'} className="navbar-brand">Állatorvosi rendelő</NavLink>
         <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
         <span className="navbar-toggler-icon"></span>
         </button>
       <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
       <div className="navbar-nav">
        <NavLink to={'/kutyanevek'} className="nav-link">Kutyanevek</NavLink>
        <NavLink to={'/kutyafajtak'} className="nav-link">Kutyafajták</NavLink>
        <NavLink to={'/vizsgalatok'} className="nav-link">Kutya vizsgálatok</NavLink>
        <NavLink to={'/ujkutyanev'} className="nav-link">Új kutyanév felvitele</NavLink>    
        
       </div>
     </div>
   </div>
   </nav>
   <Switch>
    <Route path='/' exact></Route>
    <Route path='/kutyanevek'><Kutyanevek /></Route>
    <Route path='/kutyafajtak'><Kutyafajtak /></Route>
    <Route path='/vizsgalatok'><Kutyak /></Route>
    <Route path='/ujkutyanev'><Ujkutyanev /></Route>
    <Redirect to={'/'} />
   </Switch>
   </BrowserRouter> 
   <br></br>
   <br></br>
   <br></br>
   <br></br>
   <br></br>
   <div class="A1">
   <Footer style="background-color:DodgerBlue" szoveg="Készítette:" email="Szabó László" href="&copy; 2022 Project"/>
   </div>

  </div>
);
}

export default App;
