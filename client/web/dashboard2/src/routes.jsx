import {
    HomeIcon,
    UserCircleIcon,
    TableCellsIcon,
    InformationCircleIcon,
    ServerStackIcon,
    RectangleStackIcon,
  } from "@heroicons/react/24/solid";
  import { Home, Profile, Tables, Notifications } from "@/pages/dashboard";
  import { SignIn, SignUp } from "@/pages/auth";
  
  const icon = {
    className: "w-5 h-5 text-inherit",
  };
  
  export const routes = [
    {
      layout: "dashboard",
      pages: [
        {
          icon: <HomeIcon {...icon} />,
          name: "dashboard",
          path: "/home",
          element: <Home />,
        },
        {
          icon: <UserCircleIcon {...icon} />,
          name: "profile",
          path: "/profile",
          element: <Profile />,
        },
        {
          icon: <TableCellsIcon {...icon} />,
          name: "projects",
          path: "/tables",
          element: <Tables />,
        },
      ],
    },
  ];
  
  export default routes;
  