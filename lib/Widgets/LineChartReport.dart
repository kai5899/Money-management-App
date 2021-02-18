import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineReportChart extends StatelessWidget {
  final Color color;

  const LineReportChart({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.5,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: false),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          clipData:
              FlClipData(right: true, top: true, bottom: true, left: true),
          lineBarsData: [
            LineChartBarData(
              spots: color == Colors.green ? getSports() : getNegative(),
              isCurved: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradientTo: Offset(1, 1),
                gradientFrom: Offset(0.5, 0.5),
                colors: [
                  color,
                  color.withOpacity(0.1),
                ],
              ),
              colors: [color.withOpacity(0.3)],
              barWidth: 4,
            ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> getSports() {
    return [
      FlSpot(0, .5),
      FlSpot(1, 1.5),
      FlSpot(2, .5),
      FlSpot(3, .7),
      FlSpot(4, .2),
      FlSpot(5, 2),
      FlSpot(6, 1.5),
      FlSpot(7, 1.7),
      FlSpot(8, 1),
      FlSpot(9, 2.8),
      FlSpot(10, 2.5),
      FlSpot(11, 2.65),
    ];
  }

  List<FlSpot> getNegative() {
    return [
      FlSpot(0, .5),
      FlSpot(1, -1.5),
      FlSpot(2, .5),
      FlSpot(3, .7),
      FlSpot(4, .2),
      FlSpot(5, -2),
      FlSpot(6, 1.5),
      FlSpot(7, 1.7),
      FlSpot(8, -1),
      FlSpot(9, 2.8),
      FlSpot(10, 2.5),
      FlSpot(11, 2.65),
    ];
  }
}
