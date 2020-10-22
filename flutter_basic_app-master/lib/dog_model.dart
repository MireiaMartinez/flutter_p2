import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;
  String photoUrl; //------agregar variable

  int rating = 10;
  //--------------------------------------------- especificar donde va a ir la variable------
  Dog(this.name, this.location, this.description, this.photoUrl);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }
    HttpClient http = new HttpClient();
    try {
      imageUrl = photoUrl;
    } catch (exception) {
      print(exception);
    }
  }
}
