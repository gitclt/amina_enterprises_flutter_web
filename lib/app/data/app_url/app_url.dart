import 'package:amina_enterprises_flutter_web/app/constants/strings.dart';

class AppUrl {
  static String baseUrl = kBaseUrl;

  // Login

  // Masters
  static String profileApi = '$baseUrl/mastersettings/country_view.aspx';

  //branch
  static String branchApi = '$baseUrl/Master/branchList';
  static String stateBranchApi = '$baseUrl/Lead/getbranch_state';

  //State
  static String stateApi = '$baseUrl/Master/stateList';

  //place
  static String placeApi = '$baseUrl/Master/locationList';
  static String branchwisePlaceApi = '$baseUrl/Master/getlocation_branch';

  //designation
  static String designationApi = '$baseUrl/Master/designationList';
}
