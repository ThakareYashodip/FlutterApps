import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'player.dart';

dynamic database;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  database = openDatabase(
      join(
        await getDatabasesPath(),
        "PlayerDb.db",
      ),

      // TABLE QUERY
      version: 1, onCreate: (db, version) async {
      db.execute('''
            CREATE TABLE Player(
              pName TEXT,
              jerNo INT PRIMARY KEY,
              runs INT,
              avg REAL
            )
        ''');
  });

  //Calling Functions
  Player obj1 = Player(pName: 'Virat', jerNo: 18, runs: 102, avg: 45.67);
  Player obj2 = Player(pName: 'Rohit', jerNo: 45, runs: 232, avg: 55.67);

  insertPlayerData(obj1);
  insertPlayerData(obj2);

  print( await getDatabasesPath());
  print(await getPlayerData(obj1.jerNo));
  print(await getPlayerData(obj2.jerNo));

  obj1 = Player(pName: "${obj1.pName} Kohli", jerNo: obj1.jerNo, avg: obj1.avg, runs: obj1.runs+10);
  updateData(obj1);
  print(await getPlayerData(obj1.jerNo));
  print(await getPlayerData(obj2.jerNo));

  deleteData(obj1);
  
  print(await getPlayerData(obj1.jerNo));
  print(await getPlayerData(obj2.jerNo));
}

// Insert data
void insertPlayerData(Player obj) async {
  Database localDB = await database;

  int id = await localDB.insert("Player", obj.playerMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);

  print("ID : $id ");
}

// Retrive Data

Future<List<Map<String, dynamic>>> getPlayerData(int jerNo) async {
  Database localDB = await database;

  List<Map<String, dynamic>> playerData = await localDB.query("Player",columns: ['jerNo','pName'],where: 'jerNo = ?',whereArgs: [jerNo]);

  return playerData;
}

// UPDATE DATA
void updateData(Player obj) async{
  Database localDB = await database;

  localDB.update(
    "Player", 
    obj.playerMap(),
    where: 'jerNo = ?',
    whereArgs: [obj.jerNo],
  );
}

void deleteData(Player obj) async {
  Database localDB = await database;

  await localDB.delete(
    "Player",
    where: 'jerNo = ?',
    whereArgs: [obj.jerNo],
    );
}
