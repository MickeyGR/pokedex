import 'dart:convert';

PokemonUrls pokemonUrlsFromJson(String str) =>
    PokemonUrls.fromJson(json.decode(str));

String pokemonUrlsToJson(PokemonUrls data) => json.encode(data.toJson());

class PokemonUrls {
  List<Results>? results;

  PokemonUrls({this.results});

  PokemonUrls.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? name;
  String? url;
  int? id;

  Results({this.name, this.url, this.id});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    id = idExtractor(url);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['id'] = id;
    return data;
  }

  int? idExtractor(String? url) {
    if (url == null) {
      return null;
    }
    try {
      List<String> res = url.split('/');
      int urlLength = res.length;
      return int.tryParse(res[urlLength - 2]);
    } catch (e) {
      return null;
    }
  }
}
