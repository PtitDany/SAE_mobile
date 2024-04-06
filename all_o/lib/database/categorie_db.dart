import 'package:flutter/material.dart';

import "./database_service.dart";
import '../model/categorie.dart';

class Categorie_DB {
  final String tableName = 'categorie';


  Future<int> insert({required int idCat, required String nomCat}) async {
    final database = await DatabaseService.getDatabase(); // Utilisation de getDatabase() plutôt que database
    return await database!.rawInsert(
      '''INSERT INTO $tableName (idCat, nomCat) VALUES (?,?)''',
      [idCat, nomCat],
    );
  }

  Future<List<Categorie>> fetchAll() async {
    final database = await DatabaseService.getDatabase(); // Utilisation de getDatabase() plutôt que database
    final List<Map<String, dynamic>> maps = await database!.query(tableName);
    return List.generate(maps.length, (index) {
      return Categorie.fromSqFliteDataBase(maps[index]);
    });
  }
}
