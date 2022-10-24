import 'package:pokedex/data/db/db.dart';
import 'package:pokedex/data/model/pokemon.dart';

class PokemonsServices {
  static Future<DB> get initDB async =>
      await $FloorDB.databaseBuilder('pokedex.db').build();

  static Future<bool> dbIsEmpty() async {
    final DB db = await initDB;
    final List<Pokemon> pokemonsInDB = await db.pokemonsRepositoryDao.getAll();
    return pokemonsInDB.isEmpty;
  }

  static Future<void> deletePokemons() async {
    final DB db = await initDB;
    await db.pokemonsRepositoryDao.deleteAll();
  }

  static Future<bool> insertPokemonsInDB({
    required List<Pokemon> pokemons,
  }) async {
    final DB db = await initDB;
    List<int> res = await db.pokemonsRepositoryDao.insertItems(pokemons);
    return res.isNotEmpty; //si no esta vacio es porque inserto
  }

  static Future<List<Pokemon>> get pokemonsInDB async {
    final DB db = await initDB;
    List<Pokemon> pokemons = await db.pokemonsRepositoryDao.getAll();
    return pokemons;
  }

  static Future<void> dbActions(bool isOffline, List<Pokemon>? pokemons) async {
    if (pokemons == null) {
      throw Exception("No hay pokemones en memoria, no se puede crear db.");
    }
    if (pokemons.isEmpty) {
      throw Exception("No hay pokemones que guardar, no se puede crear db.");
    }
    List<Pokemon> pokemonsOffline = await pokemonsInDB;
    //Si estamos offline y no hay pokemones en la
    //base de datos insertamos los pokemones.
    if (isOffline && pokemonsOffline.isEmpty) {
      bool inserted = await insertPokemonsInDB(pokemons: pokemons);
      if (inserted) {
        //--
      }
    }
    if (isOffline == false && pokemonsOffline.isNotEmpty) {
      await deletePokemons();
    }
  }

  static Future refreshActions(bool isOffline) async {
    if (isOffline == false) {
      bool dbIsEmpty = await PokemonsServices.dbIsEmpty();
      if (dbIsEmpty == false) {
        await PokemonsServices.deletePokemons();
      }
    }
  }
}
