import 'package:amina_enterprises_flutter_web/app/constants/strings.dart';

class ProductUrl {
  static String baseUrl = kBaseUrl;
  static String view = '$baseUrl/Product/product_view';
  static String add = '$baseUrl/Product/product_add';
  static String edit = '$baseUrl/Product/Edit_product';
  static String delete = '$baseUrl/Product/Delete_product';

  //product detail
  static String productDetailsview = '$baseUrl/Product_item_/product_item_view';
  // static String productDetailsadd = '$baseUrl/Product/product_add';
   static String productDetailsedit = '$baseUrl/Product_item_/Edit_item';
  // static String productDetailsdelete = '$baseUrl/Product/Delete_product';

  //product item
  static String proAddItem = '$baseUrl/Product_item_/product_item_add';
   static String deleteItem = '$baseUrl/Product_item_/Delete_productitem';
}
