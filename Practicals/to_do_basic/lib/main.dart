import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'firstpage.dart';
import 'ToDoModel.dart';

void main() {
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

dynamic database ;

Future<Database> openMyDatabase() async {
  database = openDatabase(
    join(await getDatabasesPath(), 'userDataDB.db'),
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        '''
          CREATE TABLE todoUser (
            title TEXT PRIMARY KEY,
            description TEXT,
            date TEXT
          );
        '''
      );
    }
  );
  return database;
}

  void insertUserData(Todomodel obj) async {
  try {
    Database localDb = await database;
    await localDb.insert("todoUser ", obj.userData(), conflictAlgorithm: ConflictAlgorithm.replace);
    print('Inserted: ${obj.userData()}');
  } catch (e) {
    print('Error inserting data: $e');
  }
}

  Future<List<Map<String,dynamic>>> getUserData() async {
    Database localDb = await database ;

    List<Map<String,dynamic>> userDataBase =  await localDb.query("todoUser");
    return userDataBase ;
  }

  Future<void> updateUserData(Todomodel obj) async {
    Database localDb = await database ;

    await localDb.update("todoUser",obj.userData(),where: "title=?",whereArgs: [obj.title]);
  }

  void deleteUserData(Todomodel obj) async {
    Database localDb = await database ;

    await localDb.delete("todoUser",where: 'title=?', whereArgs: [obj.title]);
  }
class _ToDoAppState extends State<ToDoApp> {

  void initState(){
    super.initState();
    openMyDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return const Basic_To_do();
  }
}