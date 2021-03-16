import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {

  final _storage = FlutterSecureStorage();

  Future writeSecureData(String key, bool value) async{
    var writeData = await _storage.write(key: key, value: value.toString());
    return writeData;
  }

  Future<bool> verify(String key) async{
    var verified = await _storage.containsKey(key: "logged_in");
    print("verified:" + verified.toString());
    return verified;
  }
}
