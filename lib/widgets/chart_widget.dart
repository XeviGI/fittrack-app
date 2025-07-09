import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/activity.dart';

class ChartWidget extends StatelessWidget {
  final List<Activity> activities;

  const ChartWidget({Key? key, required this.activities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (activities.isEmpty) {
      return const Center(child: Text("Sense dades"));
    }

    final data = activities.map((a) {
      final date = DateTime.parse(a.date);
      return FlSpot(date.millisecondsSinceEpoch.toDouble(), a.averageSpeedKmh);
    }).toList();

    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: data,
              isCurved: true,
              color: Colors.blue,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
