import 'package:amina_enterprises_flutter_web/app/constants/strings.dart';

class RouteSettingUrl {
  static String baseUrl = kBaseUrl;
  //RouteSettings

  static String routeSettingListApi = '$baseUrl/Route/view_route_master';
  static String routeSettingAddApi = '$baseUrl/Route/route_master_add';
  static String routeSettingUpdateApi = '$baseUrl/';
  static String routeSettingDeleteApi = '$baseUrl/Route/Delete_route_master';
  

  //route name
 static String routeNameAddApi = '$baseUrl/Route/route_name_add';
  static String routeNameEditApi = '$baseUrl/Route/Edit_route_name';
}


