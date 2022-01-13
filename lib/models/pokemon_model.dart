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
      };
}
