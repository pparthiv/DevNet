import { NavLink } from "react-router-dom";
import { navLinks } from "../constants";

const Sidebar = ({ className }) => {
  return (
    <aside
      className={`${className} flex grow rounded-lg p-4 outline outline-1 bg-gradient-to-b from-gray-100 to-gray-300 shadow-xl`}
    >
      <ul className="flex grow flex-col gap-4">
        {navLinks.map(({ id, title, icon: Icon, path }) => (
          <li key={id}>
            <NavLink
              to={path}
              className={({ isActive }) =>
                `flex items-center gap-2 rounded-lg p-4 transition duration-300 ${
                  isActive ? "bg-blue-600 text-white shadow-lg" : "hover:bg-gray-400 hover:text-gray-900"
                }`
              }
            >
              <Icon className="text-xl" /> <span>{title}</span>
            </NavLink>
          </li>
        ))}
      </ul>
    </aside>
  );
};

export default Sidebar;
