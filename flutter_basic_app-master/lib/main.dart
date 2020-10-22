import 'package:flutter/material.dart';
import 'dart:async';

import 'dog_model.dart';
import 'dog_list.dart';
import 'new_dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego de Tronos', //Titulo de la app
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'Juego de Tronos', //Titulo inicio
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDoggos = []                                      //----------------especificar link foto-----------------
    ..add(Dog('Stark', 'Se acerca el Invierno','Región del Norte', 'https://vignette.wikia.nocookie.net/hieloyfuego/images/3/32/Casa_Stark_escudo.png/revision/latest?cb=20150129151112'))
    ..add(Dog('Targaryen', 'Fuego y Sangre', 'Región de Valyria y Tierras de la Corona', 'https://vignette.wikia.nocookie.net/hieloyfuego/images/4/4d/Casa_Targaryen_estandarte.png/revision/latest?cb=20161230200319'))
    ..add(Dog('Lannister', '¡Oye mi Rugido!','Región de las Tierras del Oeste', 'https://vignette.wikia.nocookie.net/hieloyfuego/images/6/66/Casa_Lannister_escudo.png/revision/latest/top-crop/width/360/height/450?cb=20161230202341'))
    ..add(Dog('Martell', 'Nunca Doblegado, Nunca Roto', 'Región de Dorne', 'https://vignette.wikia.nocookie.net/gameofthronesfanon/images/9/95/Casa_Martell.png/revision/latest?cb=20180927155748&path-prefix=es'))
    ..add(Dog('Baratheon', 'Nuestra es la Furia', 'Región de las Tierras de la Tormenta', 'https://vignette.wikia.nocookie.net/roldehieloyfuego/images/1/13/Casa_Baratheon_estandarte.png/revision/latest?cb=20140228070124&path-prefix=es'));

  Future _showNewDogForm() async {
    Dog newDog = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddDogFormPage();
    }));
    if (newDog != null) {
      initialDoggos.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.black87, // Fondo del titulo
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: new Container(
          //------cambiem el fons del programa------------------------------
          decoration: new BoxDecoration(
              image: DecorationImage(
              image: new NetworkImage(
                "https://images-na.ssl-images-amazon.com/images/I/81krm9kvHGL._AC_SL1500_.jpg"),
                fit: BoxFit.cover,
          )),
              
          child: new Center(
            child: new DogList(initialDoggos),
          )
          
          ),
    );
  }
}
