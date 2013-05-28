
function RetrieveLocationData() {

  this.retrieveAllLocations = function(trafficDataCallback) {
    $.ajax({
      url: '/locations',
      dataType: 'json',
      success: function(results) {
        var locationsHTML = new LocationDataHTML();
        locationsHTML.createRows(results);

        var ids = getIds(results);
        trafficDataCallback(ids);
      }
    });
  };

};

function LocationDataHTML() {
  this.createRows = function(json_locations) {
    for (var key in json_locations) {
      var id = json_locations[key]['id'];
      var row = "<tr id='row_" + id + "'>" +
          "<td>" + id + "</td>" +
          "<td>" + json_locations[key]['name'] + "</td>" +
          "<td></td>" +
          "<td></td>" +
          "<td></td>" +
          "<td></td>" +
          "<td></td>" +
          "<td></td>" +
          "<td></td>" +
          "<td></td>" +
          "<td></td>" +
          "<td></td>" +
          "<td></td>" +
          "<td></td>" +
          "<td></td>" +
          "</tr>";

      $('#locations_table > tbody:last').append(row);
    }
  }
}

function getIds(results) {
  var ids = [];
  for (var key in results) {
    ids.push(results[key]['id']);
  }
  return ids;
}

