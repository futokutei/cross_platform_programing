import 'package:sqflite/sqflite.dart';

class DBService{
  Database? _db;

  static final _instance = DBService._internal();

  factory DBService(){
    return _instance;
  }
  DBService._internal();

  connect() async{
    var databasesPath = await getDatabasesPath();

    String path = '$databasesPath/mydatabase.db';

    _db = await openDatabase(path, version: 1, onCreate: (Database db, int version)
    async {await db.execute('CREATE TABLE records(id INTEGER  PRIMARY KEY, description TEXT, created_at INTEGER)');}  );
  }

  Future<Database?> connection() async{
    if(_db == null){
      await connect();
  }
    return _db;
}
}