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

  factory Annonce.fromSqFliteDataBase(Map<String, dynamic> map) {
    int idA = map['idA'] as int? ?? 0;
    DateTime dateDebut = map['date_debut'] != null
        ? DateTime.parse(map['date_debut'] as String)
        : DateTime.now();
    DateTime dateFin = map['date_fin'] != null
        ? DateTime.parse(map['date_fin'] as String)
        : DateTime(2100);
    String etat = map['etat'] as String? ?? "ouverte";
    int idU = map['idU'] as int? ?? 0;
    int idP = map['idP'] as int? ?? 0;

    return Annonce(
      idA: idA,
      date_debut: dateDebut,
      date_fin: dateFin,
      etat: etat,
      idU: idU,
      idP: idP,
    );
  }


  void changerEtat(String nouvelEtat) {
    if (nouvelEtat == "ouverte" || nouvelEtat == "pourvue" || nouvelEtat == "cloture") {
      etat = nouvelEtat;
    } else {
      throw Exception("État invalide : $nouvelEtat");
    }
  }
}