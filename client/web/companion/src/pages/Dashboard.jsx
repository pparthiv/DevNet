import { FaUser, FaChevronRight, FaTable } from "react-icons/fa6";

import { fetchUserById, fetchProjects } from "../api";
import { useEffect, useState } from "react";

import logo from "../assets/images/logo.png";
import { PieChart } from "../components";
import { BarChart } from "../components/Bar";
import { FaArrowRight } from "react-icons/fa";

const Dashboard = ({ className, user, projects }) => {
  return (
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
                  className=" rounded-lg bg-gray-200 p-4 transition duration-300 hover:bg-green-600 hover:text-white"
                >
                  {skill}
                </article>
              ))}
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
          <section className="flex gap-20 justify-end">
        <header className="rounded-lg bg-blue-600 p-4">
          <h2 className=" text-2xl font-bold text-white">Colab Requests</h2>
        </header>
        <FaArrowRight className="mt-11 text-center text-6xl"/>
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
          </header>
          <main>
            <p className=" text-xl text-center">Illustrates the proportion of various technologies utilized in a project's development.</p>
          </main>
          <footer className=" grid gap-4 text-base font-bold text-white">
            <PieChart {...user}/>
          </footer>          
        </article>
        <article className=" col-span-1 flex flex-col gap-6 rounded-lg bg-blue-600 text-slate-200 overflow-hidden p-4 text-center">
          <header className=" flex items-center gap-4 border-b border-slate-200 pb-4">
            <div>
              <h2 className=" text-3xl font-bold text-white">
              Skillset Contribution through Projects
              </h2>
            </div>
          </header>
          <main>
            <p className=" text-xl">Highlights the significance of current different skills across multiple projects.</p>
          </main>
          <footer className=" grid gap-4 text-base font-bold text-white">
            <BarChart {...user}/>
          </footer>          
        </article>
      </section>
    </main>
  );
};

export default Dashboard;
