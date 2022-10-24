// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDB {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DBBuilder databaseBuilder(String name) => _$DBBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DBBuilder inMemoryDatabaseBuilder() => _$DBBuilder(null);
}

class _$DBBuilder {
  _$DBBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DBBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DBBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DB> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DB();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DB extends DB {
  _$DB([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PokemonsDao? _pokemonsRepositoryDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
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
            'CREATE TABLE IF NOT EXISTS `Pokemons` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `type` TEXT, `involvesTo` TEXT, `attacks` TEXT, `abilities` TEXT, `locationAreaEncounters` TEXT, `picture` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PokemonsDao get pokemonsRepositoryDao {
    return _pokemonsRepositoryDaoInstance ??=
        _$PokemonsDao(database, changeListener);
  }
}

class _$PokemonsDao extends PokemonsDao {
  _$PokemonsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _pokemonInsertionAdapter = InsertionAdapter(
            database,
            'Pokemons',
            (Pokemon item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'type': item.type,
                  'involvesTo': item.involvesTo,
                  'attacks': item.attacks,
                  'abilities': item.abilities,
                  'locationAreaEncounters': item.locationAreaEncounters,
                  'picture': item.picture
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Pokemon> _pokemonInsertionAdapter;

  @override
  Future<Pokemon?> getById(int id) async {
    return _queryAdapter.query('SELECT * FROM Pokemons WHERE id = ?1;',
        mapper: (Map<String, Object?> row) => Pokemon(
            id: row['id'] as int,
            name: row['name'] as String,
            type: row['type'] as String?,
            involvesTo: row['involvesTo'] as String?,
            attacks: row['attacks'] as String?,
            abilities: row['abilities'] as String?,
            locationAreaEncounters: row['locationAreaEncounters'] as String?,
            picture: row['picture'] as String?),
        arguments: [id]);
  }

  @override
  Future<List<Pokemon>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM Pokemons ORDER BY id ASC;',
        mapper: (Map<String, Object?> row) => Pokemon(
            id: row['id'] as int,
            name: row['name'] as String,
            type: row['type'] as String?,
            involvesTo: row['involvesTo'] as String?,
            attacks: row['attacks'] as String?,
            abilities: row['abilities'] as String?,
            locationAreaEncounters: row['locationAreaEncounters'] as String?,
            picture: row['picture'] as String?));
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Pokemons;');
  }

  @override
  Future<List<int>> insertItems(List<Pokemon> pokemons) {
    return _pokemonInsertionAdapter.insertListAndReturnIds(
        pokemons, OnConflictStrategy.abort);
  }
}
