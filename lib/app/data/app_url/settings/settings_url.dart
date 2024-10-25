import 'package:amina_enterprises_flutter_web/app/constants/strings.dart';

class SettingsUrl {
  static String baseUrl = kBaseUrl;

  //role
  static String roleListApi = '$baseUrl/role/view_role';
  static String userRoleListApi = '$baseUrl/Roleprivilage/UserRole_list';
  static String roleAddApi = '$baseUrl/Roleprivilage/UserRole_add';
  static String roleDeleteApi = '$baseUrl/Roleprivilage/UserRole_delete';
  static String roleUpdateApi = '$baseUrl/Roleprivilage/UserRole_update';
  static String rolePrivilageApi =
      '$baseUrl/Roleprivilage/user_role_privilage_list';
  static String rolePrivilageAddApi =
      '$baseUrl/Roleprivilage/user_role_privilage_add';
  static String rolePrivilageUpdateApi =
      '$baseUrl/Roleprivilage/user_role_privilage_update';

  // designation

  static String designationView = '$baseUrl/designation/GetDesignations';
  static String designationAdd = '$baseUrl/designation/PostDesignation';
  static String designationEdit = '$baseUrl/designation/UpdateDesignation';
  static String designationDelete = '$baseUrl/designation/DeleteDesignation';

  // brand

  static String brandView = '$baseUrl/Brand/view_brand';
  static String brandAdd = '$baseUrl/Brand/brand_add';
  static String brandEdit = '$baseUrl/Brand/Edit_brand';
  static String brandDelete = '$baseUrl/Brand/Delete_brand';

  //productcategory
  static String proCategoryListApi = '$baseUrl/category/Getcategory';
  static String proCategoryAddApi = '$baseUrl/category/Postcategory';
  static String proCategoryEditApi = '$baseUrl/category/Updatecategory';
  static String proCategoryDeleteApi = '$baseUrl/category/Deletecategory';

  //subcategory

  static String subCategoryListApi = '$baseUrl/subcategory/GetSubcategories';
  static String subCategoryAddApi = '$baseUrl/subcategory/Postsubcategory';
  static String subCategoryEditApi = '$baseUrl/subcategory/Updatesubcategory';
  static String subCategoryDeleteApi = '$baseUrl/subcategory/Deletesubcategory';

  //mainCategory

  static String mainCategoryListApi =
      '$baseUrl/Product_main_category/view_main_categorye';
  static String mainCategoryAddApi =
      '$baseUrl/Product_main_category/add_main_category';
  static String mainCategoryEditApi =
      '$baseUrl/Product_main_category/edit_main_category';
  static String mainCategoryDeleteApi =
      '$baseUrl/Product_main_category/Delete_main_category';

  //Color

  static String colorListApi = '$baseUrl/Color/view_color';
  static String colorAddApi = '$baseUrl/Color/Postcolor';
  static String colorEditApi = '$baseUrl/Color/Updatecolor';
  static String colorDeleteApi = '$baseUrl/Color/Delete_color';

  //State

  static String stateListApi = '$baseUrl/State/view_state';
  static String stateAddApi = '$baseUrl/State/state_add';
  static String stateEditApi = '$baseUrl/State/Edit_state';
  static String stateDeleteApi = '$baseUrl/State/Delete_state';

  //District

  static String districtListApi = '$baseUrl/District/view_district';
  static String districtAddApi = '$baseUrl/District/district_add';
  static String districtEditApi = '$baseUrl/District/Edit_district';
  static String districtDeleteApi = '$baseUrl/District/Delete_district';

  //Construction

  static String constructionListApi = '$baseUrl/Construction/view_construction';
  static String constructionAddApi = '$baseUrl/Construction/construction_add';
  static String constructionEditApi = '$baseUrl/Construction/Edit_construction';
  static String constructionDeleteApi =
      '$baseUrl/Construction/Delete_construction';

  //Division

  static String divisionListApi = '$baseUrl/division/Getdivision';
  static String divisionAddApi = '$baseUrl/division/Postdivision';
  static String divisionEditApi = '$baseUrl/division/Updatedivision';
  static String divisionDeleteApi = '$baseUrl/division/Deletedivision';

  //size

  static String sizeListApi = '$baseUrl/Size/view_size';
  static String sizeAddApi = '$baseUrl/Size/size_add';
  static String sizeEditApi = '$baseUrl/Size/Edit_size';
  static String sizeDeleteApi = '$baseUrl/Size/Delete_size';
}
