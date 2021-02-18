import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:savey/models/Category.dart';
import 'package:savey/models/Transaction.dart' as t;
import 'package:savey/models/Wallet.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "savey.db";

  static final _databaseVersion = 1;
  //singlton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  //sinle wide app refrence to the database;
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate,
        onConfigure: _onConfigure);
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE categories (
          id INTGER PRIMARY KEY,
          title TEXT NOT NULL,
          color INTEGER NOT NULL
        )
    ''');
    await db.execute('''
        CREATE TABLE wallets (
          id INTGER PRIMARY KEY,
          title TEXT NOT NULL,
          icon TEXT NOT NULL,
          amount REAL NOT NULL
        )
    ''');
    await db.execute('''
          CREATE TABLE transactions (
            id INTEGER PRIMARY KEY,
            title TEXT NOT NULL,
            icon TEXT NOT NULL,
            amount REAL NOT NULL,
            category_id INTEGER NOT NULL,
            FOREIGN KEY (category_id) REFERENCES categories (id)
          )
          ''');
  }

  Future<int> insertCategory(Category category) async {
    Database db = await instance.database;
    int id;
    try {
      id = await db.insert("categories", category.toJson());
    } catch (e) {
      id = -1;
    }
    return id;
  }

  Future<int> insertTransction(t.Transaction transaction) async {
    Database db = await instance.database;
    int id;
    try {
      id = await db.insert("transactions", transaction.toJson());
    } catch (e) {
      id = -1;
    }
    return id;
  }

  Future<int> insertWallet(Wallet wallet) async {
    Database db = await instance.database;
    int id;
    try {
      id = await db.insert("wallets", wallet.toJson());
    } catch (e) {
      id = -1;
    }
    return id;
  }

  Future<List<Map<String, dynamic>>> getAllCategories() async {
    Database db = await instance.database;
    return await db.query("categories");
  }

  Future<List<Map<String, dynamic>>> getAllWallets() async {
    Database db = await instance.database;
    return await db.query("wallets", orderBy: "amount");
  }

  Future<List<Map<String, dynamic>>> getAllTransactions() async {
    Database db = await instance.database;
    return await db.query("transactions");
  }

  // Future<List<Map<String, dynamic>>> getTransactionsWeekly(
  //     int startDate, int endDate) async {
  //   Database db = await instance.database;
  //   return await db
  //       .rawQuery('''SELECT * FROM categories WHERE id BETWEEN '$startDate' AND '$endDate' ''');
  // }

  Future<int> deleteTransaction(t.Transaction transaction) async {
    Database db = await instance.database;
    return await db
        .delete("transactions", where: "id = ?", whereArgs: [transaction.id]);
  }

  Future<int> deleteCategory(Category category) async {
    Database db = await instance.database;
    int id;
    try {
      id = await db
          .delete("categories", where: "id = ?", whereArgs: [category.id]);
    } catch (e) {
      id = -1;
    }
    return id;
  }

  Future<int> deleteWallet(Wallet wallet) async {
    Database db = await instance.database;
    return await db.delete("wallets", where: "id = ?", whereArgs: [wallet.id]);
  }
}
