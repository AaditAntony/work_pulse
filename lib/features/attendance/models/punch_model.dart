import 'package:hive/hive.dart';

part 'punch_model.g.dart';

@HiveType(typeId: 0)
class PunchModel {

  @HiveField(0)
  final String title;

  @HiveField(1)
  final DateTime time;

  PunchModel({
    required this.title,
    required this.time,
  });
}