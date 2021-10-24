import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character.dart';

class CharacterScreen extends StatefulWidget {
  final Character character;

  CharacterScreen({ required this.character });

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hola mundo'),
    );
  }
}