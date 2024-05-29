import React from "react";
import { Chart } from "react-google-charts";

export function BarChart(user) {

    const projects = user.projects;
    const skillset = user.skills;

    const techStackCounts = {};

    let data = [
        [
          "Tech Stack",
          "Projects Contributed",
          {
            sourceColumn: 0,
            role: "annotation",
            type: "string",
            calc: "stringify",
          },
        ]
    ];

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
        if(skillset.includes(key))
            data.push([key, value, null]);
    });
      

    const options = {
        title: "Skillset Contribution",
        width: 600,
        height: 400,
        bar: { groupWidth: "75%" },
        legend: { position: "none" },
    };

    if(data.length === 1)
      return (<p>No skillset contribution</p>)

  return (

    <Chart
      chartType="BarChart"
      width="100%"
      height="400px"
      data={data}
      options={options}
    />
  );
}