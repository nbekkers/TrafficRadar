function formatTime(d) {
  var hours = "" + d.getHours();
  var minutes = "" + d.getMinutes();

  hours = hours.length == 2 ? hours : "0" + hours;
  minutes = minutes.length == 2 ? minutes : "0" + minutes;

  return hours + ":" + minutes;
}
