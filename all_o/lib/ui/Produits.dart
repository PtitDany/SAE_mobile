import 'package:flutter/material.dart';
import '../model/produit.dart';
import '../model/categorie.dart';
import '../database/produit_db.dart';
import '../database/categorie_db.dart';

class Produits extends StatefulWidget {
  const Produits({Key? key}) : super(key: key);

  @override
  _ProduitsState createState() => _ProduitsState();
}

class _ProduitsState extends State<Produits> {
  final Produit_DB produitDB = Produit_DB();
  final Categorie_DB categorieDB = Categorie_DB();

  late List<Categorie> categories;
  late Categorie selectedCategory;

  @override
  void initState() {
    super.initState();
    categories = [];
    selectedCategory = Categorie(idCat: 0, nomCat: 'Sélectionnez une catégorie');
    loadCategories(); // Charger les catégories depuis la base de données
  }

  Future<void> loadCategories() async {
    List<Categorie> fetchedCategories = await categorieDB.fetchAll();
    setState(() {
      categories = fetchedCategories;
      if (categories.isNotEmpty) {
        selectedCategory = categories.first; // Sélectionner la première catégorie par défaut
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Liste des Produits',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddProductDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddProductDialog(BuildContext context) {
    TextEditingController nomController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ajouter un Produit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomController,
                decoration: InputDecoration(labelText: 'Nom du Produit'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description du Produit'),
              ),
              DropdownButton<Categorie>(
                value: selectedCategory,
                onChanged: (newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: categories.map((categorie) {
                  return DropdownMenuItem<Categorie>(
                    value: categorie,
                    child: Text(categorie.nomCat),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fermer la pop-up sans rien faire
              },
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () async {
                await produitDB.insert(
                  idP: 0,
                  nomP: nomController.text,
                  description: descriptionController.text,
                  idCat: selectedCategory.idCat,
                  idU: 0, // Remplacez par l'ID de l'utilisateur connecté
                  etat: 'disponible',
                );
                Navigator.pop(context); // Fermer la pop-up après l'ajout du produit
                setState(() {}); // Rafraîchir l'affichage pour afficher le nouveau produit
              },
              child: Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }
}
