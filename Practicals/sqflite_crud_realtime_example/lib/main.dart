import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_crud_realtime_example/Model_Cars.dart';


dynamic database;
void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  database = openDatabase(
    join(
      await getDatabasesPath(),
      'ShowRoomDB.db',
    ),
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        '''
          CREATE TABLE Cars(
            carModel INT PRIMARY KEY,
            carPrice INT,
            carColor TEXT,
            carYear INT
          );
        '''
      );
    },
  );


  ModelCars obj1 = ModelCars(carModel: 13245, carColor: "RED", carPrice: 12049500, carYear: 2020);
  ModelCars obj2 = ModelCars(carModel: 234546, carColor: "BLUE", carPrice: 4129500, carYear: 2018);

  insertCarsData(obj1);
  insertCarsData(obj2);

  print(await getCarsData());

  obj1 = ModelCars(carModel: 5344, carColor: "Yellow", carPrice: 765432, carYear: 2024);

  updateData(obj1);

  print("update");
  print(await getCarsData());

  deleteData();

  print(await getCarsData());

}

void insertCarsData(ModelCars obj) async{
  Database localDB = await database;

  localDB.insert("Cars", obj.carsData(),conflictAlgorithm: ConflictAlgorithm.replace);
  print("Inserted DataBase");
}

Future<List<Map<String, dynamic>>> getCarsData() async{
  Database localDB = await database;

  List<Map<String, Object?>>  carsMap = await localDB.query("Cars");
  return  carsMap;
}

void updateData( ModelCars obj) async {
  Database localDB = await database ;

  await localDB.update(
    "Cars",
    obj.carsData(),
    where: "carModel = ?",
    whereArgs: [obj.carModel],
  );
  
}

void deleteData() async{
  Database localDB = await database ;

  await localDB.delete(
    'Cars',
  );
}