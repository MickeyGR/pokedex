import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/controllers/app_management.dart';
import 'package:pokedex/data/model/pokemon.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final AppManagement aMgnt;
  final GlobalKey<LiquidPullToRefreshState> refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  String searchText = "";
  // ignore: prefer_final_fields
  TextEditingController _controller =
      TextEditingController(text: "");
  HomePage({super.key, required this.aMgnt});

  @override
  Widget build(BuildContext context) {
    aMgnt.setAsyncPokemons();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: AnimatedSearchBar(
          animationDuration: 150,
          label: "Pokedex",
          controller: _controller,
          labelStyle: const TextStyle(fontSize: 16),
          searchStyle: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          searchDecoration: const InputDecoration(
            hintText: "Buscar pokemon",
            alignLabelWithHint: true,
            fillColor: Colors.white,
            focusColor: Colors.white,
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            //TODO: implementar filtro con MobX
          },
        ),
      ),
      body: LiquidPullToRefresh(
        color: Colors.red,
        backgroundColor: Colors.black,
        onRefresh: () => init(),
        key: refreshIndicatorKey,
        child: Observer(builder: (context) {
          if (aMgnt.asyncPokemonUrlsController == null ||
              aMgnt.pokemons == null) {
            return ListView();
          }
          if (aMgnt.asyncPokemonUrlsController!.status ==
              FutureStatus.pending) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Image.asset("assets/gif/pokeball_gif.gif"),
              ),
            );
          }
          return GridView.builder(
            itemCount: aMgnt.pokemons!.length,
            itemBuilder: (BuildContext context, int index) {
              Pokemon pokemon = aMgnt.pokemons![index];
              return PokemonCard(pokemon: pokemon, index: index);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          );
        }),
      ),
    );
  }

  Future<void> init() async {
    aMgnt.setAsyncPokemons();
  }
}
