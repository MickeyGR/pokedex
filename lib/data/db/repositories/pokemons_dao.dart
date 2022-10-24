import 'package:floor/floor.dart';
import 'package:pokedex/data/model/pokemon.dart';

@dao
abstract class PokemonsDao {
  @Query('SELECT * FROM Pokemons WHERE id = :id;')
  Future<Pokemon?> getById(int id);

  @Query('SELECT * FROM Pokemons ORDER BY id ASC;')
  Future<List<Pokemon>> getAll();

  @Query('DELETE FROM Pokemons;')
  Future<void> deleteAll();

  @insert
  Future<List<int>> insertItems(List<Pokemon> pokemons);
}
