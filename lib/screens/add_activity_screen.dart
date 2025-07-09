import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../services/hive_service.dart';
import '../widgets/custom_form_fields.dart';

class AddActivityScreen extends StatefulWidget {
  const AddActivityScreen({Key? key}) : super(key: key);

  @override
  State<AddActivityScreen> createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {
  final HiveService hiveService = HiveService();

  late String type;
  late double distanceKm;
  late int durationSeconds;
  late String comment;

  final List<String> activityTypes = ['córrer', 'bicicleta', 'nedar', 'força'];

  @override
  void initState() {
    type = activityTypes.first;
    distanceKm = 0.0;
    durationSeconds = 0;
    comment = "";
    super.initState();
  }

  void saveActivity() async {
    final activity = Activity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: type,
      distanceKm: distanceKm,
      durationSeconds: durationSeconds,
      date: DateTime.now().toIso8601String(),
      comment: comment.isEmpty ? null : comment,
    );

    await hiveService.saveActivityLocally(activity);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Afegir activitat')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomDropdownFormField(
              label: "Tipus",
              items: activityTypes,
              value: type,
              onChanged: (val) => setState(() => type = val ?? activityTypes.first),
            ),
            CustomTextField(
              label: "Distància (km)",
              keyboardType: TextInputType.number,
              onChanged: (val) => distanceKm = double.tryParse(val) ?? 0.0,
            ),
            CustomTextField(
              label: "Durada (segons)",
              keyboardType: TextInputType.number,
              onChanged: (val) => durationSeconds = int.tryParse(val) ?? 0,
            ),
            CustomTextField(
              label: "Comentari",
              keyboardType: TextInputType.text,
              onChanged: (val) => comment = val,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveActivity,
              child: const Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}
