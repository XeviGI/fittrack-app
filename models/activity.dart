import 'dart:convert';

class Activity {
  final String id;
  final String type; // córrer, bicicleta, nedar, força
  final double distanceKm;
  final int durationSeconds;
  final String date;
  final String? comment;

  double get averagePaceMinPerKm =>
      durationSeconds / 60.0 / distanceKm;

  double get averageSpeedKmh =>
      distanceKm / (durationSeconds / 3600.0);

  Activity({
    required this.id,
    required this.type,
    required this.distanceKm,
    required this.durationSeconds,
    required this.date,
    this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'distanceKm': distanceKm,
      'durationSeconds': durationSeconds,
      'date': date,
      'comment': comment,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'],
      type: map['type'],
      distanceKm: map['distanceKm'] is int ? map['distanceKm'].toDouble() : map['distanceKm'],
      durationSeconds: map['durationSeconds'],
      date: map['date'],
      comment: map['comment'],
    );
  }
}
