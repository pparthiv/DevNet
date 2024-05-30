import { FaUser, FaChevronRight, FaTable } from "react-icons/fa6";
import { fetchUserById, fetchProjects } from "../api";
import { useEffect, useState } from "react";
import logo from "../assets/images/logo.png";
import { PieChart } from "../components";
import { BarChart } from "../components/Bar";
import { FaArrowRight } from "react-icons/fa";
import { toast } from "react-toastify";

const Dashboard = ({ className, user, projects }) => {
  const handleRefresh = () => {
    window.location.reload();
    toast.success("User Logged Out Successfully !!", { position: "top-center" });
  };

  return (
    <main className={`${className} col-span-4 grid gap-4 p-4 bg-gray-100`}>
      <section className="grid grid-cols-3 gap-4">
        <article className="col-span-2 flex flex-col gap-4 rounded-lg bg-gradient-to-r from-blue-500 to-purple-600 p-4 text-slate-200 shadow-xl transition-transform transform hover:scale-105">
          <header className="flex items-center gap-4 border-b border-slate-200 pb-4">
            <img
              src={user.profile_url_compress}
              className="aspect-square w-20 rounded-full bg-slate-200"
              alt={`${user.first_name} ${user.last_name}`}
            />
            <div className="flex-1">
              <h2 className="text-3xl font-bold text-white">
                {user.first_name} {user.last_name}
              </h2>
              <p>{user.field}</p>
            </div>
            <FaChevronRight className="text-3xl" />
            <button
              onClick={handleRefresh}
              className="ml-auto flex items-center gap-2 rounded bg-white p-2 text-blue-600 hover:bg-blue-100 transition"
              
            >
              <span>Logout</span>
            </button>
          </header>
          <main>
            <p className="text-xl">{user.user_desc}</p>
          </main>
          <footer className="grid gap-4 text-base font-bold text-white">
            <header className="flex items-center gap-4">
              <FaUser className="text-xl" />
              <h2>Skills</h2>
            </header>
            <main className="flex gap-4 text-blue-600 flex-wrap">
              {user.skills.map((skill, index) => (
                <article
                  key={index}
                  className="rounded-lg bg-gray-200 p-4 transition duration-300 hover:bg-green-600 hover:text-white hover:scale-105"
                >
                  {skill}
                </article>
              ))}
            </main>
          </footer>
        </article>
        <article className="flex flex-col gap-4">
          <section className="flex flex-col gap-4">
            <header className="flex items-center justify-between rounded-lg bg-gradient-to-r from-blue-500 to-purple-600 p-4 shadow-lg transition-transform transform hover:scale-105">
              <h2 className="text-2xl font-bold text-white">Active Projects</h2>
              <div className="flex aspect-square w-12 items-center justify-center rounded-full bg-white font-bold text-blue-600">
                {projects.length}
              </div>
            </header>
            <main className="grid gap-4 text-base font-bold text-blue-600">
              {projects.map((project, index) => (
                <article
                  key={project.project_id}
                  className="rounded-lg bg-white p-4 shadow-md transition duration-300 hover:shadow-lg hover:scale-105"
                >
                  <header className="flex items-center gap-2">
                    <h3 className="text-xl font-bold text-blue-600">
                      {project.project_name}
                    </h3>
                  </header>
                  <details>
                    <summary className="cursor-pointer text-blue-600">
                      Details
                    </summary>
                    <div className="mt-2 rounded-lg bg-blue-100 p-2 text-blue-800">
                      {project.project_desc}
                    </div>
                  </details>
                </article>
              ))}
            </main>
          </section>
          <section className="flex flex-col gap-4">
            <header className="rounded-lg bg-gradient-to-r from-blue-500 to-purple-600 p-4 shadow-lg transition-transform transform hover:scale-105">
              <h2 className="text-2xl font-bold text-white">Colab Requests</h2>
            </header>
            <main className="flex flex-wrap gap-4">
              {projects.map((project, index) => (
                <article
                  className="rounded-lg bg-white p-4 shadow-md transition duration-300 hover:shadow-lg hover:scale-105"
                  key={index}
                >
                  <header className="flex items-center gap-2">
                    <h3 className="text-xl font-bold text-blue-600">
                      {project.project_name}
                    </h3>
                    <div className="flex aspect-square w-6 items-center justify-center rounded-full bg-blue-600 font-bold text-white">
                      {project.colab_requests.length}
                    </div>
                  </header>
                  <details>
                    {project.colab_requests.map((request, idx) => (
                      <div
                        className="mb-2 rounded-lg bg-blue-100 p-2 text-blue-800"
                        key={idx}
                      >
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

      <section className="flex flex-col gap-6 md:flex-row">
        <article className="flex flex-1 flex-col gap-6 rounded-lg bg-gradient-to-r from-blue-500 to-purple-600 p-6 text-slate-200 shadow-lg transition-transform transform hover:scale-105">
          <header className="flex items-center gap-4 border-b border-slate-200 pb-4">
            <div>
              <h2 className="text-3xl font-bold text-white">
                Tech Stack Distribution
              </h2>
            </div>
          </header>
          <main>
            <p className="text-xl">
              Illustrates the proportion of various technologies used.
            </p>
          </main>
          <footer className="flex h-full items-center justify-center text-base font-bold text-white">
            <div className="h-full w-full">
              <PieChart {...user} />
            </div>
          </footer>
        </article>

        <article className="flex flex-1 flex-col gap-6 rounded-lg bg-gradient-to-r from-blue-500 to-purple-600 p-6 text-slate-200 shadow-lg transition-transform transform hover:scale-105">
          <header className="flex items-center gap-4 border-b border-slate-200 pb-4">
            <div>
              <h2 className="text-3xl font-bold text-white">
                Skillset Contribution through Projects
              </h2>
            </div>
          </header>
          <main>
            <p className="text-xl">
              Highlights the significance of different skills across multiple projects.
            </p>
          </main>
          <footer className="flex h-full items-center justify-center text-base font-bold text-white">
            <div className="h-full w-full">
              <BarChart {...user} />
            </div>
          </footer>
        </article>
      </section>
    </main>
  );
};

export default Dashboard;
