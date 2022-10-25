// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_management.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppManagement on _AppManagement, Store {
  late final _$isOfflineAtom =
      Atom(name: '_AppManagement.isOffline', context: context);

  @override
  bool get isOffline {
    _$isOfflineAtom.reportRead();
    return super.isOffline;
  }

  @override
  set isOffline(bool value) {
    _$isOfflineAtom.reportWrite(value, super.isOffline, () {
      super.isOffline = value;
    });
  }

  late final _$connectivityStreamAtom =
      Atom(name: '_AppManagement.connectivityStream', context: context);

  @override
  ObservableStream<ConnectivityResult> get connectivityStream {
    _$connectivityStreamAtom.reportRead();
    return super.connectivityStream;
  }

  @override
  set connectivityStream(ObservableStream<ConnectivityResult> value) {
    _$connectivityStreamAtom.reportWrite(value, super.connectivityStream, () {
      super.connectivityStream = value;
    });
  }

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

  late final _$leakedPokemonsAtom =
      Atom(name: '_AppManagement.leakedPokemons', context: context);

  @override
  List<Pokemon>? get leakedPokemons {
    _$leakedPokemonsAtom.reportRead();
    return super.leakedPokemons;
  }

  @override
  set leakedPokemons(List<Pokemon>? value) {
    _$leakedPokemonsAtom.reportWrite(value, super.leakedPokemons, () {
      super.leakedPokemons = value;
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
isOffline: ${isOffline},
connectivityStream: ${connectivityStream},
asyncPokemonUrlsController: ${asyncPokemonUrlsController},
pokemonUrls: ${pokemonUrls},
pokemons: ${pokemons},
leakedPokemons: ${leakedPokemons}
    ''';
  }
}
