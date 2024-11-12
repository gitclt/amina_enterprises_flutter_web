import 'package:amina_enterprises_flutter_web/app/constants/strings.dart';

class AppEmpUrl {
  static String baseUrl = kBaseUrl;
  static String view = '$baseUrl/employee/Getemployee';
  static String add = '$baseUrl/employee/Postemployee';
  static String edit = '$baseUrl/employee/EditEmployee';
  static String delete = '$baseUrl/employee/Deleteemployee';

  static String assignRoute = '$baseUrl/Route/emp_route_add';
  static String assignRouteUpdate = '$baseUrl/Route/emp_route_edit';
}
