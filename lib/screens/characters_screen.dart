import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/helpers/api_helper.dart';
import 'package:rick_and_morty_app/models/character.dart';
import 'package:rick_and_morty_app/models/response.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({ Key? key }) : super(key: key);

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {

  List<Character> _characters = [];

  @override
  void initState() {
    super.initState();
    _getCharacteres();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _getContent(),
    );
  }

   Future<Null> _getCharacteres() async {

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {

      await showAlertDialog(
        context: context,
        title: 'Error',
        message: 'Verifica que estés conectado a internet.',
        actions: <AlertDialogAction>[
          AlertDialogAction(key: null, label: 'Aceptar')
        ]
      );
      return;
    }

    Response response = await ApiHelper.getCharacters();

    if (!response.isSuccess) {
      await showAlertDialog(
        context: context,
        title: 'Error',
        message: response.message,
        actions: <AlertDialogAction>[
          AlertDialogAction(key: null, label: 'Aceptar')
        ]
      );
      return;
    }
    
    setState(() {
      _characters = response.result;
    });
  }

  Widget _getContent() {
    return ListView(
      children: _characters.map((e) {
        return Card(
          child: InkWell(
            onTap: () => _getCharacteres(),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/rick_and_morty.PNG'), 
                      image: NetworkImage(e.image),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                e.name, 
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}