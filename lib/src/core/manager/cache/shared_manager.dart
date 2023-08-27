import 'package:shared_preferences/shared_preferences.dart';

import '../../exceptions/shared_init_exception.dart';

enum SharedKeys { strtheme }

class SharedManager {
  static final SharedManager _instance = SharedManager._internal();
  SharedPreferences? _sp;

  factory SharedManager() {
    return _instance;
  }

  factory SharedManager.withSharedPreferences(SharedPreferences sp) {
    _instance._sp = sp;
    return _instance;
  }

  SharedManager._internal();

  Future<void> initSp() async {
    _sp ??= await SharedPreferences.getInstance();
  }

  static SharedManager get instance {
    if (_instance._sp == null) {
      throw SharedInitException();
    }
    return _instance;
  }

  void saveString(SharedKeys key, String value) {
    instance._sp!.setString(key.name, value);
  }

  Future<void> saveBool(SharedKeys key, bool value) async {
    await instance._sp!.setBool(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    await instance._sp!.setStringList(key.name, value);
  }

  List<String>? getStrings(SharedKeys key) {
    return instance._sp!.getStringList(key.name);
  }

  String? getString(SharedKeys key) {
    return instance._sp!.getString(key.name);
  }

  bool? getBool(SharedKeys key) {
    return _sp!.getBool(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    return await _sp!.remove(key.name);
  }
}
