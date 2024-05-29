import { useEffect, useState } from "react";
import { fetchProjectById } from "../api";

const Projects = ({ projects, owned_projects }) => {
  return (
    <div className="col-span-4 p-4">
      <table className="w-full text-left bg-white shadow-md rounded-lg overflow-hidden">
        <thead className="bg-[#4894FE] text-white">
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
            <tr key={project.project_id} className="odd:bg-gray-100 even:bg-gray-50 hover:bg-[#e2f1ff] transition-colors duration-200">
              <td className="p-4 "><img src={project.project_url_compress} alt="Logo" className="w-[85px] h-[85px] mr-2 rounded-full" /></td>
              <td className="p-4 font-bold">{project.project_name}</td>
              <td className="p-4  flex flex-wrap justify-center gap-2">
                {project.colabs.map((colab) => (
                  <img
                    key={colab.user_id}
                    className="aspect-square w-10 rounded-full "
                    src={colab.colab_image_url_compress}
                    alt="Collaborator"
                  />
                ))}
              </td>
              <td className="p-4  max-w-md">{project.project_desc}</td>
              <td className="p-4  flex flex-wrap justify-center gap-2">
                {project.tech_stack.map((tech, index) => (
                  <div
                    key={index}
                    className="rounded-full bg-[#4894FE] text-white px-4 py-2 text-base"
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
