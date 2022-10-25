import 'package:flutter/material.dart';
import 'package:pokedex/data/model/pokemon.dart';
import 'package:pokedex/utils/utils.dart';
import 'package:pokedex/widgets/hero_dialog_route.dart';
import 'package:pokedex/widgets/pokemon_info_widgets.dart';

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
                return PokemonInfoWidgets.pokemonInfoDialog(pokemon);
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
                    if (index != -1)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${index + 1}",
                          style: Utils.txtStyleBoldBlack,
                        ),
                      ),
                    Hero(
                      tag: pokemon.name,
                      child: PokemonInfoWidgets.getImage(pokemon),
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
}