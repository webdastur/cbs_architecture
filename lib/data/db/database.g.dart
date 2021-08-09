// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

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

  TaskModelDao? _tasksDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `TaskModel` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `dueDate` INTEGER NOT NULL, `status` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskModelDao get tasksDao {
    return _tasksDaoInstance ??= _$TaskModelDao(database, changeListener);
  }
}

class _$TaskModelDao extends TaskModelDao {
  _$TaskModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskModelInsertionAdapter = InsertionAdapter(
            database,
            'TaskModel',
            (TaskModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'dueDate': item.dueDate,
                  'status': item.status
                }),
        _taskModelDeletionAdapter = DeletionAdapter(
            database,
            'TaskModel',
            ['id'],
            (TaskModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'dueDate': item.dueDate,
                  'status': item.status
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskModel> _taskModelInsertionAdapter;

  final DeletionAdapter<TaskModel> _taskModelDeletionAdapter;

  @override
  Future<void> clearTaskTable() async {
    await _queryAdapter.queryNoReturn('DELETE FROM TaskModel');
  }

  @override
  Future<List<TaskModel>> findAllTaskModels() async {
    return _queryAdapter.queryList('SELECT * FROM TaskModel',
        mapper: (Map<String, Object?> row) => TaskModel(row['name'] as String,
            row['status'] as int, row['dueDate'] as int));
  }

  @override
  Future<void> updateTaskModel(String name, int dueDate, int status) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE TaskModel SET status = ?3 WHERE name = ?1 and dueDate = ?2',
        arguments: [name, dueDate, status]);
  }

  @override
  Future<int> insertTaskModel(TaskModel taskModel) {
    return _taskModelInsertionAdapter.insertAndReturnId(
        taskModel, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteTaskModel(TaskModel taskModel) {
    return _taskModelDeletionAdapter.deleteAndReturnChangedRows(taskModel);
  }
}
