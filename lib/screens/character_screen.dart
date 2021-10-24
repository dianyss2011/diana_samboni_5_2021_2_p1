import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character.dart';

class CharacterScreen extends StatefulWidget {
  final Character character;

  CharacterScreen({ required this.character });

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late Character _character;

  @override
  void initState() {
    super.initState();
    _character = widget.character;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9dd9df),
        title: Text(_character.name)
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: _getContent(),
          )
        ],
      )
    );
  }

  Widget _getContent() {
    return Column(
      children: <Widget>[
        _showCharacterInfo(),
        _character.episode.length == 0 ? _noContent() : _getListView()
      ],
    );
  }

  Widget _getListView() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: <Widget>[
                          Text(
                            'Episodios',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            _getEpisodes(),
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _noContent() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        'El personaje no tiene capítulos registrados',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF9dd9df),
        ),
      ),
    );
  }

  Widget _showCharacterInfo() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                child: FadeInImage(
                  placeholder: AssetImage('assets/rick_and_morty.png'), 
                  image: NetworkImage(_character.image),
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover
                )
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Id: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                          Text(
                            _character.id.toString(), 
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          Text(
                            'Nombre: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                          Text(
                            _character.name, 
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          Text(
                            'Estado: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                          Text(
                            _character.status, 
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          Text(
                            'Especie: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                          Text(
                            _character.species, 
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          Text(
                            'Tipo: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                          Text(
                            _character.type, 
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          Text(
                            'Género: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                          Text(
                            _character.gender, 
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Text(
                            'Origen',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Nombre: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                          Text(
                            _character.origin.name, 
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Url: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                          Text(
                            _character.origin.url, 
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Text(
                            'Localización',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Nombre: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                          Text(
                            _character.location.name, 
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Url: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                          Text(
                            _character.location.url, 
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Text(
                            'Url: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                          Text(
                            _character.url, 
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          Text(
                            'Creación: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9dd9df),
                            )
                          ),
                          Text(
                            _character.created, 
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ]
                  ),
                )
              ]
            )
          ),
        ],
      ),
    );
  }

  String _getEpisodes() {
    var episodes = "";

    for (var e in _character.episode) {
      episodes += e + "\n\r";
    }

    return episodes;
  }
}