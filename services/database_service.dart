import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/activity.dart';

class DatabaseService {
  final CollectionReference activities =
      FirebaseFirestore.instance.collection('activities');

  Future<void> addActivity(Activity activity) async {
    await activities.add(activity.toMap());
  }

  Stream<List<Activity>> getAllActivities() {
    return activities.orderBy('date', descending: true).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Activity.fromMap(doc.data() as Map<String, dynamic>)).toList());
  }

  Future<void> deleteActivity(String id) async {
    await activities.doc(id).delete();
  }
}
