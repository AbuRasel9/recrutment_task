import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:recruitment_tasks/data/data_model/registration_model.dart';
import 'package:recruitment_tasks/data/data_model/login_model.dart';

class DataBaseHelper {
  final dataBaseName = "User.db";

  // Table Creation SQL Statements
  final String loginTable = """
    CREATE TABLE usersLogin (
      usrId INTEGER PRIMARY KEY AUTOINCREMENT,
      usrName TEXT UNIQUE,
      password TEXT
    )
  """;

  final String registrationTable = """
    CREATE TABLE usersRegistration (
      usrId INTEGER PRIMARY KEY AUTOINCREMENT,
      usrName TEXT UNIQUE,
      password TEXT,
      mobile TEXT,
      firstName TEXT,
      lastName TEXT
    )
  """;

  final String changePasswordTable = """
    CREATE TABLE changePassword (
      usrId INTEGER PRIMARY KEY AUTOINCREMENT,
      password TEXT,
      confirmPassword TEXT
    )
  """;
  // Future<Database> initDb() async {
  //   Directory documentDirectory = await getApplicationDocumentsDirectory();
  //   final path = join(documentDirectory.path, dataBaseName);
  //
  //   return openDatabase(
  //     path,
  //     version: 2, // Increment the version number
  //     onCreate: (db, version) async {
  //       await db.execute(loginTable);
  //       await db.execute(registrationTable);
  //       await db.execute(changePasswordTable);
  //     },
  //     onUpgrade: (db, oldVersion, newVersion) async {
  //       if (oldVersion < 2) {
  //         // Update schema for version 2
  //         await db.execute("ALTER TABLE usersRegistration ADD COLUMN mobile TEXT");
  //       }
  //     },
  //   );
  // }

  Future<Database> initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, dataBaseName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(loginTable);
        await db.execute(registrationTable);
        await db.execute(changePasswordTable);
      },
    );
  }

  // Login Method
  Future<bool> login(LoginModel loginModel) async {
    final Database db = await initDb();
    var result = await db.rawQuery(
      "SELECT * FROM usersRegistration WHERE usrName = ? AND password = ?",
      [loginModel.usrName, loginModel.password],
    );
    print("Login result: $result");
    return result.isNotEmpty;
  }

  // Sign Up Method
  Future<int> signUp(RegistrationModel registration) async {
    print("----------------------Registration Data: ${jsonEncode(registration.toJson())}");
    final Database db = await initDb();
    return db.insert("usersRegistration", registration.toJson());
  }

  // Get notes
  Future<List<RegistrationModel>> getProfileData() async {
    final Database db = await initDb();
    List<Map<String, Object?>> result = await db.query('usersRegistration');
    return result.map((e) => RegistrationModel.fromJson(e)).toList();
  }
}
