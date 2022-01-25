import 'package:flutter/material.dart';
import 'package:flutter_codigo4_pokedex/models/pokemon_model.dart';
import 'package:flutter_codigo4_pokedex/ui/general/colors.dart';
import 'package:flutter_codigo4_pokedex/ui/widgets/item_data_pokemon_widget.dart';
import 'package:flutter_codigo4_pokedex/ui/widgets/type_pokemon_widget.dart';

class PokemonDetailPage extends StatelessWidget {
  PokemonModel pokemon;

  PokemonDetailPage({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPokemon[pokemon.type[0]],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            right: 0,
            top: MediaQuery.of(context).size.height * 0.11,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: MediaQuery.of(context).size.height * 0.22,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemon.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 34.0,
                          ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Row(
                            children: pokemon.type
                                .map<Widget>((e) => TypePokemonWidget(
                                      title: e,
                                      type: pokemon.type[0],
                                    ))
                                .toList()),
                      ],
                    ),
                    Text(
                      "#${pokemon.num}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "About",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ItemDataPokemonWidget(
                              title: "Height",
                              data: pokemon.height,
                            ),
                            ItemDataPokemonWidget(
                              title: "Weight",
                              data: pokemon.weight,
                            ),
                            ItemDataPokemonWidget(
                              title: "Candy",
                              data: pokemon.candy,
                            ),
                            ItemDataPokemonWidget(
                              title: "Candy Count",
                              data: pokemon.candy_count.toString(),
                            ),
                            ItemDataPokemonWidget(
                              title: "Egg",
                              data: pokemon.egg,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 0.0),
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
                                      "Multipliers: ",
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: pokemon.multipliers
                                        .map<Widget>(
                                          (e) => Container(
                                            margin: const EdgeInsets.only(
                                                right: 4.0, left: 2.0),
                                            child: Chip(
                                              backgroundColor:
                                                  Color(0xff14213d),
                                              label: Text(
                                                e.toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 0.0),
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
                                      "Weaknesses: ",
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: pokemon.weaknesses
                                            .map<Widget>(
                                              (e) => Container(
                                                margin: const EdgeInsets.only(
                                                    right: 5.0, left: 2.0),
                                                child: Chip(
                                                  backgroundColor:
                                                      Color(0xff14213d),
                                                  label: Text(
                                                    e,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 0.0),
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
                                      "Next Evolution: ",
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: pokemon.nextEvolution
                                            .map<Widget>(
                                              (e) => Container(
                                                margin: const EdgeInsets.only(right: 5.0, left: 2.0),
                                                child: Chip(
                                                  backgroundColor:
                                                      Color(0xff14213d),
                                                  label: Text(
                                                    e["name"],
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 0.0),
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
                                      "Pre Evolution: ",
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: pokemon.preEvolution
                                            .map<Widget>(
                                              (e) => Container(
                                            margin: const EdgeInsets.only(right: 5.0, left: 2.0),
                                            child: Chip(
                                              backgroundColor:
                                              Color(0xff14213d),
                                              label: Text(
                                                e["name"],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        top: -100,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.network(
                            pokemon.img,
                            height: 140.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
