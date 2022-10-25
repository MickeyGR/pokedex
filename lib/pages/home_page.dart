import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/controllers/app_management.dart';
import 'package:pokedex/data/model/pokemon.dart';
import 'package:pokedex/utils/utils.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final AppManagement aMgnt;
  final GlobalKey<LiquidPullToRefreshState> refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  String searchText = "";
  // ignore: prefer_final_fields
  TextEditingController _controller = TextEditingController(text: "");
  HomePage({super.key, required this.aMgnt});

  @override
  Widget build(BuildContext context) {
    aMgnt.setAsyncPokemons();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: searchBar(),
        actions: [
          IconButton(
            onPressed: () {
              if (aMgnt.isOffline) {
                final snackBar = SnackBar(
            content: const Text("No se pueden hacer peticiones a la PokeApi sin internet"),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
               Navigator.pushNamed(context, '/pokeapi');
              }
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: LiquidPullToRefresh(
        color: Colors.red,
        backgroundColor: Colors.black,
        onRefresh: () => Utils.init(aMgnt),
        key: refreshIndicatorKey,
        child: Observer(builder: (context) {
          if (aMgnt.pokemons == null) {
            return ListView();
          }

          if (aMgnt.asyncPokemonUrlsController != null &&
              aMgnt.asyncPokemonUrlsController!.status ==
                  FutureStatus.pending) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Image.asset("assets/gif/pokeball_gif.gif"),
              ),
            );
          }

          return GridView.builder(
            //Si los la lista de pokemones filtrados tiene datos muestro esa
            itemCount: (aMgnt.leakedPokemons!.isNotEmpty)
                ? aMgnt.leakedPokemons!.length
                : aMgnt.pokemons!.length,
            itemBuilder: (BuildContext context, int index) {
              Pokemon pokemon = (aMgnt.leakedPokemons!.isNotEmpty)
                  ? aMgnt.leakedPokemons![index]
                  : aMgnt.pokemons![index];
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

  AnimatedSearchBar searchBar() {
    return AnimatedSearchBar(
      animationDuration: 150,
      label: "Pokedex",
      controller: _controller,
      labelStyle: const TextStyle(fontSize: 16),
      searchStyle: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      searchIcon: const Icon(Icons.filter_list_alt),
      searchDecoration: const InputDecoration(
        hintText: "Filtrar pokemon",
        alignLabelWithHint: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        hintStyle: TextStyle(color: Colors.white70),
        border: InputBorder.none,
      ),
      onChanged: (String buscar) {
        filtrarPokemones(buscar);
      },
    );
  }

  filtrarPokemones(String busqueda) {
    List<Pokemon> pokemons = aMgnt.pokemons!.where((p) {
      return (p.name.toLowerCase().contains(busqueda.toLowerCase()));
    }).toList();
    aMgnt.leakedPokemons = pokemons;
  }
}
