import { FaUser, FaChevronRight, FaTable } from "react-icons/fa6";

import { fetchUserById, fetchProjects } from "../api";
import { useEffect, useState } from "react";

import logo from "../assets/images/logo.png";
import { PieChart } from "../components";
import { BarChart } from "../components/Bar";

const Dashboard = ({ className, user, projects }) => {
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

  // const [projects, setProjects] = useState([
  //   {
  //     colab_requests: [
  //       {
  //         user_message:
  //           "Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic",
  //       },
  //     ],
  //   },
  // ]);

  // const fetch = async () => {
  //   // const data = await fetchUserById("FvQAbthDClac737BMMzMGfa72UF3");
  //   // console.log(data);
  //   const data2 = await fetchProjects();
  //   setUser(data[0]);

  //   setProjects(
  //     data2.filter(
  //       (proj) => proj.project_owner_id === "FvQAbthDClac737BMMzMGfa72UF3",
  //     ),
  //   );
  // };

  // useEffect(() => {
  //   fetch();
  // }, []);
  return (
    <>
      <main className={`${className} col-span-4 grid gap-4 p-4`}>
        <section className="grid grid-cols-3 gap-4">
          <article className=" col-span-2 flex flex-col gap-4 rounded-lg bg-blue-600 p-4 text-slate-200">
            <header className=" flex items-center gap-4 border-b border-slate-200 pb-4">
              <img
                src={user.profile_url_compress}
                className=" aspect-square w-20 rounded-full bg-slate-200"
              ></img>
              <div>
                <h2 className=" text-3xl font-bold text-white">
                  {user.first_name} {user.last_name}
                </h2>
                <p className=" ">{user.field}</p>
              </div>
              <FaChevronRight className=" text-3xl" />
            </header>
            <main>
              <p className=" text-xl">{user.user_desc}</p>
            </main>
            <footer className=" grid gap-4 text-base font-bold text-white">
              <header className=" flex items-center gap-4">
                <FaUser className=" text-xl" />
                <h2>Skills</h2>
              </header>
              <main className=" flex gap-4 text-blue-600">
                {user.skills.map((skill, index) => (
                  <article
                    key={index}
                    className=" rounded-lg bg-slate-200 p-4 py-2"
                  >
                    {skill}
                  </article>
                ))}
                {/* <article>HTML</article>
            <article>HTML</article>
            <article>HTML</article> */}
              </main>
            </footer>
            <footer className=" grid gap-4 text-base font-bold text-white">
              <header className=" flex items-center gap-4">
                <FaTable className=" text-xl" />
                <h2>Projects</h2>
              </header>
              <main className=" flex gap-4 text-blue-600">
                {user.projects.map((project, index) => (
                  <article
                    key={project.project_id}
                    className=" max-w-60 rounded-lg bg-slate-200 p-4 py-2"
                  >
                    <span>{project.project_name}</span>
                    <details>{project.project_desc}</details>
                  </article>
                ))}
              </main>
            </footer>
          </article>
          <article className=" grid grid-rows-3 gap-4">
            <div className=" flex items-center justify-between gap-4 rounded-lg bg-slate-200 p-4 text-3xl font-bold">
              <span className="text-blue-600">Active Projects</span>
              <div className=" flex aspect-square w-12 items-center justify-center rounded-full bg-blue-600 font-bold text-white ">
                {projects.length}
              </div>
            </div>
          </article>
        </section>
        <section className="grid grid-cols-3 gap-4">
          <article className=" col-span-1 flex flex-col gap-4 rounded-lg bg-blue-600 p-4 text-slate-200">
            <header className=" flex items-center gap-4 border-b border-slate-200 pb-4">
              <div>
                <h2 className=" text-3xl font-bold text-white">
                  Tech Stack Distribution
                </h2>
              </div>
              <FaChevronRight className=" text-3xl" />
            </header>
            <main>
              <p className=" text-xl">
                Shows the distribution of technologies used in a project or a
                user's skills.
                <br />
                Each slice of the donut represents a technology or skill, and
                its size represents the proportion of usage.
              </p>
            </main>
            <footer>
              <PieChart {...user} />
            </footer>
          </article>
          <article className=" col-span-1 flex flex-col gap-4 rounded-lg bg-blue-600 p-4 text-slate-200">
            <header className=" flex items-center gap-4 border-b border-slate-200 pb-4">
              <div>
                <h2 className=" text-3xl font-bold text-white">
                  Skillset Contribution through Projects
                </h2>
              </div>
              <FaChevronRight className=" text-3xl" />
            </header>
            <main>
              <p className=" text-xl">
                Shows the distribution of technologies used in a project or a
                user's skills.
                <br />
                Each slice of the donut represents a technology or skill, and
                its size represents the proportion of usage.
              </p>
            </main>
            <footer>
              <BarChart {...user} className="w-9/12" />
            </footer>
          </article>
        </section>
        <section className=" flex flex-col gap-4 ">
          <header className="rounded-lg bg-blue-600 p-4">
            <h2 className=" text-2xl font-bold text-white">Colab Requests</h2>
          </header>
          <main className=" flex flex-wrap gap-4">
            {projects.map((project, index) => (
              <article className=" rounded-lg bg-slate-200 p-4">
                <header className="flex items-center gap-2">
                  <h3 className=" text-xl font-bold text-blue-600">
                    {project.project_name}{" "}
                  </h3>
                  <div className=" flex aspect-square w-6 items-center justify-center rounded-full bg-blue-600 font-bold text-white ">
                    {project.colab_requests.length}
                  </div>
                </header>
                <details>
                  {project.colab_requests.map((request) => (
                    <div className=" mb-2 rounded-lg bg-blue-600 p-2 text-white ">
                      "{request.user_message}"
                    </div>
                  ))}
                </details>
              </article>
            ))}
          </main>
        </section>
      </main>
    </>
  );
};
export default Dashboard;
