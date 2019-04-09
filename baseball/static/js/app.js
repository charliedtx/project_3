function buildPlot() {
    /* data route */
  var url = "/api/people";
  d3.json(url).then(function(response) {

    console.log(response);

    var data = response;

    Plotly.newPlot("plot", [data]);
  });
}

function buildHomerunPlot() {
  /* data route */
var url = "/api/batting";
d3.json(url).then(function(response) {

  console.log(response);

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

  console.log(response);

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
    default:
      buildPlot(); 
}});