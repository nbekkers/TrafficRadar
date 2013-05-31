$(document).ready(function() {
  setOnChangeEvent();

  new RetrieveLocationData().retrieveAllLocations(locationsCallback);
});

function setOnChangeEvent() {
  $("#location_select").change(function() {
    new TrafficData().retrieve([$(this).val()], trafficCallback);
  });
}

function locationsCallback(locations) {
  for (var key in locations) {
    $('#location_select').append($('<option>', {
      value: locations[key]['id'],
      text: locations[key]['name']
    }));
  }
}

function trafficCallback(results) {
  new TrafficDataChart("velocity_chart", getDataArray(results[0], "velocity"), {
    title: "Snelheid",
    labelX: "Tijd per 5 minuten",
    labelY: "Snelheid (km/u)"
  }).render();

  new TrafficDataChart("travel_time_chart", getDataArray(results[0], "travel_time"), {
    title: "Reistijd",
    labelX: "Tijd per 5 minuten",
    labelY: "Reistijd (in sec)"
  }).render();
}

function getDataArray(result, name) {
  var data = [];

  for(var i = 0; i < 12; i++) {
    if (result['traffic'][i]) {
      data[i] = result['traffic'][i][name];
    }
  }

  return data;
}