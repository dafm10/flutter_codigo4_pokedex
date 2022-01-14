import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_pokedex/models/pokemon_model.dart';
import 'package:flutter_codigo4_pokedex/pages/pokemon_detail_page.dart';
import 'package:flutter_codigo4_pokedex/ui/general/colors.dart';
import 'package:flutter_codigo4_pokedex/ui/widgets/type_pokemon_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokemons = [];
  List<PokemonModel> pokemonsFinal = [];

  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    // Uri _uri = Uri.parse(
    //   "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json",
    // );
    Uri _uri = Uri.parse(
      "https://percoms.com.pe/pokedex.json",
    );
    http.Response response = await http.get(_uri);
    // print(response.body);
    // print(response.statusCode);
    // print(response.body.runtimeType);
    // print(json.decode(response.body).runtimeType);
    // print(response.statusCode);
    Map<String, dynamic> myMap = json.decode(response.body);
    // pokemons = map["pokemon"];

    // map["pokemon"].forEach((item){
    //   PokemonModel auxiliar = PokemonModel.fromJson(item);
    //   pokemonsFinal.add(auxiliar);
    // });
    //
    // print(myMap["pokemon"][0]["name"]);

    pokemonsFinal = myMap["pokemon"]
        .map<PokemonModel>((item) => PokemonModel.fromJson(item))
        .toList();

    setState(() {});

    // print(pokemonsFinal[0].name.toUpperCase());

    // print(map["pokemon"][0]["candy"]);
    // print(map["pokemon"][4]["weaknesses"]);
    //
    // map["pokemon"][4]["weaknesses"].forEach((item){
    //   print(item);
    // });
    //
    // for(int i = 0; i < 20 ; i++){
    //   print("- ${map["pokemon"][i]["name"]}");
    //  map["pokemon"][i]["weaknesses"].forEach((item){
    //    print(" * ${item}");
    //  });
    //  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Example"),
      // ),
      // body: ListView.builder(
      //   itemCount: pokemonsFinal.length,
      //   itemBuilder: (BuildContext context, int index){
      //     return ListTile(
      //       leading: CircleAvatar(
      //         backgroundImage: NetworkImage(pokemonsFinal[index].img),
      //       ),
      //       title: Text(pokemonsFinal[index].name),
      //     );
      //   },
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Pokedex",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: COLOR_FONT_PRIMARY,
                  ),
                ),
                const SizedBox(height: 20.0,),
                GridView.count(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1.3, // reduce el temaño del grid
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: pokemonsFinal
                      .map<Widget>(
                        (item) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PokemonDetailPage(pokemon: item,),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: colorPokemon[item.type[0]],
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: -24,
                                  right: -14,
                                  child: Image.asset(
                                    'assets/images/pokeball.png',
                                    height: 120.0,
                                    color: Colors.white.withOpacity(0.21),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Image.network(
                                    item.img,
                                    height: 110.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item.name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                      Column(
                                          children: item.type
                                              .map<Widget>(
                                                  (e) => TypePokemonWidget(
                                                        title: e,
                                                        type: item.type[0],
                                                      ))
                                              .toList()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
