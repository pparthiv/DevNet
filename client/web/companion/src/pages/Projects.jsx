import { useEffect, useState } from "react";

import { fetchProjectById } from "../api";

const Projects = ({ projects }) => {
  // const [projects, setProjects] = useState([
  //   {
  //     project_name: "asedf",
  //     colabs: ["asedf", "asedf", "asedf"],
  //     project_id: "asedf",
  //     project_desc: "asedf",
  //     project_status: "asedf",
  //     tech_stack: ["asedf", "asedf", "asedf"],
  //   },
  // ]);

  // const project = {
  //   project_name: "asedf",
  //   project_id: "asedf",
  //   project_desc: "asedf",
  //   project_status: "asedf",
  // };

  // useEffect(() => {
  //   const fetch = async () => {
  //     const data = await fetchProjectById("a234xgdyd4465h");
  //     console.log(data);
  //     setProjects(data);
  //   };
  //   fetch();
  // }, []);
  return (
    <div className={`col-span-4`}>
      <table className="w-full">
        <thead className=" rounded-xl bg-blue-600 p-10 text-white">
          <tr className=" *:p-4 first:rounded-lg">
            <th>Project Name</th>
            <th>Collaborators</th>
            <th>Project ID</th>
            <th>Project Description</th>
            <th>tech_stack</th>
          </tr>
        </thead>
        <tbody>
          {projects.map((project) => (
            <tr align="center" className="bg-slate-200 *:p-4 first:rounded-lg">
              <td>{project.project_name}</td>
              <td className=" flex flex-wrap items-center gap-2">
                {project.colabs.map((colab) => (
                  <img
                    key={colab}
                    className=" aspect-square w-10 rounded-full"
                    src={colab.colab_image_url_compress}
                  />
                ))}
              </td>
              <td>{project.project_id}</td>
              <td className=" max-w-96 ">{project.project_desc}</td>
              <td className="flex flex-wrap justify-center gap-2">
                {project.tech_stack.map((tech) => (
                  <div className=" flex items-center  rounded-lg bg-white p-2 text-xs leading-none ">
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
