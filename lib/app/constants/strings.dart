// const String kBaseUrl = "https://crmtrail.demospro2023.tk";
import 'package:amina_enterprises_flutter_web/app/data/model/auth/auth_model.dart';

const String kBaseUrl = s1;
const String kBaseUrlForImage = "$kBaseUrl/public/assets/web";
const bool isStaging = true;

const String s1 = "https://kvn.gitonline.in/api";

class LocalStorageKey {
  static String token = "USER_TOKEN";
  static String type = "USER_TYPE";
  static String roleId = "ROLE_ID";
  static String roleName = "ROLE_NAME";
  static String userName = "USER_NAME";
  static String empId = "EMP_ID";

  static List<Branch> userBranch = [];
  static List<Privilage> privilage = [];
}
