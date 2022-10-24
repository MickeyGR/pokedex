import 'package:mobx/mobx.dart';
import 'package:pokedex/data/api/models/pokemon_data_default.dart';
import 'package:pokedex/data/api/models/pokemon_urls.dart';
import 'package:pokedex/data/api/services/api.dart';
import 'package:pokedex/data/model/pokemon.dart';

// Include generated file
part 'app_management.g.dart';

// This is the class used by rest of your codebase
// ignore: library_private_types_in_public_api
class AppManagement = _AppManagement with _$AppManagement;

// The store-class
abstract class _AppManagement with Store {
  @observable
  ObservableFuture<PokemonUrls?>? asyncPokemonUrlsController;

  @observable
  PokemonUrls? pokemonUrls;

  @observable
  List<Pokemon>? pokemons = ObservableList<Pokemon>();

  @action
  Future<void> setAsyncPokemons() async {
    asyncPokemonUrlsController = ObservableFuture(Api.pokemonUrls());

    pokemonUrls = await asyncPokemonUrlsController;

    if (pokemonUrls != null) {
      List<Pokemon> pkms = [];
      await Future.forEach(pokemonUrls!.results!, (pokemon) async {
        PokemonDataDefault? pokemonDD;
        String? type;
        List<String>? abilities;
        //TODO: Hacer peticion correspondiente a estos datos
        List<String>? involvesTo;
        List<String>? attacks;
        List<String>? locationAreaEncounters;
        try {
          pokemonDD = await Api.pokemon(pokemon.id!);
          if (pokemonDD != null) {
            abilities =
                pokemonDD.abilities!.map((a) => a.ability!.name!).toList();
            type =
                pokemonDD.types!.map((t) => t.type!.name!).toList().toString();
            //TODO: este dato contiene la url para obtener las locaciones - pokemonDD.locationAreaEncounters!
          }
        } catch (e) {
          pokemonDD = null;
        }

        pkms.add(
          Pokemon(
            pokemon.name!,
            id: pokemon.id,
            picture: "${Api.baseUrlPicture}${pokemon.id}.png",
            abilities: abilities,
            type: type,
          ),
        );
        pokemons = pkms;
      });
    }
  }

  /*@computed
  Future<bool> get isOffline async =>
      (connectionStatus != SocketStatus.online &&
          (await DBService.dbIsEmpty()) == false);*/

}
