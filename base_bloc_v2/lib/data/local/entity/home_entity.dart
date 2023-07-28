import 'package:floor/floor.dart';

@entity
class HomeEntity {
  @primaryKey
  final int id;
  final String title;
  final String description;

  HomeEntity({
    required this.id,
    required this.title,
    required this.description,
  });
}
