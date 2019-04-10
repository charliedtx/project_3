function buildPlot() {
    /* data route */
  var url = "/api/homeruns";
  d3.json(url).then(function(response) {
    var data = response;
    var layout = {
      title: "Homeruns Over Time",
      annotations: [
        {
          x: 1981,
          y: 1781,
          xref: 'x',
          yref: 'y',
          text: '81 Player Strike',
          showarrow: true,
          arrowhead: 6,
          ax: 0,
          ay: -120
        },
        {
          x: 1918,
          y: 1500,
          xref: 'x',
          yref: 'y',
          text: 'WWI',
          showarrow: true,
          arrowhead: 6,
          ax: 0,
          ay: -75
        },
        {
          x: 1943,
          y: 2500,
          xref: 'x',
          yref: 'y',
          text: 'WWII',
          showarrow: true,
          arrowhead: 6,
          ax: 0,
          ay: -75
        }
      ],
      shapes: [
        // 1st highlight during Feb 4 - Feb 6
        {
            type: 'rect',
            // x-reference is assigned to the x-values
            xref: 'x',
            // y-reference is assigned to the plot paper [0,1]
            yref: 'y',
            x0: 1916.5,
            y0: 0,
            x1: 1919.5,
            y1: 1500,
            fillcolor: '#d3d3d3',
            opacity: .3,
            line: {
                width: 1
            }
        },
        {
          type: 'rect',
          // x-reference is assigned to the x-values
          xref: 'x',
          // y-reference is assigned to the plot paper [0,1]
          yref: 'y',
          x0: 1940.5,
          y0: 0,
          x1: 1945.5,
          y1: 2500,
          fillcolor: '#d3d3d3',
          opacity: .3,
          line: {
              width: 1
          }
      }
      ]
    };
    Plotly.newPlot("plot", [data], layout);
  });
}

function buildAttendancePlot() {
  /* data route */
  var url = "/api/attendance";
  d3.json(url).then(function(response) {
    var data = response;
    var layout = {
      title: 'Yearly Attendance for MLB (by Team)',
      xaxis:  {
              tickangle: -45
              },
      annotations: [
      {
        x: 1981,
        y: 26609610,
        xref: 'x',
        yref: 'y',
        text: '81 Player Strike',
        showarrow: true,
        arrowhead: 6,
        ax: 70,
        ay: 0
      },
      {
        x: 2007,
        y: 79503680,
        xref: 'x',
        yref: 'y',
        text: 'Mitchell Report',
        showarrow: true,
        arrowhead: 6,
        ax: 0,
        ay: 50
      },
      {
        x: 1995,
        y: 75000000,
        xref: 'x',
        yref: 'y',
        text: 'Steroid Era - 16.5/20M Att. Growth',
        showarrow: false,
      },
      {
        x: 1994,
        y: 49984410,
        xref: 'x',
        yref: 'y',
        text: '94-95 Baseball Lockout Season',
        showarrow: true,
        arrowhead: 6,
        ax: 0,
        ay: 50
      }
    ],
    shapes: [
      {
          type: 'rect',
          xref: 'x',
          yref: 'y',
          x0: 1990,
          y0: 49000000,
          x1: 2000,
          y1: 73000000,
          fillcolor: '#29CAFD',
          opacity: .25,
          line: {
              width: .25
          }
      }]
    };
    Plotly.newPlot("plot", [data], layout);
  });
}

function buildSalariesPlot() {
  /* data route */
  var url = "/api/salaries";
  d3.json(url).then(function(response) {
    var data = response;
    var layout = {
            title: 'Avg. Annual MLB Salary (by Year)',
            xaxis: {
                    tickangle: -45
            },
            annotations: [
      {
        x: 2012,
        y: 3458421,
        xref: 'x',
        yref: 'y',
        text: '2012 Revenue Spike Cable Broadcasting Packages & Collective Bargaining Agreements',
        showarrow: true,
        arrowhead: 6,
        ax: 70,
        ay: 80
      },
      {
        x: 1991,
        y: 894961,
        xref: 'x',
        yref: 'y',
        text: '1990 min wage increase (32%)',
        showarrow: true,
        arrowhead: 6,
        ax: -50,
        ay: -50
      }
    ]
    };

    Plotly.newPlot("plot", [data], layout);
});
}

d3.selectAll(".dropdown-item").on("click", function(){
  switch (this.textContent){
    case "Yearly Attendance":
      d3.selectAll("img").remove();
      buildAttendancePlot();
      break;
    case "Homeruns":
      d3.selectAll("img").remove();
      buildPlot();
      break;
    case "Salaries":
      d3.selectAll("img").remove();
      buildSalariesPlot();
      d3.select("#plot").append('img')
      .attr('src','../static/img/RplotSalary.png')
      break;
    case "Runs per Game":
      Plotly.purge('plot');
      d3.selectAll("img").remove();
      d3.select("#plot").append('img')
      .attr('src','../static/img/RplotRunsPerGameAnnotated.png')
      break;
    default:
      buildPlot();
}});
