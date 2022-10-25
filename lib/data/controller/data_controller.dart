import 'package:pokedex/data/api/models/pokemon_data_default.dart';
import 'package:pokedex/data/api/models/pokemon_location_area_encounters.dart';
import 'package:pokedex/data/api/services/api.dart';
import 'package:pokedex/data/model/pokemon.dart';

class DataController {
  static Future<Pokemon> parsePokemonDDtoPokemon(PokemonDataDefault pokemonDD) async {
    String? type;
    String? abilities;
    String? locationAreaEncounters;
    // ignore: todo
    //TODO: Hacer peticion correspondiente a estos datos
    //String? involvesTo;
    //String? attacks;
    //--

    abilities = pokemonDD.abilities!.map((a) => a.ability!.name!).toString();
    type = pokemonDD.types!.map((t) => t.type!.name!).toString();
    if (pokemonDD.locationAreaEncounters != null) {
      try {
        List<PokemonLocationAreaEncounters>? pLAE =
            await Api.pokemonLAE(pokemonDD.locationAreaEncounters!);
        if (pLAE != null) {
          locationAreaEncounters =
              pLAE.map((a) => a.locationArea!.name).toString();
        }
      } catch (e) {
        locationAreaEncounters = null;
      }
    }
    return Pokemon(
        id: pokemonDD.id!,
        name: pokemonDD.name!,
        picture: "${Api.baseUrlPicture}${pokemonDD.id}.png",
        abilities: abilities,
        type: type,
        locationAreaEncounters: locationAreaEncounters);
  }
}
