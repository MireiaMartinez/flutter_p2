import 'package:flutter/material.dart';
import 'dog_model.dart';
import 'dart:async';

class DogDetailPage extends StatefulWidget {
  final Dog dog;
  DogDetailPage(this.dog);

  @override
  _DogDetailPageState createState() => new _DogDetailPageState();
}

class _DogDetailPageState extends State<DogDetailPage> {
  final double dogAvarterSize = 150.0;
  double _sliderValue = 0.0;
//-----------barra qualificar --------------------
  Widget get addYourRating {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Flexible(
                flex: 1,
                child: new Slider(
                  activeColor: Colors.grey, //----Color votación
                  min: 0.0,
                  max: 10.0, //----Maxima votacion
                  value: _sliderValue,
                  onChanged: (newRating) {
                    setState(() {
                      _sliderValue = newRating;
                    });
                  },
                ),
              ),
              new Container(
                width: 50.0,
                alignment: Alignment.center,
                child: new Text('${_sliderValue.toInt()}',
                    style: Theme.of(context).textTheme.display1),
              ),
            ],
          ),
        ),
        submitRatingButton,
      ],
    );
  }
  //---------Mensaje error < ----------
  void updateRating() {
    if (_sliderValue < 3) { 
      _ratingErrorDialog();
    } else {
      setState(() {
        widget.dog.rating = _sliderValue.toInt();
      });
    }
  }

  Future<Null> _ratingErrorDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Error!'),
            content: new Text("Seguro que quieres darle esa puntuacion."),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Prueba otra vez'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }
  //-------boton perfIl perro--------------------
  
  Widget get submitRatingButton {
    return new RaisedButton(
      onPressed: () => updateRating(),
      child: new Text('Submit'),
      color: Colors.grey,
    );
  }

  Widget get dogImage {
    return new Hero(
      tag: widget.dog,
      child: new Container(
        height: dogAvarterSize,
        width: dogAvarterSize,
        constraints: new BoxConstraints(),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: new NetworkImage(widget.dog.imageUrl ?? ''))),
      ),
    );
  }

  Widget get rating {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.star,
          size: 40.0,
        ),
        new Text(
          '${widget.dog.rating}/10',
          style: Theme.of(context).textTheme.display2,
        )
      ],
    );
  }

  Widget get dogProfile {
    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 32.0),
      decoration: new BoxDecoration(
              //------- Cambio fondo perfil -----------------------------------------------------------------------
              image: DecorationImage(
              image: new NetworkImage(
                "https://i.pinimg.com/originals/6a/4d/b1/6a4db1703eaad91000a34e30a6a32bc8.jpg"),
                fit: BoxFit.cover,
          )),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          new Text(
            '${widget.dog.name}',
            style: TextStyle(fontSize: 32.0),
          ),
          new Text(
            widget.dog.location,
            style: TextStyle(fontSize: 20.0),
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: new Text(widget.dog.description),
          ),
          rating
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black, // padding puntuacion
      appBar: new AppBar(
        backgroundColor: Colors.black, // padding titulo
        title: new Text('Casa ${widget.dog.name}'),
      ),
      body: new ListView(
        children: <Widget>[dogProfile, addYourRating],
      ),
    );
  }
}
