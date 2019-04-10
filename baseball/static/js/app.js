function buildPlot() {
    /* data route */
  var url = "/api/people";
  d3.json(url).then(function(response) {
    var data = response;
    var layout = {
      title: "Salaries (Average per Year)"
    };

    Plotly.newPlot("plot", [data], layout);
  });
}

function buildHomerunPlot() {
  /* data route */
var url = "/api/homeruns";
d3.json(url).then(function(response) {
  var data = response;
  var layout = {
            "title": "Homeruns per Year"
  }

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
          xaxis: {
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
  ]
  };
  Plotly.newPlot("plot", [data], layout);
});
}

function buildSalariesPlot() {
  /* data route */
var url = "/api/salaries";
d3.json(url).then(function(response) {
  var data = response;

  Plotly.newPlot("plot", [data]);
});
}

d3.selectAll(".dropdown-item").on("click", function(){
  switch (this.textContent){
    case "@plot yearly-attendance":
      buildAttendancePlot();
      break;
    case "@plot homeruns":
      buildHomerunPlot();
      break;
    case "@plot salaries":
      buildSalariesPlot();
      break;
    default:
      buildPlot();
}});
