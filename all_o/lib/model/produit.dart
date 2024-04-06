class Produit {
  int idP;
  String nomP;
  String description;
  int idCat;
  int idU;
  int prix;

  Produit({
    required this.idP,
    required this.nomP,
    required this.description,
    required this.idCat,
    required this.idU,
    required this.prix,
  });

  factory Produit.fromSqFliteDataBase(Map<String, dynamic> map) => Produit(
    idP: map['idP'].toInt ?? 0,
    nomP: map['nomP'] ?? "default",
    description: map['description'] ?? "un produit",
    idCat: map['idCat'].toInt ?? 0,
    idU: map['idU'].toInt ?? 0,
    prix: map['prix'].toInt ?? 0,
  );
}