import 'package:floor/floor.dart';
/*
*Este modelo nos sirve tanto para insertar en la base
* de datos local como para las peticiones a la 
*/
@Entity(tableName: "Pokemons")
class Pokemon {
  @PrimaryKey()
  final int id;
  final String name;
  final String? type;
  final String? involvesTo;
  final String? attacks;
  final String? abilities;
  final String? locationAreaEncounters;
  final String? picture;

  Pokemon({
    required this.id,
    required this.name,
    this.type,
    this.involvesTo,
    this.attacks,
    this.abilities,
    this.locationAreaEncounters,
    this.picture,
  });
}
