import 'dart:convert';

PokemonDataDefault pokemonDataDefaultFromJson(String str) =>
    PokemonDataDefault.fromJson(json.decode(str));

String pokemonDataDefaulToJson(PokemonDataDefault data) =>
    json.encode(data.toJson());

class PokemonDataDefault {
  List<Abilities>? abilities;
  int? id;
  String? name;
  String? locationAreaEncounters;
  List<Types>? types;

  PokemonDataDefault(
      {this.abilities, this.id, this.name, this.locationAreaEncounters, this.types});

  PokemonDataDefault.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(Abilities.fromJson(v));
      });
    }
    id = json['id'];
    name = json['name'];
    locationAreaEncounters = json['location_area_encounters'];
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['name'] = name;
    data['location_area_encounters'] = locationAreaEncounters;
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Abilities {
  Ability? ability;

  Abilities({this.ability});

  Abilities.fromJson(Map<String, dynamic> json) {
    ability =
        json['ability'] != null ? Ability.fromJson(json['ability']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ability != null) {
      data['ability'] = ability!.toJson();
    }
    return data;
  }
}

class Ability {
  String? name;

  Ability({this.name});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Types {
  Ability? type;

  Types({this.type});

  Types.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? Ability.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}
