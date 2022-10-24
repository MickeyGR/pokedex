import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/data/api/models/pokemon_data_default.dart';
import 'package:pokedex/data/api/models/pokemon_urls.dart';
import 'package:pokedex/data/api/services/api.dart';
import 'package:pokedex/data/db/services/pokemons_services.dart';
import 'package:pokedex/data/model/pokemon.dart';

// Include generated file
part 'app_management.g.dart';

// This is the class used by rest of your codebase
// ignore: library_private_types_in_public_api
class AppManagement = _AppManagement with _$AppManagement;

// The store-class
abstract class _AppManagement with Store {
  @observable
  bool isOffline = false;

  @observable
  ObservableStream<ConnectivityResult> connectivityStream =
      ObservableStream(Connectivity().onConnectivityChanged);

  @observable
  ObservableFuture<PokemonUrls?>? asyncPokemonUrlsController;

  @observable
  PokemonUrls? pokemonUrls;

  @observable
  List<Pokemon>? pokemons = ObservableList<Pokemon>();

  @action
  Future<void> setAsyncPokemons() async {
    List<Pokemon> pkmsInDB = await PokemonsServices.pokemonsInDB;
    if (isOffline || pkmsInDB.isNotEmpty) {
      pokemons = pkmsInDB;
    } else {
      asyncPokemonUrlsController = ObservableFuture(Api.pokemonUrls());

      pokemonUrls = await asyncPokemonUrlsController;

      if (pokemonUrls != null) {
        List<Pokemon> pkms = [];
        await Future.forEach(pokemonUrls!.results!, (pokemon) async {
          PokemonDataDefault? pokemonDD;
          String? type;
          String? abilities;
          //TODO: Hacer peticion correspondiente a estos datos
          String? involvesTo;
          String? attacks;
          String? locationAreaEncounters;
          bool isError = false;
          try {
            pokemonDD = await Api.pokemon(pokemon.id!);
          } catch (e) {
            pokemonDD = null;
            isError = true;
          }

          if (isError == false) {
            if (pokemonDD != null) {
              abilities =
                  pokemonDD.abilities!.map((a) => a.ability!.name!).toString();
              type = pokemonDD.types!.map((t) => t.type!.name!).toString();
              //TODO: este dato contiene la url para obtener las locaciones - pokemonDD.locationAreaEncounters!
            }
            pkms.add(
              Pokemon(
                id: pokemon.id!,
                name: pokemon.name!,
                picture: "${Api.baseUrlPicture}${pokemon.id}.png",
                abilities: abilities,
                type: type,
              ),
            );
            pokemons = pkms;
          }
        });
      }
    }
  }
}
