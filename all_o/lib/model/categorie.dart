class Categorie {
  int idCat;
  String nomCat;

  Categorie({
    required this.idCat,
    required this.nomCat,
  });

  factory Categorie.fromSqFliteDataBase(Map<String, dynamic> map) => Categorie(
    idCat: map['idCat'].toInt ?? 0,
    nomCat: map['nomCat'] ?? "default",
  );
}