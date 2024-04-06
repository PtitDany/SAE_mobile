import "./database_service.dart";
import '../model/produit.dart';

class Produit_DB {
  final String tableName = 'produit';


  Future<int> insert({required int idP, required String nomP, required String description, required int idCat, required int idU, required int prix}) async {
    final database = await DatabaseService.getDatabase(); // Utilisation de getDatabase() plutôt que database
    return await database!.rawInsert(
      '''INSERT INTO $tableName (idP, nomP, description, idCat, idU, prix) VALUES (?,?,?,?,?,?)''',
      [idP, nomP, description, idCat, idU, prix],
    );
  }

  Future<List<Produit>> fetchAll() async {
    final database = await DatabaseService.getDatabase(); // Utilisation de getDatabase() plutôt que database
    final List<Map<String, dynamic>> maps = await database!.query(tableName);
    return List.generate(maps.length, (index) {
      return Produit.fromSqFliteDataBase(maps[index]);
    });
  }
}
