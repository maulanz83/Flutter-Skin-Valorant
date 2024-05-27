import '../helpers/database_helper.dart';
import '../helpers/shared_pref.dart';
import '../models/users.dart';

class AuthService {
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;

  Future<bool> register(String username, String password) async {
    final encryptedPassword = encryptPassword(password);

    User newUser = User(username: username, password: encryptedPassword);

    int result = await databaseHelper.registerUser(newUser);
    return result > 0;
  }

  Future<bool> login(String username, String password) async {
    final encryptedPassword = encryptPassword(password);

    User? user = await databaseHelper.loginUser(username, encryptedPassword);
    if (user != null) {
      await UserPreferences.setLoggedIn(true);
      await UserPreferences.setUsername(user.username!);
      return true;
    } else {
      return false;
    }
  }

  void logout() async {
    await UserPreferences.setLoggedIn(false);
    await UserPreferences.setUsername('');
  }

  String encryptPassword(String password) {
    return password.split('').reversed.join();
  }
}
