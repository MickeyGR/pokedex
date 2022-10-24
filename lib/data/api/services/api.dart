import 'package:http/http.dart' as http;
import 'package:pokedex/data/api/models/pokemon_data_default.dart';
import 'package:pokedex/data/api/models/pokemon_urls.dart';

class Api {
  static String baseUrl = "https://pokeapi.co";
  static String endPoint = "/api/v2/pokemon/";
  static String query = "?limit=151&offset=0";
  static String baseUrlPicture =
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/";

  static Future<PokemonUrls?> pokemonUrls() async {
    final response = await http.get(
      Uri.parse(
        baseUrl + endPoint + query,
      ),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return pokemonUrlsFromJson(response.body.toString());
    } else {
      throw Exception(
        "Error haciendo la peticion a la PokeApi, StatusCode\t${response.statusCode}",
      );
    }
  }

  static Future<PokemonDataDefault?> pokemon(int pokemonId) async {
    final response = await http.get(
      Uri.parse(
        "$baseUrl$endPoint$pokemonId",
      ),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return pokemonDataDefaultFromJson(response.body.toString());
    } else {
      throw Exception(
        "Error haciendo la peticion a la PokeApi, StatusCode\t${response.statusCode}",
      );
    }
  }
}
