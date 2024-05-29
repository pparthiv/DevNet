import { NavLink } from "react-router-dom";
// import { FaHome } from "react-icons/fa";
import { navLinks } from "../constants";

const Sidebar = ({ className }) => {
  return (
    <aside
      className={`${className} flex grow rounded-lg p-4 outline outline-1`}
    >
      <ul className=" flex grow flex-col gap-4 ">
        {navLinks.map(({ id, title, icon: Icon, path }) => (
          <li key={id}>
            <NavLink
              to={path}
              className={({ isActive }) =>
                `flex items-center gap-2 rounded-lg ${isActive && "bg-black text-white"} p-4`
              }
            >
              <Icon /> <span>{title}</span>
            </NavLink>
          </li>
        ))}
      </ul>
    </aside>
  );
};
export default Sidebar;
