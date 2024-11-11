import 'package:amina_enterprises_flutter_web/app/constants/strings.dart';

class OrderUrl {
   static String baseUrl = kBaseUrl;

     //order
  static String view = '$baseUrl/order/view_order';
  static String add = '$baseUrl/';
  static String edit = '$baseUrl/';
  static String delete = '$baseUrl/';

//orderdetail
  static String viewDetail = '$baseUrl/order/OrderDetails';
  static String addDetail = '$baseUrl/';
  static String editDetail = '$baseUrl/';
  static String deleteDetail = '$baseUrl/';

}