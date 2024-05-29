import React from "react";
import { Chart } from "react-google-charts";

const PieChart = (user) => {

    const projects = user.projects;

    const techStackCounts = {};

    let data = [["Tech Stack", "Projects"]];

    projects.forEach(project => {
        project.tech_stack.forEach(tech => {
        if (techStackCounts[tech]) {
            techStackCounts[tech]++;
        } else {
            techStackCounts[tech] = 1;
        }
        });
    });

    Object.entries(techStackCounts).forEach(([key, value]) => {
        data.push([key, value]);
    });

    const options = {
        title: "Project Skill Distribution",
        pieHole: 0.4,
        is3D: false,
    };
    return (
        <Chart
          chartType="PieChart"
          data={data}
          options={options}
          width={"100%"}
          height={"400px"}
        />
      );
}

export default PieChart;