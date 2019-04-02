function buildPlot() {
    /* data route */
  var url = "/api/baseball";
  d3.json(url).then(function(response) {

    console.log(response);

    var data = response;

    Plotly.plot("plot", data);
  });
}

buildPlot();
