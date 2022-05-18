import Header from "./components/Header";
import Nevek from "./components/Nevek";
import Szarmazas from "./components/Szarmazas";
import './index.css';
import {BrowserRouter} from "react-router-dom"



function App() {
  return (
    <div className="bg-sky-800">
      <br></br>
      <Header/>
      <BrowserRouter>
      <h1 className="flex flex-row flex-wrap bg-sky-800 items-center justify-center text-center p-2">
       Genderizer from a given name:
      </h1>
      <Nevek/>
      <h1 className="flex flex-row flex-wrap bg-sky-800 items-center justify-center text-center p-2">
       Nationalizer from a given name:
      </h1>
      <Szarmazas/>
      </BrowserRouter>         
    </div>
  );
}

export default App;
