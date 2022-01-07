import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Pokemon({
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.candyCount,
    this.egg,
    this.spawnChance,
    this.avgSpawns,
    this.spawnTime,
    this.multipliers,
    this.weaknesses,
    this.prevEvolution,
    this.nextEvolution,
  });

  final int? id;
  final String? num;
  final String? name;
  final String? img;
  final List<String>? type;
  final String? height;
  final String? weight;
  final String? candy;
  final int? candyCount;
  final String? egg;
  final double? spawnChance;
  final double? avgSpawns;
  final String? spawnTime;
  final List<double>? multipliers;
  final List<String>? weaknesses;
  final List<Evolution>? prevEvolution;
  final List<Evolution>? nextEvolution;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        img: json["img"],
        type: json["type"] == null
            ? null
            : List<String>.from(json["type"].map((x) => x)),
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        candyCount: json["candy_count"],
        egg: json["egg"],
        spawnChance: json["spawn_chance"] == null
            ? null
            : json["spawn_chance"].toDouble(),
        avgSpawns:
            json["avg_spawns"] == null ? null : json["avg_spawns"].toDouble(),
        spawnTime: json["spawn_time"],
        multipliers: json["multipliers"] == null
            ? null
            : List<double>.from(json["multipliers"].map((x) => x.toDouble())),
        weaknesses: json["weaknesses"] == null
            ? null
            : List<String>.from(json["weaknesses"].map((x) => x)),
        prevEvolution: json["prev_evolution"] == null
            ? null
            : List<Evolution>.from(
                json["prev_evolution"].map((x) => Evolution.fromJson(x))),
        nextEvolution: json["next_evolution"] == null
            ? null
            : List<Evolution>.from(
                json["next_evolution"].map((x) => Evolution.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "num": num,
        "name": name,
        "img": img,
        "type": type == null ? null : List<dynamic>.from(type!.map((x) => x)),
        "height": height,
        "weight": weight,
        "candy": candy,
        "candy_count": candyCount,
        "egg": egg,
        "spawn_chance": spawnChance,
        "avg_spawns": avgSpawns,
        "spawn_time": spawnTime,
        "multipliers": multipliers == null
            ? null
            : List<dynamic>.from(multipliers!.map((x) => x)),
        "weaknesses": weaknesses == null
            ? null
            : List<dynamic>.from(weaknesses!.map((x) => x)),
        "prev_evolution": prevEvolution == null
            ? null
            : List<dynamic>.from(prevEvolution!.map((x) => x.toJson())),
        "next_evolution": nextEvolution == null
            ? null
            : List<dynamic>.from(nextEvolution!.map((x) => x.toJson())),
      };
}

class Evolution {
  Evolution({
    this.num,
    this.name,
  });

  final String? num;
  final String? name;

  factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        num: json["num"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "num": num,
        "name": name,
      };
}
