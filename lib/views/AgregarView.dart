import 'package:examen_2/model/DatosLlamada.dart';
import 'package:examen_2/services/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

//YONIBER ENCARNACION
//2021-1442

class AgregarView extends StatefulWidget {
  @override
  _AgregarView createState() => _AgregarView();
}

class _AgregarView extends State<AgregarView> {
  List<DatosLlamada> lista = [];
  TextEditingController titulocontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  XFile? _image;
  String imagepath = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _image = pickedImage;
    });
  }

  _addCall() async {
    DateTime now = DateTime.now();
    String fecha = DateFormat('dd-MM-yyyy HH:mm:ss').format(now);
    String titulo = titulocontroller.text;
    String descripcion = descriptioncontroller.text;
    String imagenPath = _image == null ? '' : _image!.path;

    print(titulo);
    print(descripcion);

    if (!titulo.isNotEmpty || !descripcion.isNotEmpty) {
      _showAlert();
      return;
    }

    print(imagenPath);

    DB.insert(DatosLlamada(
        title: titulo,
        date: fecha,
        description: descripcion,
        photopath: imagenPath));
    titulocontroller.clear();
    descriptioncontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 125, 118),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            //YONIBER ENCARNACION
//2021-1442
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Center(
                  child: Text(
                    'Registrar llamada',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 350,
                  child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: titulocontroller,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          focusColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          labelText: 'Titulo',
                          hintText: 'Ingrese su titulo',
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          fillColor: Colors.white)),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 350,
                  child: TextField(
                      maxLines: 5,
                      style: const TextStyle(color: Colors.white),
                      controller: descriptioncontroller,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          focusColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          labelText: 'Descripcion',
                          hintText: 'Ingrese una descripcion',
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          fillColor: Colors.white)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: _pickImage,
                    child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Agregar'),
                          Icon(Icons.add_a_photo)
                        ])),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addCall,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Text('Guardar'), Icon(Icons.save)],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAlert() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Datos incompletos."),
            content: const SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Titulo y descripción son campos obligatorios",
                      style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Aceptar'))
            ],
          );
        });
  }
}
