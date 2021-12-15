// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

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

  CoinFavoriteDao? _coinDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `CoinFavorite` (`id` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CoinFavoriteDao get coinDao {
    return _coinDaoInstance ??= _$CoinFavoriteDao(database, changeListener);
  }
}

class _$CoinFavoriteDao extends CoinFavoriteDao {
  _$CoinFavoriteDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _coinFavoriteInsertionAdapter = InsertionAdapter(
            database,
            'CoinFavorite',
            (CoinFavorite item) => <String, Object?>{'id': item.id}),
        _coinFavoriteDeletionAdapter = DeletionAdapter(database, 'CoinFavorite',
            ['id'], (CoinFavorite item) => <String, Object?>{'id': item.id});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CoinFavorite> _coinFavoriteInsertionAdapter;

  final DeletionAdapter<CoinFavorite> _coinFavoriteDeletionAdapter;

  @override
  Future<List<CoinFavorite>> findAllCoin() async {
    return _queryAdapter.queryList('SELECT * FROM CoinFavorite',
        mapper: (Map<String, Object?> row) =>
            CoinFavorite(row['id'] as String));
  }

  @override
  Future<CoinFavorite?> findCoinnById(String id) async {
    return _queryAdapter.query('SELECT * FROM CoinFavorite WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CoinFavorite(row['id'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertCoin(CoinFavorite coin) async {
    await _coinFavoriteInsertionAdapter.insert(coin, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCoin(CoinFavorite coin) async {
    await _coinFavoriteDeletionAdapter.delete(coin);
  }
}
