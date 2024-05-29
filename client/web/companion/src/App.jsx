import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
// import { } from "@/layouts";
import {
  SignIn,
  SignUp,
  Dashboard,
  ProtectedRoute,
  SharedLayout,
  Projects,
} from "./pages";
// import { ToastContainer } from "react-toastify";
// import "react-toastify/dist/ReactToastify.css";
import { useState, useEffect } from "react";

function App() {
  const [user, setUser] = useState(null);
  const [projects, setProjects] = useState([]);
  // const [user, setUser] = useState({
  //   profile_url_compress: "",
  //   first_name: "Will",
  //   last_name: "Smith",
  //   field: "App Developer",
  //   user_desc: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic",
  //   skills: ["HTML", "CSS", "JavaScript", "React", "Node.js"],
  //   projects: [
  //     {
  //       project_id: "1",
  //       project_name: "Project 1",
  //       project_desc:
  //         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic",
  //     },
  //   ],
  // });

  // const fetch = async () => {
  //   const data = await fetchUserById("FvQAbthDClac737BMMzMGfa72UF3");
  //   console.log(data);
  //   const data2 = await fetchProjects();
  //   setUser(data[0]);

  //   // setProjects(
  //   //   data2.filter(
  //   //     (proj) => proj.project_owner_id === "FvQAbthDClac737BMMzMGfa72UF3",
  //   //   ),
  //   // );
  // };

  // useEffect(() => {
  //   fetch();
  // }, []);

  console.log("lol");
  console.log(user);

  return (
    <>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<SharedLayout />}>
            {/* <Route index element={<div>Home</div>} /> */}
            <Route
              index
              element={
                <ProtectedRoute user={user}>
                  <Dashboard user={user} projects={projects} />
                </ProtectedRoute>
              }
            />

            <Route
              path="projects"
              element={
                <ProtectedRoute user={user}>
                  <Projects projects={projects} />
                </ProtectedRoute>
              }
            />

            <Route
              path="sign-in"
              element={
                <SignIn
                  user={user}
                  setUser={setUser}
                  setProjects={setProjects}
                />
              }
            />

            <Route path="sign-up" element={<SignUp />} />

            {/* <Route path="/auth/*" element={<Auth />} /> */}
            {/* <Route
              path="*"
              element={<Navigate to="dashboard/home" replace />}
            /> */}
          </Route>
        </Routes>
        {/* <ToastContainer /> */}
      </BrowserRouter>
    </>
  );
}

export default App;
