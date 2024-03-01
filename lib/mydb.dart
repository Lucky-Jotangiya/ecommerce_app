import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Db {
  Future<Database> getDataBase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'MyDb.db');

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String table1 =
            "create table table1 (id integer primary key,name Text,price Text,image Text)";
        db.execute(table1);
      },
    );
    return database;
  }

  Future<void> addToCart(
      String name, String price, String image, Database db) async {
    String insert =
        "insert into table1 (name,price,image) values ('$name','$price','$image')";
    int a = await db.rawInsert(insert);
  }

  Future<List<Map>> viewCartData(Database db) async {
    String view = "select * from table1";
    List<Map> list = await db.rawQuery(view);
    return list;
  }

  remove(id, db) async {
    String remove = "delete from table1 where id = '$id'";
    int b = await db.rawDelete(remove);
  }
}
