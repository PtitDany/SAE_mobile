class Annonce{
  int idA;
  DateTime date_debut;
  DateTime date_fin;
  String etat;
  int idU;
  int idP;

  Annonce({
    required this.idA,
    required this.date_debut,
    required this.date_fin,
    required this.etat,
    required this.idU,
    required this.idP,

  });

  factory Annonce.fromSqFliteDataBase(Map<String, dynamic> map) => Annonce(
    idA: map['idA'].toInt ?? 0,
    date_debut: map['date_debut'] ?? DateTime.now(),
    date_fin: map['date_fin'] ?? DateTime(2100),
    etat: map['etat'] ?? "default",
    idU: map['idU'].toInt ?? 0,
    idP: map['idP'].toInt ?? 0,
  );
}