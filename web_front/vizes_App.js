//React Responsive felépítése 
//terminal: npx create-react-app ./ npm i react-router-dom@5.3.0
//terminal: npm install -D tailwindcss postcss autoprefixer/ npx tailwindcss init
//terminal: npm i daisyui

//index.css módosítása, postcss.config.js létrehozása, tailwind.config.js
//npm run build ---> Web Server létrehozása

import Header from "./components/Header";
import './index.css';
import Main from "./components/Main";
import Menu from "./components/Menu";
import Vizallasok from "./components/Vizallasok";
import Varosok from "./components/Varosok";
import {BrowserRouter,Switch,Redirect,Route} from "react-router-dom"


function App() {
  return (
    <div className="bg-sky-800">
      <Header/>
      <BrowserRouter>
      <Menu/>
      <Switch>
        <Route path='/' exact><Main/></Route>
        <Route path='/varosok'><Varosok/></Route>
        <Route path='/vizallas'><Vizallasok/></Route>
        <Redirect to={'/'}/>
      </Switch>
      </BrowserRouter>         
    </div>
  );
}

export default App;
