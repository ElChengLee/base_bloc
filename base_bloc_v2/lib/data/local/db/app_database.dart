import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../dao/home_dao.dart';
import '../entity/home_entity.dart';

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [HomeEntity])
abstract class AppDatabase extends FloorDatabase {
  HomeDao get homeDao;
}
