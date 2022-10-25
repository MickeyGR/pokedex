import 'dart:convert';

List<PokemonLocationAreaEncounters> pokemonLAEFromJson(String str) => List<PokemonLocationAreaEncounters>.from(json.decode(str).map((x) => PokemonLocationAreaEncounters.fromJson(x)));

String pokemonLAEToJson(List<PokemonLocationAreaEncounters> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class PokemonLocationAreaEncounters {
  LocationArea? locationArea;

  PokemonLocationAreaEncounters({this.locationArea});

  PokemonLocationAreaEncounters.fromJson(Map<String, dynamic> json) {
    locationArea = json['location_area'] != null
        ? LocationArea.fromJson(json['location_area'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (locationArea != null) {
      data['location_area'] = locationArea!.toJson();
    }
    return data;
  }
}

class LocationArea {
  String? name;

  LocationArea({this.name});

  LocationArea.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
