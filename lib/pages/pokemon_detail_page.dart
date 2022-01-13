import 'package:flutter/material.dart';
import 'package:flutter_codigo4_pokedex/models/pokemon_model.dart';
import 'package:flutter_codigo4_pokedex/ui/general/colors.dart';
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
                      Column(
                        children: [
                          Text("About"),
                          Row(
                            children: [
                              Text("Height: "),
                              Text(pokemon.height),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Weight: "),
                              Text(pokemon.weight),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Candy: "),
                              Text(pokemon.candy),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Candy Count: "),
                              Text(pokemon.candy_count.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Egg: "),
                              Text(pokemon.egg),
                            ],
                          ),
                        ],
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
