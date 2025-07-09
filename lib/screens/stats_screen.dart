import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../services/hive_service.dart';
import '../widgets/chart_widget.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  final HiveService hiveService = HiveService();
  List<Activity> activities = [];

  @override
  void initState() {
    super.initState();
    loadActivities();
  }

  void loadActivities() async {
    final data = await hiveService.getLocalActivities();
    setState(() {
      activities = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estadístiques')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text("Total registres: ${activities.length}"),
          if (activities.isNotEmpty)
            Text("Distància total: ${activities.map((a) => a.distanceKm).reduce((a, b) => a + b).toStringAsFixed(2)} km"),
          const SizedBox(height: 20),
          const Text("Gràfic de velocitat mitjana:"),
          if (activities.isNotEmpty)
            ChartWidget(activities: activities),
        ],
      ),
    );
  }
}
