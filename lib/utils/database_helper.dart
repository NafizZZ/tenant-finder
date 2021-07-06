import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tenant_finder/constants.dart';
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

// $colStatus TEXT NOT NULL, $colBedroomNo TEXT NOT NULL, $colRentalType TEXT NOT NULL,
  Future<void> createPostsTable (Database db) async{
    print('this is from createPostTable function!!!');
    final sql = '''
    CREATE TABLE $tblPost(
      $colId INTEGER PRIMARY KEY AUTOINCREMENT,
      $colIsActive BOOLEAN,
      $colPostedBy TEXT NOT NULL, 
      $colAddress TEXT NOT NULL,
      $colSizeOfPlace TEXT NOT NULL,
      $colBedroomNo TEXT NOT NULL, 
      $colRentCommencementDate TEXT NOT NULL,
      $colRentalPrice TEXT NOT NULL,
      $colBookingMoney TEXT NOT NULL,
      $colRentalTypeFamily BOOLEAN,
      $colRentalTypeBachelor BOOLEAN,
      $colDescription TEXT
    )''';
    await db.execute(sql);
    print("$tblPost table created!!!!!");
  }

  Future<int> insertPost(Post post) async{
    Database db = await database;
    var response;
    try {
      response = await db.insert(tblPost, post.toMap());
      print("insert info:  $response ");
    }
    catch(error){
      print("insert error: " + error);
    }
    return response;
  }

  fetchPosts() async{
    Database db = await database;
    
    try{
        List<Map> posts = await db.query(tblPost);
        print("this is posts  $posts");
        print( posts.length);
        return posts.length == 0
        ? []
        : posts;
        // : posts.map((e) => Post.fromMap(e)).toList();
    }
    catch(error){
        print(error);
    }
    
  }

  getSinglePostDetails(int id) async {
    Database db = await database;

     try{
        List<Map> post = await db.query(tblPost,
                                  where: 'id = ?',
                                  whereArgs: [id]);
        print("this is a single post details: $post");
        print( post.length);
        return post.length == 0
        ? []
        : post;
        // : posts.map((e) => Post.fromMap(e)).toList();
    }
    catch(error){
        print(error);
    }
  }

}
