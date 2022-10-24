class Pokemon {
  final String name;
  final int? id;
  final String? type;
  final List<String>? involvesTo;
  final List<String>? attacks;
  final List<String>? abilities;
  final List<String>? locationAreaEncounters;
  final String? picture;

  Pokemon(
    this.name, {
    this.id,
    this.type,
    this.involvesTo,
    this.attacks,
    this.abilities,
    this.locationAreaEncounters,
    this.picture,
  });
}
