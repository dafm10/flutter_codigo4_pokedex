import 'package:flutter/material.dart';
import 'package:flutter_codigo4_pokedex/ui/general/colors.dart';

class TypePokemonWidget extends StatelessWidget {

  String title;
  String type;

  TypePokemonWidget({required this.title, required this.type, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.0, top: 4.0, right: 6.0),
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: colorPokemon[type],
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.14),
            offset: Offset(4, 4),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13.0,
        ),
      ),
    );
  }
}
