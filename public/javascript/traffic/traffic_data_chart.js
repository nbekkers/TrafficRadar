function TrafficDataChart(id, data, params) {
  this.id = id;
  this.data = data;
  this.params = params;

  this.render = function() {
    this.clearChart(this.id);
    this.renderChart(this.id, this.data, this.params.title, this.params.labelX, this.params.labelY);
  }

  this.clearChart = function(id) {
    $('#' + id).html('');
  }

  this.renderChart = function(id, data, title, labelX, labelY) {
    $.jqplot(id, data, {
      title: title,
      seriesDefaults: {
        rendererOptions: {
          smooth: true
        }
      },
      axes: {
        xaxis: {
          label: labelX,
          pad: 1.1,
          renderer: $.jqplot.CategoryAxisRenderer,
          tickRenderer: $.jqplot.CanvasAxisTickRenderer,
          tickOptions: {
            angle: -90
          }
        },
        yaxis: {
          label: labelY
        }
      }
    });
  }
}