import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tenant_finder/models/post.dart';

class DatabaseHelper {
  static const _databaseName = 'RentPost.db';
  static const _databaseVersion = 1;

  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database _database;
  Future<Database> get database async{
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async{
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    return await openDatabase(dbPath, version: _databaseVersion, onCreate: _onCreateDB);
  }

  _onCreateDB(Database db, int version) async{
    await createPostsTable(db);
  }


  Future<void> createPostsTable (Database db) async{
    print('this is from createPostTable function!!!');
    final sql = '''
    CREATE TABLE ${Post.tblPost}(
      ${Post.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${Post.colAddress} TEXT NOT NULL,
      ${Post.colSizeOfPlace} TEXT NOT NULL,
      ${Post.colRentCommencementDate} TEXT NOT NULL,
      ${Post.colRentalPrice} TEXT NOT NULL,
      ${Post.colBookingMoney} INTEGER NOT NULL,
      ${Post.colDescription} TEXT NOT NULL
    )''';
    await db.execute(sql);
    print("${Post.tblPost} table created!!!!!");
  }

  Future<int> insertPost(Post post) async{
    Database db = await database;
    var response;
    try {
      response = await db.insert(Post.tblPost, post.toMap());
      print("insert info:  $response ");
    }
    catch(error){
      print("insert error: " + error);
    }
    return response;
  }

  Future<List<Post>> fetchPosts() async{
    Database db = await database;
    List<Map> posts = await db.query(Post.tblPost);
    return posts.length == 0
    ? []
    : posts.map((e) => Post.fromMap(e)).toList();
  }

}