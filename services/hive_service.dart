import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/activity.dart';

class HiveService {
  static const String boxName = 'activityBox';

  Future<Box> openBox() async {
    var hiveBox = await Hive.openBox(boxName);
    return hiveBox;
  }

  Future<void> saveActivityLocally(Activity activity) async {
    var box = await openBox();
    box.put(activity.id, activity.toMap());
  }

  Future<List<Activity>> getLocalActivities() async {
    var box = await openBox();
    List<Activity> activities = [];
    box.toMap().forEach((key, value) {
      activities.add(Activity.fromMap(value));
    });
    return activities;
  }

  Future<void> deleteLocalActivity(String id) async {
    var box = await openBox();
    await box.delete(id);
  }
}
