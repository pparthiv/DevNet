import { Sidebar } from "../components";
import { Outlet } from "react-router-dom";

const SharedLayout = () => {
  return (
    <div className=" grid min-h-screen grid-cols-5 gap-4 p-4">
      <Sidebar className={"col-span-1"} />
      <Outlet className=" col-span-4" />
    </div>
  );
};
export default SharedLayout;
