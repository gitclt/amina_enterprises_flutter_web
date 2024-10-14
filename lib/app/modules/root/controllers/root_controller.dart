import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/constants/strings.dart';
import 'package:amina_enterprises_flutter_web/app/data/local/user_preference/user_prefrence_view_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/profile/profile_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';

class RootController extends GetxController {
  final RxBool _isLoading = false.obs;
  final _api = ProfileRepository();
  get isLoading => _isLoading.value;

  final RxBool _isAuthenticated = false.obs;

  get isAuthenticated => _isAuthenticated.value;
  UserPreference userPreference = UserPreference();
  @override
  void onInit() {
    getLoginDetails();
    super.onInit();
  }

  getLoginDetails() async {
    // Utils.snackBar('root_', "Loading...................");

    _isLoading.value = true;
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      final token = await userPreference.getUser();

      if (token != null) {
        final response = await _api.getProfileView(token);

        response.fold(
          (failure) {
            isLoading(false);
            Utils.snackBar('Profile', failure.message);
            gotoLogin();
          },
          (res) {
            if (res.data != null) {
              if (res.data != null) {
                userPreference
                    .saveUser(
                        res.data!, res.branches ?? [], res.privilage ?? [])
                    .then(
                  (s) {
                    if (LocalStorageKey.roleId == '10') {
                      Get.rootDelegate.offNamed(Routes.home);
                    } else {
                      //gotoLogin();
                      Utils.snackBar('User', "Permission denied ....");
                    }
                  },
                );
              }
            }
          },
        );
      } else {
        gotoLogin();
      }

      if (value != null) {}
    }).whenComplete(() => _isLoading.value = false);
  }

  void gotoLogin() async {
    UserPreference userPreference = UserPreference();
    await userPreference.removeUser();

    Get.rootDelegate.offNamed(Routes.login);
  }
}
