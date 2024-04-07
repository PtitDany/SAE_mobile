import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import './categorie_db.dart';

class DatabaseService {
  static Database? _database;

  static Future<Database?> getDatabase() async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  static Future<Database> _initDatabase() async {
    var factory = databaseFactoryFfiWeb;
    var db = await factory.openDatabase('/lib/utils/database.db');
      await db.execute('''  
        CREATE TABLE IF NOT EXISTS Annonce (
          idA INTEGER PRIMARY KEY,
          date_debut TEXT NOT NULL,
          date_fin TEXT NOT NULL,
          etat TEXT NOT NULL,
          idU INTEGER NOT NULL,
          idP INTEGER,
          FOREIGN KEY (idP) REFERENCES Produit(idP)
        );
      ''');

    // Création de la table Categorie
    await db.execute('''
        CREATE TABLE IF NOT EXISTS Categorie (
          idCat INTEGER PRIMARY KEY,
          nomCat TEXT NOT NULL
        );
      ''');

    // Création de la table Produit
    await db.execute('''
        CREATE TABLE IF NOT EXISTS Produit (
          idP INTEGER PRIMARY KEY,
          nomP TEXT NOT NULL,
          description TEXT NOT NULL,
          idCat INTEGER NOT NULL,
          idU INTEGER NOT NULL,
          prix INTEGER NOT NULL,
          FOREIGN KEY (idCat) REFERENCES Categorie(idCat)
        );
      ''');

      await Categorie_DB.syncCategoriesFromSupabase();
  return db;
  }
}