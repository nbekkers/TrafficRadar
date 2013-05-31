
function RetrieveLocationData() {

  this.retrieveAllLocations = function(callback) {
    $.ajax({
      url: '/locations',
      dataType: 'json',
      success: function(results) {
        callback(results);
      }
    });
  };

};

function getIds(results) {
  var ids = [];
  for (var key in results) {
    ids.push(results[key]['id']);
  }
  return ids;
}

