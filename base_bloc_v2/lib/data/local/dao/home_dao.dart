import 'package:floor/floor.dart';

import '../entity/home_entity.dart';

const _tableName = 'HomeEntity';

@dao
abstract class HomeDao {
  @Query('select * FROM $_tableName')
  Future<List<HomeEntity>> getHomeData();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveHome(List<HomeEntity> data);

  @Query('select * from $_tableName where id = :id')
  Future<HomeEntity?> getTitleById(int id);
}
