import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 2)
class Category {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String color;

  @HiveField(2)
  late int count;

  @HiveField(3)
  late int id;
}
