#= require vendor/queue
#= require vendor/zepto

# Scope this to only the asst3 page.
if $('body').hasClass('asst3')
  graphPart1 = (data0_6, data0_8, data1_0) ->
    nv.addGraph ->
      width = 400
      height = 300

      chart = nv.models.lineChart()
                       .color(d3.scale.category10().range())
                       .useInteractiveGuideline(true)
                       .transitionDuration(350)
                       .width(width)
                       .height(height)
                       .margin(top: 20, right: 20, bottom: 60, left: 60)
                       .showYAxis(true)        #Show the y-axis
                       .showXAxis(true)        #Show the x-axis

      # Axis settings
      chart.xAxis
        .axisLabel('Time (s)')
        .tickFormat(d3.format('.01f'))
      chart.yAxis
        .axisLabel('Height')
        .axisLabelDistance(35)
        .tickFormat(d3.format('.02f'))

      fullData =
        [
          key: '0.6'
          values: data0_6
        ,
          key: '0.8'
          values: data0_8
        ,
          key: '1.0'
          values: data1_0
        ]

      d3.select('#graph_part_1')
          .append('svg')
          .datum(fullData)
          .attr('width', '100%')
          .attr('viewBox', "0 0 #{width} #{height}")
          .call(chart)

      $('#graph_part_1 svg').height(height)

      return chart

  queue()
    .defer(d3.csv, 'part1_y_0.6.csv')
    .defer(d3.csv, 'part1_y_0.8.csv')
    .defer(d3.csv, 'part1_y_1.0.csv')
    .await(graphPart1);

  graphPart2 = (data, data_des) ->
    nv.addGraph ->
      width = 400
      height = 300

      chart = nv.models.lineChart()
                       .color(d3.scale.category10().range())
                       .useInteractiveGuideline(true)
                       .transitionDuration(350)
                       .width(width)
                       .height(height)
                       .margin(top: 20, right: 20, bottom: 60, left: 60)
                       .showYAxis(true)        #Show the y-axis
                       .showXAxis(true)        #Show the x-axis

      # Axis settings
      chart.xAxis
        .axisLabel('Time (s)')
        .tickFormat(d3.format('.01f'))
        .tickValues(d3.range(1.0, 2.0, 0.1))
      chart.yAxis
        .axisLabel('Angle (radians)')
        .axisLabelDistance(35)
        .tickFormat(d3.format('.02f'))

      fullData =
        [
          key: 'Desired Angle'
          values: data_des
        ,
          key: 'Actual Angle'
          values: data
        ]

      d3.select('#graph_part_2')
          .append('svg')
          .datum(fullData)
          .attr('width', '100%')
          .attr('viewBox', "0 0 #{width} #{height}")
          .call(chart)

      $('#graph_part_2 svg').height(height)

      return chart

  queue()
    .defer(d3.csv, 'part2_leg_angle.csv')
    .defer(d3.csv, 'part2_leg_angle_desired.csv')
    .await(graphPart2);

  graphPart3 = (data0_0, data0_5, data1_0) ->
    nv.addGraph ->
      width = 400
      height = 300

      chart = nv.models.lineChart()
                       .color(d3.scale.category10().range())
                       .useInteractiveGuideline(true)
                       .transitionDuration(350)
                       .width(width)
                       .height(height)
                       .forceX([0, 30])
                       .forceY([-0.5, 2.0])
                       .margin(top: 20, right: 20, bottom: 60, left: 60)
                       .showYAxis(true)        #Show the y-axis
                       .showXAxis(true)        #Show the x-axis

      # Axis settings
      chart.xAxis
        .axisLabel('Time (s)')
        .tickFormat(d3.format('.01f'))
      chart.yAxis
        .axisLabel('Speed')
        .axisLabelDistance(35)
        .tickFormat(d3.format('.02f'))

      fullData =
        [
          key: '0.0'
          values: data0_0
        ,
          key: '0.5'
          values: data0_5
        ,
          key: '1.0'
          values: data1_0
        ]

      d3.select('#graph_part_3')
          .append('svg')
          .datum(fullData)
          .attr('width', '100%')
          .attr('viewBox', "0 0 #{width} #{height}")
          .call(chart)

      $('#graph_part_3 svg').height(height)

      return chart

  queue()
    .defer(d3.csv, 'speed_desired_0.0.csv')
    .defer(d3.csv, 'speed_desired_0.5.csv')
    .defer(d3.csv, 'speed_desired_1.0.csv')
    .await(graphPart3);

  d3.csv 'hip_angle.csv', (data) ->
    nv.addGraph ->
      width = 400
      height = 300

      chart = nv.models.lineChart()
                       .color(d3.scale.category10().range())
                       .useInteractiveGuideline(true)
                       .transitionDuration(350)
                       .width(width)
                       .height(height)
                       .forceX([0, 30])
                       .forceY([-0.1, 0.1])
                       .margin(top: 20, right: 20, bottom: 60, left: 60)
                       .showYAxis(true)        #Show the y-axis
                       .showXAxis(true)        #Show the x-axis
                       .showLegend(false)

      # Axis settings
      chart.xAxis
        .axisLabel('Time (s)')
        .tickFormat(d3.format('.01f'))
      chart.yAxis
        .axisLabel('Angle (radians)')
        .axisLabelDistance(35)
        .tickFormat(d3.format('.02f'))

      fullData =
        [
          key: 'Hip Angle'
          values: data
        ]

      d3.select('#graph_part_3_1')
          .append('svg')
          .datum(fullData)
          .attr('width', '100%')
          .attr('viewBox', "0 0 #{width} #{height}")
          .call(chart)

      $('#graph_part_3_1 svg').height(height)

      return chart