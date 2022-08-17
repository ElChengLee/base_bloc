// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  HomeDao? _homeDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `HomeEntity` (`id` INTEGER NOT NULL, `title` TEXT NOT NULL, `description` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  HomeDao get homeDao {
    return _homeDaoInstance ??= _$HomeDao(database, changeListener);
  }
}

class _$HomeDao extends HomeDao {
  _$HomeDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _homeEntityInsertionAdapter = InsertionAdapter(
            database,
            'HomeEntity',
            (HomeEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<HomeEntity> _homeEntityInsertionAdapter;

  @override
  Future<List<HomeEntity>> getHomeData() async {
    return _queryAdapter.queryList('select * FROM HomeEntity',
        mapper: (Map<String, Object?> row) => HomeEntity(
            id: row['id'] as int,
            title: row['title'] as String,
            description: row['description'] as String));
  }

  @override
  Future<HomeEntity?> getTitleById(int id) async {
    return _queryAdapter.query('select * from HomeEntity where id = ?1',
        mapper: (Map<String, Object?> row) => HomeEntity(
            id: row['id'] as int,
            title: row['title'] as String,
            description: row['description'] as String),
        arguments: [id]);
  }

  @override
  Future<void> saveHome(List<HomeEntity> data) async {
    await _homeEntityInsertionAdapter.insertList(
        data, OnConflictStrategy.replace);
  }
}
