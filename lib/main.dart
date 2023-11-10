import 'package:examen_2/views/Detalles.dart';
import 'package:flutter/material.dart';
import 'package:examen_2/views/AgregarView.dart';
import 'package:examen_2/views/DatosLlamadaView.dart';

//YONIBER ENCARNACION
//2021-1442

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == '/Detalles') {
          final args = settings.arguments as Map<String, dynamic>;
          final title = args['title'];
          final photopath = args['photopath'];
          final date = args['date'];
          final description = args['description'];

          return MaterialPageRoute(
            builder: (context) {
              return Detalles(
                title: title,
                photoPath: photopath,
                date: date,
                description: description,
              );
            },
          );
        }
        return null;
      },
      title: 'Emergencia 911',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Emergencia 911'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int posicion = 0;
  String titulo = '';
  final Key = GlobalKey();

  static const List<Destination> allDestination = <Destination>[
    Destination(0, 'Agregar', Icons.add, Colors.grey),
    Destination(1, 'Lista', Icons.list, Colors.grey),
  ];

  void MostrarPantalla(int index) {
    setState(() {
      posicion = index;
      titulo = allDestination[index].title;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pantalla = [
      AgregarView(),
      KeyedSubtree(
        key: Key,
        child: DatosLlamadaView(),
      )
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(titulo,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Color.fromARGB(255, 223, 125, 118),
      ),
      body: pantalla[posicion],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color.fromARGB(255, 223, 125, 118),
        selectedIndex: posicion,
        onDestinationSelected: (int index) {
          MostrarPantalla(index);
        },
        destinations: allDestination.map((Destination destino) {
          return NavigationDestination(
              icon: Icon(destino.icon, color: Colors.white),
              label: destino.title);
        }).toList(),
      ),
    );
  }
}

class Destination {
  const Destination(this.index, this.title, this.icon, this.color);

  final int index;
  final String title;
  final IconData icon;
  final MaterialColor color;
}
