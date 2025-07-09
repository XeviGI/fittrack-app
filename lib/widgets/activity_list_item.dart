import 'package:flutter/material.dart';
import '../models/activity.dart';

class ActivityListItem extends StatelessWidget {
  final Activity activity;

  const ActivityListItem({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(activity.date);
    final duration = Duration(seconds: activity.durationSeconds);

    return ListTile(
      title: Text(activity.type),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Data: ${date.toString().split(" ").first}"),
          Text("Distància: ${activity.distanceKm.toStringAsFixed(2)} km"),
          Text("Durada: $duration"),
          Text("Velocitat: ${activity.averageSpeedKmh.toStringAsFixed(2)} km/h"),
          if (activity.comment != null) Text("Comentari: ${activity.comment!}"),
        ],
      ),
    );
  }
}
