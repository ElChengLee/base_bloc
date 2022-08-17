import 'package:bloc_base_source/data/local/entity/home_entity.dart';
import 'package:floor/floor.dart';

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
