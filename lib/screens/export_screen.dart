import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../services/hive_service.dart';
import '../utils/csv_exporter.dart';

class ExportScreen extends StatefulWidget {
  const ExportScreen({Key? key}) : super(key: key);

  @override
  State<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> {
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
      appBar: AppBar(title: const Text('Exportar dades')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Tens ${activities.length} registres per exportar"),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: activities.isEmpty ? null : () => exportToCSV(activities, context),
              icon: const Icon(Icons.file_download),
              label: const Text("Exportar a CSV"),
            ),
          ],
        ),
      ),
    );
  }
}
