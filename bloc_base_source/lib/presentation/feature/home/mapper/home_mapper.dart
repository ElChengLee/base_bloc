import 'package:bloc_base_source/data/local/entity/home_entity.dart';
import 'package:bloc_base_source/presentation/feature/home/model/home_response.dart';

extension HomeResponseExtension on HomeEntity {
  HomeResponse toModel() => HomeResponse(id, title, description);
}

extension HomeEntityExtension on HomeResponse {
  HomeEntity toEntity() =>
      HomeEntity(id: id, title: title, description: description);
}
