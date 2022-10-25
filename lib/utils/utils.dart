import 'package:flutter/material.dart';
import 'package:pokedex/controllers/app_management.dart';

import '../data/db/services/pokemons_services.dart';

class Utils {
  static TextStyle get txtStyleBoldBlack => const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
  static Image get imageAssetPokeBall{
    return Image.asset("assets/gif/pokeball_gif.gif");
  }

  static Future<void> init(AppManagement aMgnt) async {
    aMgnt.leakedPokemons = [];
    await PokemonsServices.refreshActions(aMgnt.isOffline);
    aMgnt.setAsyncPokemons();
  }
}
