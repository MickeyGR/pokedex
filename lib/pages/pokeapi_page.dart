import 'package:flutter/material.dart';
import 'package:pokedex/data/api/models/pokemon_data_default.dart';
import 'package:pokedex/data/api/services/api.dart';
import 'package:pokedex/data/controller/data_controller.dart';
import 'package:pokedex/data/model/pokemon.dart';
import 'package:pokedex/utils/utils.dart';
import 'package:pokedex/widgets/pokemon_info_widgets.dart';

class PokeAPIPage extends StatefulWidget {
  const PokeAPIPage({super.key});

  @override
  State<PokeAPIPage> createState() => _PokeAPIPageState();
}

class _PokeAPIPageState extends State<PokeAPIPage> {
  Pokemon? pokemon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("PokeAPI"),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.info_outline),
            itemBuilder: ((context) => [
                  const PopupMenuItem(
                    child: Text(
                        "1. Busca pokemones automaticamente solo con ingresar su ID."),
                  ),
                  const PopupMenuItem(
                    child: Text(
                        '2. Para buscar pokemon por nombre debes dar click en el boton de "Listo" del teclado.'),
                  )
                ]),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      onChanged: (value) async {
                        if (int.tryParse(value) != null) {
                          await searchPokemon(value);
                        }
                        setState(() {});
                      },
                      onSubmitted: (value) async {
                        await searchPokemon(value);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Pokemon Id o Nombre',
                      ),
                    ),
                  ),
                  (pokemon != null)
                      ? Column(
                          children: [
                            PokemonInfoWidgets.tittlePokemonDialog(pokemon!),
                            PokemonInfoWidgets.contentPokemon(pokemon!,
                                height: 200, width: 200),
                          ],
                        )
                      : Utils.imageAssetPokeBall
                ],
              ),
            ),
          ),
          //Text("${(pokemon != null) ? pokemon!.picture : "hola"}")
        ],
      ),
    );
  }

  Future<void> searchPokemon(dynamic value) async {
    try {
      PokemonDataDefault? pokemonDD;
      pokemonDD = await Api.pokemon(value);
      if (pokemonDD != null) {
        pokemon = await DataController.parsePokemonDDtoPokemon(pokemonDD);
      }
    } catch (e) {
      pokemon = null;
    }
    setState(() {});
  }
}
