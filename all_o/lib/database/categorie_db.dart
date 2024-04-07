import 'package:sqflite/sqflite.dart';
import '../model/categorie.dart'; // Importez votre modèle Categorie
import '../database/database_service.dart'; // Importez votre service de base de données
import 'package:supabase_flutter/supabase_flutter.dart';

class Categorie_DB {
  final String tableName = 'categorie';

  static Future<void> syncCategoriesFromSupabase() async {
    final supabase = Supabase.instance.client;

    try {
      // Récupérer les catégories depuis Supabase
      final categories = await supabase.from('CATEGORIE').select();

      for (var categorie in categories)
        Categorie.fromSqFliteDataBase(categorie);

    }catch (e) {
      print('Erreur lors de la synchronisation des catégories depuis Supabase: $e');
    }
  }

  Future<int> insert({required int idCat, required String nomCat}) async {
    final database = await DatabaseService.getDatabase();
    return await database!.rawInsert(
      '''INSERT INTO $tableName (idCat, nomCat) VALUES (?,?)''',
      [idCat, nomCat],
    );
  }

  Future<List<Categorie>> fetchAll() async {
    final database = await DatabaseService.getDatabase();
    final List<Map<String, dynamic>> maps = await database!.query(tableName);
    return List.generate(maps.length, (index) {
      return Categorie.fromSqFliteDataBase(maps[index]);
    });
  }
}
