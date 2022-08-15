import 'package:floor/floor.dart';

@entity
class HomeEntity {
  @primaryKey
  final int id;
  final String title;

  HomeEntity({
    required this.id,
    required this.title,
  });
}
