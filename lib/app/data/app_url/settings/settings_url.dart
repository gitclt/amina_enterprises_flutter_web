import 'package:amina_enterprises_flutter_web/app/constants/strings.dart';

class SettingsUrl {
  static String baseUrl = kBaseUrl;

  //role
  static String roleListApi = '$baseUrl/Master/role_list';
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

  static String subCategoryListApi = '$baseUrl/subcategory/Getsubcategory';
  static String subCategoryAddApi = '$baseUrl/subcategory/Postsubcategory';
  static String subCategoryEditApi = '$baseUrl/subcategory/Updatesubcategory';
  static String subCategoryDeleteApi = '$baseUrl/subcategory/Deletesubcategory';

  //Color

  static String colorListApi = '$baseUrl/Color/Getcolor';
  static String colorAddApi = '$baseUrl/Color/Postcolor';
  static String colorEditApi = '$baseUrl/Color/Updatecolor';
  static String colorDeleteApi = '$baseUrl/Color/Deletecolor';

  //State

  static String stateListApi = '$baseUrl/State/view_state';
  static String stateAddApi = '$baseUrl/State/state_add';
  static String stateEditApi = '$baseUrl/State/Edit_state';
  static String stateDeleteApi = '$baseUrl/State/Delete_state';
  //Construction

  static String constructionListApi = '$baseUrl/Construction/view_construction';
  static String constructionAddApi = '$baseUrl/Construction/construction_add';
  static String constructionEditApi = '$baseUrl/Construction/Edit_construction';
  static String constructionDeleteApi =
      '$baseUrl/Construction/Delete_construction';
}
