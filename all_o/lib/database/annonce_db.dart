import 'package:flutter/material.dart';

import "./database_service.dart";
import '../model/annonce.dart';

class Annonce_DB {
  final String tableName = 'annonce';


  Future<int> insert({required int idA, required DateTime date_debut, required DateTime date_fin, required String etat, required int idU, required int idP}) async {
    final database = await DatabaseService.getDatabase(); // Utilisation de getDatabase() plutôt que database
    return await database!.rawInsert(
      '''INSERT INTO $tableName (idA, date_debut, date_fin, etat, idU, idP) VALUES (?,?,?,?,?,?)''',
      [idA, date_debut.toIso8601String(), date_fin.toIso8601String(), etat, idU, idP],
    );
  }

  Future<List<Annonce>> fetchAll() async {
    final database = await DatabaseService.getDatabase(); // Utilisation de getDatabase() plutôt que database
    final List<Map<String, dynamic>> maps = await database!.query(tableName);
    return List.generate(maps.length, (index) {
      return Annonce.fromSqFliteDataBase(maps[index]);
    });
  }
}
