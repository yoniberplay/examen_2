class DatosLlamada {
  int? id;
  String title;
  String date;
  String description;
  String photopath;

  DatosLlamada({
    this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.photopath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'date': this.date,
      'description': this.description,
      'photopath': this.photopath,
    };
  }

  factory DatosLlamada.fromMap(Map<String, dynamic> map) {
    return DatosLlamada(
      id: map['id'],
      title: map['title'] as String,
      date: map['date'] as String,
      description: map['description'] as String,
      photopath: map['photopath'] as String,
    );
  }
}
