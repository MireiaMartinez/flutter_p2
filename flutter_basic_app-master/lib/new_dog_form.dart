import 'package:basic_flutter_app/dog_model.dart';
import 'package:flutter/material.dart';

class AddDogFormPage extends StatefulWidget {
  @override
  _AddDogFormPageState createState() => new _AddDogFormPageState();
}

class _AddDogFormPageState extends State<AddDogFormPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  //--foto icono-- crear controlador------------------------------------------
  TextEditingController imagenUrlController = new TextEditingController();

  void submitPup(BuildContext context) {
    if (nameController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        backgroundColor: Colors.redAccent,
        content: new Text('Se neceita un nombe!'),
      ));
    } else {
      //--------------------------------------------------------------------------------------------- crear variavle -------
      var newDog = new Dog(nameController.text, locationController.text, descriptionController.text, imagenUrlController.text);
      Navigator.of(context).pop(newDog);
    }
  }
  //------- Agregar Casa ---------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Agregar casa'),
        backgroundColor: Colors.black87,
      ),
      body: new Container(
        color: Colors.black54,
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: new Column(children: [
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: nameController,
                onChanged: (v) => nameController.text = v,
                decoration: new InputDecoration(labelText: 'Nombre'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: locationController,
                onChanged: (v) => locationController.text = v,
                decoration: new InputDecoration(labelText: "Lema"),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: descriptionController,
                onChanged: (v) => descriptionController.text = v,
                decoration: new InputDecoration(labelText: 'Región'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Builder(
                builder: (context) {
                  return new RaisedButton(
                    onPressed: () => submitPup(context),
                    color: Colors.grey,
                    child: new Text('Añadir'),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
