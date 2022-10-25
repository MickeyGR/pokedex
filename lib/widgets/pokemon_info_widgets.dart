
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/data/model/pokemon.dart';
import 'package:pokedex/utils/utils.dart';
import 'package:pokedex/widgets/two_txt.dart';

class PokemonInfoWidgets {
  static AlertDialog pokemonInfoDialog(Pokemon pokemon) {
    return AlertDialog(
      title: tittlePokemonDialog(pokemon),
      content: contentPokemon(pokemon)
    );
  }

  static SizedBox contentPokemon(Pokemon pokemon, {double height = 100, double width = 100}){
    return SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TwoText(
                txt1: "Tipo",
                txt2: pokemon.type,
              ),
              TwoText(
                txt1: "Evolucion",
                txt2: pokemon.involvesTo,
              ),
              TwoText(
                txt1: "Ataques",
                txt2: pokemon.attacks,
              ),
              TwoText(
                txt1: "Habilidades",
                txt2: pokemon.abilities,
              ),
              TwoText(
                txt1: "Donde encontrar",
                txt2: pokemon.locationAreaEncounters,
              ),
            ],
          ),
        ),
      );
  }

  static Row tittlePokemonDialog(Pokemon pokemon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Hero(
            tag: pokemon.name,
            child: getImage(pokemon),
          ),
        ),
        Flexible(
          child: Container(
            color: Colors.black87,
            child: Wrap(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  pokemon.name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "#${pokemon.id}",
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ]),
          ),
        )
      ],
    );
  }

  static CachedNetworkImage getImage(Pokemon pokemon) {
    return CachedNetworkImage(
      imageUrl: pokemon.picture!,
      placeholder: (context, url) => Utils.imageAssetPokeBall,
      errorWidget: (context, url, error) => Utils.imageAssetPokeBall,
    );
  }
}