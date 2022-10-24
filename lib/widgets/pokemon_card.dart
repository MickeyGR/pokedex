import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/data/model/pokemon.dart';
import 'package:pokedex/utils/utils.dart';
import 'package:pokedex/widgets/hero_dialog_route.dart';
import 'package:pokedex/widgets/two_txt.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemon,
    required this.index,
  }) : super(key: key);

  final Pokemon pokemon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            HeroDialogRoute(
              builder: (BuildContext context) {
                return pokemonInfo();
              },
            ),
          );
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${index + 1}",
                        style: Utils.txtStyleBoldBlack,
                      ),
                    ),
                    Hero(
                      tag: pokemon.name,
                      child: getImage(),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      "#${pokemon.id} - ${pokemon.name}",
                      style: Utils.txtStyleBoldBlack,
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  AlertDialog pokemonInfo() {
    return AlertDialog(
      title: tittlePokemonDialog(),
      content: SizedBox(
        height: 100,
        width: 100,
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
      ),
    );
  }

  Row tittlePokemonDialog() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Hero(
            tag: pokemon.name,
            child: getImage(),
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

  CachedNetworkImage getImage() {
    return CachedNetworkImage(
        imageUrl: pokemon.picture!,
        placeholder: (context, url) => Utils.imageAssetPokeBall,
        errorWidget: (context, url, error) => Utils.imageAssetPokeBall,
     );
  }
}
