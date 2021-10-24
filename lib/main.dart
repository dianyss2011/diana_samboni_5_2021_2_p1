
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/characters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personajes'),
        ),
        body: Center(
          child: CharactersScreen()
        ),
      ),
    );
  }

 
}

