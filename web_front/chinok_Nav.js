import { Link } from "react-router-dom";

function Nav() {
  return (
    <div className="navbar bg-lime-500">
    <div className="flex-1">
      <Link to={"/"} className="btn btn-ghost normal-case text-xl">Zenei portál</Link>
    </div>
    <div className="flex-none">
      <ul className="menu menu-horizontal p-0">
        <li><Link to={"/artists"}>Előadok</Link></li>
        <li><Link to={"/artists"}>Albumok</Link></li>
      </ul>
    </div>
  </div>
  );
}

export default Nav;