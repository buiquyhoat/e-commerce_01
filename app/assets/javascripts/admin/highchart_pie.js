var StatisticChartPie = {
  options: {
    chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false,
      type: 'pie'
    },
    title: {
      text: 'Hot trends'
    },
    tooltip: {
      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
      pie: {
          allowPointSelect: true,
          cursor: 'pointer',
          dataLabels: {
              enabled: true,
              format: '<b>{point.name}</b>: {point.percentage:.1f} %',
              style: {
                color: (Highcharts.theme &&
                  Highcharts.theme.contrastTextColor) || 'black'
              }
          }
      }
    },
    series: []
  },

  initialize: function() {
    $.getJSON('/admin/statistic_pie.json', function(data) {
      StatisticChartPie.options.series = []
      $.each(data, function(i, json_data) {
        StatisticChartPie.options.series.push({
          name: json_data.name,
          colorByPoint: json_data.colorByPoint,
          data: json_data.data
        });
      });
      StatisticChartPie.draw_chart();
    });
  },

  draw_chart: function() {
    Highcharts.chart('chart-pie-container', StatisticChartPie.options);
  }
};

function init_chart_pie() {
  StatisticChartPie.initialize();
};

