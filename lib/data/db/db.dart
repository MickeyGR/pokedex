import 'dart:async';
import 'package:floor/floor.dart';
import 'package:pokedex/data/db/repositories/pokemons_dao.dart';
import 'package:pokedex/data/model/pokemon.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

//Todas las importaciones anteriores son requeridas para usar Floor

part 'db.g.dart'; 

@Database(version: 1, entities: [Pokemon])
abstract class DB extends FloorDatabase {
  PokemonsDao get pokemonsRepositoryDao;
}