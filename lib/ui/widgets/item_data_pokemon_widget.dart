import 'package:flutter/material.dart';

class ItemDataPokemonWidget extends StatelessWidget {
  String title;
  String data;

  ItemDataPokemonWidget({required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: TextStyle(
              color: Colors.black54
            ),
          ),
          Text(
            data,
          ),
        ],
      ),
    );
  }
}
