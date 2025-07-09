import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import '../models/activity.dart';

Future<void> exportToCSV(List<Activity> activities, BuildContext context) async {
  final rows = <List<dynamic>>[];
  rows.add(['ID', 'Tipus', 'Distància (km)', 'Durada (s)', 'Data', 'Comentari']);
  for (var a in activities) {
    rows.add([
      a.id,
      a.type,
      a.distanceKm.toStringAsFixed(2),
      Duration(seconds: a.durationSeconds).toString(),
      a.date,
      a.comment ?? '',
    ]);
  }

  String csv = const ListToCsvConverter().convert(rows);
  final directory = await getDownloadsDirectory();
  final file = File('${directory?.path}/fittrack_export.csv');
  await file.writeAsString(csv);

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Exportat a ${file.path}')));
}
