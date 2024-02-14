import 'package:add_to_cart_practice/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

class DBHelper {
  // ignore: unused_field
  static Database? _db;
  //Database likely represents some kind of database-related functionality, possibly from a database package or library.

  // ignore: body_might_complete_normally_nullable
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDatabase();
  }

  initDatabase() async {
    // ignore: unused_local_variable
    io.Directory documentdirectory = await getApplicationDocumentsDirectory();

    // ignore: unused_local_variable
    String path = join(documentdirectory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart (id INTEGER PRIMARY KEY , productId VARCHAR UNIQUE,productName TEXT,initialPrice INTEGER, productPrice INTEGER , quantity INTEGER, unitTag TEXT , image TEXT )');
  }

  Future<Cart> insert(Cart cart) async {
    var dbClient = await db;
    dbClient!.insert('cart', cart.toMap());
    return cart;
  }
}
