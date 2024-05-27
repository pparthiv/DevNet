import PropTypes from "prop-types";
import { Avatar, Typography } from "@material-tailwind/react";
import React, { useEffect } from 'react';
import { fetchProjectById, fetchUserById } from "../../api/api";
import { useState } from "react";
import { useParams } from "react-router-dom";

export function ProjectDescription () {

  const [project, setProject] = useState(null);
  const [name, setName] = useState("");
  const [ownerImg, setOwnerImg] = useState(null);

  const {id} = useParams();

  useEffect(() => {
    const fetchProjectInfo = async() => {
      try {
        const fetchedProj = await fetchProjectById(id);
        setProject(fetchedProj[0]);
        const fetchedUser = await fetchUserById(fetchedProj[0].project_owner_id);
        let getName = fetchedUser[0].first_name.concat(" ", fetchedUser[0].last_name);
        setName(getName);
        setOwnerImg(fetchedUser[0].profile_url_compress);
      } catch (error) {
        console.error("Error fetching project:", error);
      }
    };
    fetchProjectInfo();
  }, [id]);
  
  return (
    <div className="min-h-screen p-8 bg-gray-100 flex flex-col items-start">
      {project?<>
      <div className="flex items-center mb-4">
      <img src={project.project_url_hd} alt="Project Logo" className="w-20 h-20 mr-4" />
      <div>
        <h1 className="text-4xl font-bold">{project.project_name}</h1>
        <div className="flex mt-2">
          <img src={ownerImg} alt="Collaborator" className="w-10 h-10 rounded-full mr-2" />
          <p className="text-lg text-gray-600 text-justify pt-1">{name}</p>
        </div>
      </div>
    </div>
    <div className="mb-8">
      <h2 className="text-2xl font-semibold mb-2">Tech Stack</h2>
      <div className="flex flex-wrap">
        {project.tech_stack.map((tech, index) => (
          <span key={index} className="m-1 px-3 py-1 bg-blue-200 text-blue-800 rounded-full text-sm">
            {tech}
          </span>
        ))}
      </div>
    </div>
    <div className="mb-8">
      <h2 className="text-2xl font-semibold mb-2">Collaborators</h2>
      <div className="flex">
        {project.colabs.map((collaborator, index) => (
          <img key={index} src={collaborator.colab_image_url_compress} alt="Collaborator" className="w-10 h-10 rounded-full mr-2" />
        ))}
      </div>
    </div>
    <div>
      <h2 className="text-2xl font-semibold mb-2">Project Description</h2>
      <p className="text-gray-700">
        {project.project_desc}
      </p>
    </div>
    <div>
      <button className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 mt-5 rounded-full">
        Collab Request
      </button>
    {/* LOGIC TO BE ADDED FOR COLLAB REQUEST */}
    </div>
    </>
    : <div>Loading...</div>
    }
      
    </div>    
  );
};

export default ProjectDescription;