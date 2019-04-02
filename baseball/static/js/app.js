function buildPlot() {
    /* data route */
  var url = "/api/people";
  d3.json(url).then(function(response) {

    console.log(response);

    var data = response;

    Plotly.newPlot("people", [data]);
  });
}

buildPlot();

function buildHomerunPlot() {
  /* data route */
var url = "/api/batting";
d3.json(url).then(function(response) {

  console.log(response);

  var data = response;

  Plotly.newPlot("batter", [data]);
});
}

buildHomerunPlot()
