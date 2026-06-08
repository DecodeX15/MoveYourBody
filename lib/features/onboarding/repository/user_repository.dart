import 'package:template_flutter/core/database/tables/user_table.dart';
import 'package:template_flutter/core/model/user_data.dart';
import '../../../core/database/db_config.dart';

class UserRepository {
    Future<void> saveUser(UserData user) async {
      final db = await DatabaseService.instance.database;
      await db.insert('user_data', user.toMap());
    }

  Future<UserData?> getUserData() async {
    final db = await DatabaseService.instance.database;
    print("Fetching user data from database...");
    final result = await db.query(UserTable.tableName, limit: 1);

    if (result.isEmpty) {
      return null;
    }

    return UserData.fromMap(result.first);
  }

  Future<void> deleteUserData() async {
    final user = await getUserData();

    if (user == null) {
      print('No user data found to delete');
      return;
    }

    final db = await DatabaseService.instance.database;

    await db.delete(UserTable.tableName);

    print('User data deleted successfully');
  }

  Future<void> printUserData() async {
    final user = await getUserData();
    print('===================');
    print(user?.username);
    print(user?.age);
    print(user?.height);
    print(user?.weight);
    print(user?.goalTags);
    print(user?.healthIssueTags);
    print(user?.difficulty);
    print(user?.intensity);
    print(user?.targetBodyRegion);
    print(user?.equipments);
    print(user?.isOnboarded);
    print('===================');
  }
}
