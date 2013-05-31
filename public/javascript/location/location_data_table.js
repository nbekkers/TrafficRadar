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