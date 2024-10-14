// import 'package:amina_enterprises_flutter_web/app/constants/strings.dart';
// import 'package:amina_enterprises_flutter_web/app/core/prefs_storage_config.dart';

// abstract class LocalDatasource {
//   Future<String?> getToken();
//   Future<String?> getUserType();
//   Future setToken(String token);
//   Future<bool> setUserType(String type);
//   Future deleteToken();
//   Future deleteRole();
// }

// class LocalDatasourceImpl implements LocalDatasource {
//   @override
//   Future<String?> getToken() async {
//     return PrefsStorage.getString(LocalStorageKey.token);
//   }

//   @override
//   Future setToken(String token) async {
//     PrefsStorage.setString(LocalStorageKey.token, token);
//   }

//   @override
//   Future deleteToken() async {
//     PrefsStorage.remove(LocalStorageKey.token);
//   }

//   @override
//   Future<String?> getUserType() async {
//     return PrefsStorage.getString(LocalStorageKey.type);
//   }

//   @override
//   Future<bool> setUserType(String role) async {
//     var res = await PrefsStorage.setString(LocalStorageKey.type, role);
//     return res;
//   }

//   @override
//   Future deleteRole() async {
//     PrefsStorage.remove(LocalStorageKey.type);
//   }
// }
