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
  static String proCategoryListApi = '$baseUrl/Master/procatList';
  static String proCategoryAddApi = '$baseUrl/Master/Addprocat';
  static String proCategoryEditApi = '$baseUrl/Master/Updateprocat';
  static String proCategoryDeleteApi = '$baseUrl/Master/Deleteprocat';

  //subcategory

  static String subCategoryListApi = '$baseUrl/Master/prosubcatList';
  static String subCategoryAddApi = '$baseUrl/Master/Addprosubcat';
  static String subCategoryEditApi = '$baseUrl/Master/Updateprosubcat';
  static String subCategoryDeleteApi = '$baseUrl/Master/Delete_subcat';

  //productgroup
  static String proGroupListApi = '$baseUrl/Master/pro_group';
  static String proGroupAddApi = '$baseUrl/Master/add_progroup';
  static String proGroupEditApi = '$baseUrl/Master/Updatepro_group';
  static String proGroupDeleteApi = '$baseUrl/Master/Deletepro_group';

  //subproductgroup
  static String subGroupListApi = '$baseUrl/Master/prosubgroup_List';
  static String subGroupAddApi = '$baseUrl/Master/add_prosubgroup';
  static String subGroupEditApi = '$baseUrl/Master/Updateprosub_group';
  static String subGroupDeleteApi = '$baseUrl/Master/Delete_subGroup';

  //product Aplication
  static String proApplicationListApi = '$baseUrl/Master/pro_application_list';
  static String proApplicationAddApi = '$baseUrl/Master/add_pro_application';
  static String proApplicationEditApi =
      '$baseUrl/Master/pro_application_update';
  static String proApplicationDeleteApi =
      '$baseUrl/Master/Deletepro_application';

  //place
  static String placeListApi = '$baseUrl/Master/locationListWeb';
  static String placeAddApi = '$baseUrl/Master/Addlocation';
  static String placeEditApi = '$baseUrl/Master/Updatelocation';
  static String placeDeleteApi = '$baseUrl/Master/Deletedlocation';
}
