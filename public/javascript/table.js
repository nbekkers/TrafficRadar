$(document).ready(function() {
  var retrieveLocations = new RetrieveLocationData();
  retrieveLocations.retrieveAllLocations(afterRetrieveLocationsCallback);
});

function afterRetrieveLocationsCallback(results) {
  new LocationDataTable().createRows(results);

  var ids = getIds(results);
  new TrafficData().retrieve(ids, afterRetrieveTrafficDataCallback);
};

function afterRetrieveTrafficDataCallback(results) {
  new TrafficDataTableRows().process(results);
}