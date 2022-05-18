import React, { useEffect, useState } from "react";

function Szarmazas() {

  const [apiFetch, setApiFetch] = useState([]);
  const [name, setName] = useState("");

  useEffect(() => {
    fetch(`https://api.nationalize.io/?name=${name}`)
      .then((res) => res.json())
      .then((data) => {
        console.log(data);
        setApiFetch(data);
      });
  }, [name]);



  function handleChange(event) {
    setName(event.target.value);
  }

  return (
    <div className="bg-sky-600 items-center justify-center text-center p-2">
      <form className="">
        <input onChange={handleChange} />
      </form>
      
      {apiFetch ? (
        <ul>
          <li>The name: {apiFetch.name}</li>
          <li>The nation: {apiFetch.country_id}</li>
          <li>The probability: {apiFetch.probability}</li>
        </ul>
      ) : (
        <p>We didnt fetch anything yet</p>
      )}
      {name ? <div>{name}</div> : <div>We need a name!</div>}
    </div>
  );
}
  

export default Szarmazas;