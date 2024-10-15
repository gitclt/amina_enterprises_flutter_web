import 'package:amina_enterprises_flutter_web/app/constants/strings.dart';

class AppEmpUrl {
  static String baseUrl = kBaseUrl;

  static String employeeApi = '$baseUrl/CreditLogin/get_employeeslist';
  static String employeeListApi = '$baseUrl/Employee/List';
  static String employeeAddApi = '$baseUrl/Employee/employee_add';
  static String employeeeUpdateApi = '$baseUrl/Employee/Update_profile';
  static String employeeDeleteApi = '$baseUrl/Employee/Delete_employee';
}
