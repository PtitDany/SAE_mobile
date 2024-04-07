class Produit {
  int idP;
  String nomP;
  String description;
  int idCat;
  int idU;
  String etat;

  Produit({
    required this.idP,
    required this.nomP,
    required this.description,
    required this.idCat,
    required this.idU,
    required this.etat,
  });

  factory Produit.fromSqFliteDataBase(Map<String, dynamic> map) => Produit(
    idP: map['idP'].toInt ?? 0,
    nomP: map['nomP'] ?? "default",
    description: map['description'] ?? "un produit",
    idCat: map['idCat'].toInt ?? 0,
    idU: map['idU'].toInt ?? 0,
    etat: map['etat'] ?? "disponible",
  );

  void changerEtat(String nouvelEtat) {
    if (nouvelEtat == "disponible" || nouvelEtat == "réservé") {
      etat = nouvelEtat;
    } else {
      throw Exception("État invalide : $nouvelEtat");
    }
  }
}

