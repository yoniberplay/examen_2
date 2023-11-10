import 'package:examen_2/model/DatosLlamada.dart';
import 'package:examen_2/services/DatabaseHelper.dart';
import 'package:flutter/material.dart';

class DatosLlamadaView extends StatefulWidget {
  @override
  _DatosLlamadaViewState createState() => _DatosLlamadaViewState();
}

class _DatosLlamadaViewState extends State<DatosLlamadaView> {
  List<DatosLlamada> lista = [];
  TextEditingController nombreControler = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadcall();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadcall() async {
    List<DatosLlamada> listemp = [];
    listemp = await DB.DatosLlamadaList();
    setState(() {
      lista = listemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 125, 118),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text('Historial de llamadas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 20),
          lista.length != 0
              ? Expanded(
                  child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    DatosLlamada task = lista[index];
                    return ListTile(
                      tileColor: Color.fromARGB(255, 223, 125, 118),
                      textColor: Colors.white,
                      title: Text(task.title),
                      subtitle: Text(task.date),
                      leading: Text(task.id.toString() as String),
                      trailing: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/Detalles', arguments: {
                          'title': task.title,
                          'date': task.date,
                          'photopath': task.photopath,
                          'description': task.description,
                        });
                      },
                    );
                  },
                ))
              : const Text('No hay registros aun'),
        ],
      ),
    );
  }
}
