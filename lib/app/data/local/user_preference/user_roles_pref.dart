// import 'package:shared_preferences/shared_preferences.dart';

// class UserRolePref {
//   final _api = SettingsRepository();
//   static List<RolePrivilageData> userRole = [];

//   Future getUserRole() async {
//     userRole.clear();
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     String? role = sp.getString('role');
//     final response = await _api.rolePrivilageEditView(roleId: role);
//     if (response.data != null && response.data!.isNotEmpty) {
//       userRole.addAll(response.data!);
//     }
//   }
// }
