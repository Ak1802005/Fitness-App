// ignore_for_file: avoid_types_as_parameter_names, depend_on_referenced_packages, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../Model/credential.dart';

class DatabaseControl extends GetxController {
  DatabaseControl._();

  static Database? _database;

  static Future<DatabaseControl> getInstance() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

// Delete the database
//     await deleteDatabase(path);

    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Users (id INTEGER PRIMARY KEY AUTOINCREMENT, firstname TEXT, lastname TEXT, number TEXT, username TEXT, password TEXT)');
    });
    return DatabaseControl._();
  }

  Future<void> registerUsers(credential Credential) async {
    String sql =
        "INSERT INTO Users (`firstname`,`lastname`,`number`,`username`,`password`) VALUES('${Credential.firstName}','${Credential.lastName}','${Credential.number}','${Credential.userName}','${Credential.pswd}')";
    await _database?.execute(sql);
  }

  // Future<credential?> logInUsers(
  //     {required String username, required String pswd}) async {
  //   String sql =
  //       "SELECT * FROM Users WHERE `username` = '$username' AND `password` = '$pswd'";
  //   List<Map<String, Object?>> data = await _database!.rawQuery(sql);
  //   if (data.isNotEmpty) {
  //     return credential.fromJson(data[0]);
  //   }
  // }
  Future<credential?> logInUsers({
    required String username,
    required String pswd,
  }) async {
    const sql = "SELECT * FROM Users WHERE `username` = ? AND `password` = ?";
    final data = await _database!.rawQuery(sql, [username, pswd]);

    if (data.isNotEmpty) {
      return credential.fromJson(data[0]);
    } else {
      return null;
    }
  }
}
