
function TrafficData() {

  this.retrieve = function(ids, callback) {
    $.ajax({
      url: '/traffic/' + ids.join(),
      dataType: 'json',
      success: function(results) {
        callback(results);
      }
    });
  }

};