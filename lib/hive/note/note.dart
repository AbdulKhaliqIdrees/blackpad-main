import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String note;

  @HiveField(2)
  late String category;

  @HiveField(3)
  late DateTime time;

  @HiveField(4)
  late String color;

  @HiveField(5)
  late bool isFavorite;

  @HiveField(6)
  late int id;
}
