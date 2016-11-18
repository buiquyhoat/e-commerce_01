var StatisticChart = {
  options: {
    title: {
      text: I18n.t("weekly_statistics"),
      x: -80 //center
    },

    xAxis: {
      categories: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    },

    yAxis: [{
      labels: {
        format: I18n.t("value_order"),
        style: {
          color: Highcharts.getOptions().colors[1]
        }
      },
      title: {
        text: I18n.t("total_order"),
        style: {
          color: Highcharts.getOptions().colors[1]
        }
      }
    },
    {
      labels: {
        format: I18n.t("value_mems"),
        style: {
          color: Highcharts.getOptions().colors[0]
        }
      },
      title: {
        text: I18n.t("customer_accounts"),
        style: {
          color: Highcharts.getOptions().colors[0]
        }
      },
      opposite: true
    }],

    tooltip: {
      shared: true
    },
    legend: {
      layout: I18n.t("vertical"),
      align: I18n.t("right"),
      verticalAlign: I18n.t("middle"),
      borderWidth: 0
    },
    series: []
  },

  initialize: function() {
    $.getJSON('/admin/statistic.json', function(data) {
      StatisticChart.options.series = [];
      $.each(data, function(i, json_data) {
        StatisticChart.options.series.push({
          name: json_data.name,
          type: json_data.type,
          data: json_data.data,
          tooltip: json_data.tooltip,
          yAxis: json_data.yAxis
        });
      });
      StatisticChart.draw_chart();
    });
  },

  draw_chart: function() {
    Highcharts.chart('chart-container', StatisticChart.options);
  }
}

function init_chart_basic_line() {
  StatisticChart.initialize();
};
