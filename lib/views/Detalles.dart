import 'dart:io';

import 'package:flutter/material.dart';

class Detalles extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final String photoPath;

  Detalles({
    required this.date,
    required this.title,
    required this.description,
    required this.photoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 125, 118),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 223, 125, 118),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            photoPath != null && photoPath.isNotEmpty
                ? Image.file(
                    File(photoPath),
                    width: 200,
                    height: 200,
                  )
                : const Text('No se tomaron fotos ese dia'),
            const SizedBox(
              height: 20,
            ),
            //YONIBER ENCARNACION
            //2021-1442
            Text(
              date,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              description,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
