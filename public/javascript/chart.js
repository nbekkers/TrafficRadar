var __travel_time_free_flow_per_location__ = [];

$(document).ready(function() {
  setOnChangeEvent();

  new RetrieveLocationData().retrieveAllLocations(locationsCallback);
});

function setOnChangeEvent() {
  $("#location_select").change(function() {
    var selectedId = $(this).val();
    if (selectedId != 0) {
      new TrafficData().retrieve([selectedId], trafficCallback);
    }
  });
}

function locationsCallback(locations) {
  for (var key in locations) {
    __travel_time_free_flow_per_location__[key] = locations[key]['travel_time_free_flow'];

    $('#location_select').append($('<option>', {
      value: locations[key]['id'],
      text: locations[key]['name']
    }));
  }
}

function trafficCallback(results) {
  new TrafficDataChart("velocity_chart", [getCurrentDataArray(results[0], "velocity")], {
    title: "Snelheid",
    labelX: "",
    labelY: "Snelheid (km/u)"
  }).render();

  var currentTravelTime = getCurrentDataArray(results[0], "travel_time");
  var ttff = getFreeFlowTravelTime(results[0]['location_id'], currentTravelTime);
  new TrafficDataChart("travel_time_chart", [currentTravelTime, ttff], {
    title: "Reistijd",
    labelX: "",
    labelY: "Reistijd (in sec)"
  }).render();
}

function getCurrentDataArray(result, name) {
  var data = [];

  for(var i = 0; i < 12; i++) {
    if (result['traffic'][i]) {
      var time = formatTime(new Date(result['traffic'][i]['timestamp']));
      data[i] = [time, result['traffic'][i][name]];
    }
  }

  return data;
}

function getFreeFlowTravelTime(loc_id, currentTravelTime) {
  var ttff = [];
  for(var i = 0; i < currentTravelTime.length; i++) {
    ttff[i] = [currentTravelTime[i][0], __travel_time_free_flow_per_location__[loc_id]];
  }
  return ttff;
}