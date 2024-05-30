import { useEffect, useState } from "react";
import { fetchProjectById } from "../api";

const Projects = ({ projects, owned_projects }) => {
  return (
    <div className="col-span-4 p-4 bg-gradient-to-r from-gray-100 to-gray-200 rounded-lg shadow-xl">
      <table className="w-full text-left bg-white shadow-md rounded-lg overflow-hidden">
        <thead className="bg-gradient-to-r from-blue-500 to-blue-600 text-white">
          <tr>
            <th className="p-4 text-center"></th>
            <th className="p-4 text-center">Project Name</th>
            <th className="p-4 text-center">Collaborators</th>
            <th className="p-4 text-center">Project Description</th>
            <th className="p-4 text-center">Tech Stack</th>
          </tr>
        </thead>
        <tbody>
          {projects.map((project) => (
            <tr
              key={project.project_id}
              className="odd:bg-gradient-to-r odd:from-gray-100 odd:to-gray-50 even:bg-gradient-to-r even:from-gray-50 even:to-gray-100 hover:bg-gradient-to-r hover:from-blue-100 hover:to-blue-200 transition-colors duration-200"
            >
              <td className="p-4 text-center">
                <img
                  src={project.project_url_compress}
                  alt="Logo"
                  className="w-[85px] h-[85px] rounded-full transition-transform duration-300 hover:scale-105"
                />
              </td>
              <td className="p-4 text-center font-bold">{project.project_name}</td>
              <td className="p-4 text-center flex flex-wrap justify-center gap-2">
                {project.colabs.map((colab) => (
                  <img
                    key={colab.user_id}
                    className="aspect-square w-10 rounded-full transition-transform duration-300 hover:scale-105"
                    src={colab.colab_image_url_compress}
                    alt="Collaborator"
                  />
                ))}
              </td>
              <td className="p-4 text-center max-w-md">{project.project_desc}</td>
              <td className="p-4 text-center flex flex-wrap justify-center gap-2">
                {project.tech_stack.map((tech, index) => (
                  <div
                    key={index}
                    className="rounded-full bg-gradient-to-r from-blue-500 to-blue-600 text-white px-4 py-2 text-base transition hover:from-blue-600 hover:to-blue-700"
                  >
                    {tech}
                  </div>
                ))}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Projects;
