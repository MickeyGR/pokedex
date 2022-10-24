// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_management.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppManagement on _AppManagement, Store {
  late final _$asyncPokemonUrlsControllerAtom =
      Atom(name: '_AppManagement.asyncPokemonUrlsController', context: context);

  @override
  ObservableFuture<PokemonUrls?>? get asyncPokemonUrlsController {
    _$asyncPokemonUrlsControllerAtom.reportRead();
    return super.asyncPokemonUrlsController;
  }

  @override
  set asyncPokemonUrlsController(ObservableFuture<PokemonUrls?>? value) {
    _$asyncPokemonUrlsControllerAtom
        .reportWrite(value, super.asyncPokemonUrlsController, () {
      super.asyncPokemonUrlsController = value;
    });
  }

  late final _$pokemonUrlsAtom =
      Atom(name: '_AppManagement.pokemonUrls', context: context);

  @override
  PokemonUrls? get pokemonUrls {
    _$pokemonUrlsAtom.reportRead();
    return super.pokemonUrls;
  }

  @override
  set pokemonUrls(PokemonUrls? value) {
    _$pokemonUrlsAtom.reportWrite(value, super.pokemonUrls, () {
      super.pokemonUrls = value;
    });
  }

  late final _$pokemonsAtom =
      Atom(name: '_AppManagement.pokemons', context: context);

  @override
  List<Pokemon>? get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(List<Pokemon>? value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$setAsyncPokemonsAsyncAction =
      AsyncAction('_AppManagement.setAsyncPokemons', context: context);

  @override
  Future<void> setAsyncPokemons() {
    return _$setAsyncPokemonsAsyncAction.run(() => super.setAsyncPokemons());
  }

  @override
  String toString() {
    return '''
asyncPokemonUrlsController: ${asyncPokemonUrlsController},
pokemonUrls: ${pokemonUrls},
pokemons: ${pokemons}
    ''';
  }
}
