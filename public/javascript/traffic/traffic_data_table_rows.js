function TrafficDataTableRows() {

  this.process = function(results) {
    this.processHeaders(results);
    this.processBody(results);
  };

  this.processHeaders = function(results) {
    for(var i = 0; i < 12; i++) {
      if (results[0]['traffic'][i]) {
        var timestamp = results[0]['traffic'][i]['timestamp'];
        $("#row_header").find("th")[2 + i].innerHTML = formatTime(new Date(timestamp));
      }
    }
  };

  this.processBody = function(results) {
    for (var key in results) {
      var locationId = results[key]['location_id'];

      for(var i = 0; i < 12; i++) {
        if (results[key]['traffic'][i]) {
          var velocity = results[key]['traffic'][i]['velocity'];
          var travelTime = results[key]['traffic'][i]['travel_time'];
          var color = results[key]['traffic'][i]['color'];

          $("#row_" + locationId).find("td")[2 + i].innerHTML = velocity + " | " + travelTime;
          $("#row_" + locationId).find("td")[2 + i].style.backgroundColor = color;
        }
      }
    }
  };

}
