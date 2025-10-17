import 'package:sqflite/sqflite.dart';

class TreaSqlNamewdhiw{
  static const String bPlayTypeInfo="bPlayTypeInfo";
  static const String bBoxNum="bBoxNum";
}

class TreaSqlDwhidhwo{
  static final TreaSqlDwhidhwo _dwhidhwo=TreaSqlDwhidhwo();
  static TreaSqlDwhidhwo get instance => _dwhidhwo;

  Future<Database> initSql()async{
    var database = await openDatabase(
      "treasure.db",
      version: 1,
      onCreate: (db,version)async{
        _createVersion1DB(db);
      },
      // onUpgrade: (db,oldVersion,newVersion){
      //   if(newVersion==2){
      //     _createVersion2DB(db);
      //   }else if(newVersion==3){
      //     _createVersion3DB(db);
      //   }
      // },
    );
    return database;
  }

  _createVersion1DB(Database db){
    db.execute('CREATE TABLE ${TreaSqlNamewdhiw.bPlayTypeInfo} (id INTEGER PRIMARY KEY AUTOINCREMENT, playType TEXT, currentPro INTEGER, totalPro INTEGER,unlock INTEGER)');
    db.execute('CREATE TABLE ${TreaSqlNamewdhiw.bBoxNum} (id INTEGER PRIMARY KEY AUTOINCREMENT, todayTime TEXT, todayNum INTEGER)');
  }
}