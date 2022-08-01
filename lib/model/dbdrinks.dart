import 'package:hive/hive.dart';
part 'dbdrinks.g.dart';

@HiveType(typeId: 0)
class LocalDrinks extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final String photo;
  @HiveField(3)
  final String oz;

  LocalDrinks(
      {required this.name,
      required this.category,
      required this.photo,
      required this.oz});
}
