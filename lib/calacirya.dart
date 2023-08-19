library calacirya;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Calacirya {
  static final Calacirya _calacirya = Calacirya._internal();

  factory Calacirya() => _calacirya;

  Calacirya._internal();

  void start() {}

  final _storage = const FlutterSecureStorage();

  Future<void> _readAll() async {
    final all = await _storage.readAll(
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  Future<void> _deleteAll() async {
    await _storage.deleteAll(
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  Future<void> _addNewItem({required String key, required String value}) async {
    await _storage.write(
      key: key,
      value: value,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  IOSOptions _getIOSOptions() => const IOSOptions(accountName: "calacirya");

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        // sharedPreferencesName: 'Test2',
        // preferencesKeyPrefix: 'Test'
      );

  Future<String?> _getItem({required String key}) async {
    return await _storage.read(key: key);
  }
}

enum _Actions { deleteAll }

enum _ItemActions { delete, edit, containsKey, read }
