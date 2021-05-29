import 'package:rapidinho/database/common.dart' as common;
import 'package:rapidinho/model/profile.dart';
import 'package:sqflite/sqflite.dart';

class AccountTable {
  final Database database;

  AccountTable({this.database});

  AccountTable.createTable(this.database) {
    _createTable(database);
  }

  AccountTable.createAccount(Profile profile, this.database) {
    _createAccount(profile, database: this.database);
  }

  // table create for user account
  _createTable(Database database) async {
    await database.execute("CREATE TABLE $Profile ("
        "${common.id} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
        "${common.name} TEXT,"
        "${common.phone} TEXT,"
        "${common.address} TEXT,"
        "${common.password} TEXT,"
        "${common.email} TEXT"
        ")");
    print("Account Table created.");
  }

  // add new account profile to account table
  Future<int> _createAccount(Profile profile, {Database database}) async {
    try {
      int accountId = await database.insert('$Profile', profile.toMap());
      print(profile.toString());
      return accountId;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  // check profile is exist or not by quering the account table with name and password
  Future<Profile> getProfile(
      Database database, String name, String password) async {
    final List<Map<String, dynamic>> queryResult = await database.rawQuery(
        'SELECT * FROM $Profile WHERE ${common.name} = ? AND ${common.password} = ?',
        [name, password]);
    return queryResult.isNotEmpty ? Profile.fromMap(queryResult.first) : null;
  }

  // update account data
  Future<int> updateProfile(Profile profile, Database database) async {
    int result = await database.rawUpdate(
        '''UPDATE $Profile SET ${common.name} = ?, ${common.phone} = ?, ${common.address} = ?,
         ${common.email} = ?, ${common.password} = ? WHERE ${common.id} = ?''',
        [
          profile.name,
          profile.phone,
          profile.address,
          profile.email,
          profile.password,
          profile.id
        ]);
    print(result);
    return result;
  }
}
