import 'package:qr_scan/models/user.dart';
import 'package:qr_scan/services/shared_pref.dart';

class LocalRepository {
  LocalRepository();
  final String _keyUser = 'user';

  Future<void> saveUser({required User user}) async {
    final prefs = SharedPref();

    prefs.saveJson(
      key: _keyUser,
      json: user.toJson(),
    );
  }

  Future<User> loadUser() async {
    final prefs = SharedPref();
    final json = await prefs.loadJson(key: _keyUser);
    final user = User.fromJsonImageLocal(json);

    return user;
  }

  Future<void> removeUser() async {
    final prefs = SharedPref();
    await prefs.remove(key: _keyUser);
  }

  Future<void> saveToken({required String token}) async {}
}
