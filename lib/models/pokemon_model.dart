
class PokemonModel {
  String name;
  String img;
  List<String> type;
  String num;
  String height;
  String weight;
  String candy;
  int candy_count;
  String egg;
  List<double> multipliers;
  List<String> weaknesses;

  PokemonModel({
    required this.name,
    required this.img,
    required this.type,
    required this.num,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candy_count,
    required this.egg,
    required this.multipliers,
    required this.weaknesses,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json["name"],
        img: json["img"],
        //type: json["type"].map<String>((item)=>item).toList(),
        type: List<String>.from(json["type"].map((item) => item)),
        num: json["num"],
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        candy_count: json["candy_count"] ?? 0,
        egg: json["egg"],
        //multipliers: json["multipliers"] != null ? List<double>.from(json["multipliers"].map((item) => item)) : [],
        multipliers: List<double>.from((json["multipliers"] ?? []).map((item) => item)),
        weaknesses: List<String>.from((json["weaknesses"] ?? []).map((item) => item)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        // "type": type,
        "type": List<dynamic>.from(type.map((e) => e)),
        "num": num,
        "height": height,
        "weight": weight,
        "candy": candy,
        "candy_count": candy_count,
        "egg": egg,
        "multipliers": List<dynamic>.from((multipliers ?? []).map((e) => e)),
        "weaknesses": List<dynamic>.from((weaknesses ?? []).map((e) => e)),
      };
}
