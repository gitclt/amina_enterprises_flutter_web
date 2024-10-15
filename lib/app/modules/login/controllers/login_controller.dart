import 'dart:convert';

import 'package:amina_enterprises_flutter_web/app/data/local/user_preference/user_prefrence_view_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/login_repository/login_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/profile/profile_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formkey = GlobalKey<FormState>();
  final _useapi = ProfileRepository();
  final emailController = TextEditingController(text: '').obs;
  final passwordController = TextEditingController(text: '').obs;
  final _api = LoginRepository();
  final apiServices = NetworkApiServices();
  UserPreference userPreference = UserPreference();
  final isLoading = false.obs;
  final isVisiblePassword = false.obs;
  final rememberMe = false.obs;
  String type = 'employee';

  void login() async {
    isLoading(true);
    await fetchDeviceInfo();
    //  runLiveDb();

    try {
      String password =
          passwordController.value.text.trim().replaceAll('&', 'amp;');
      String temp =
          "username=${emailController.value.text.trim()}&password=$password&type=$type";
      print("Temp $temp");
      List<int> encDataByte =
          utf8.encode(temp); // Convert string to UTF-8 bytes
      String encodedData = base64Encode(encDataByte); // Encode bytes to Base64

      final response = await _api.loginApi(encodedData);

      response.fold((failure) {
        isLoading(false);
        Utils.snackBar('Login', failure.message);
      }, (sucess) async {
        if (sucess.data != null) {
          await userPreference.addToken(sucess.data!.token ?? '');

          if (sucess.data != null) {
            final res =
                await _useapi.getProfileView(sucess.data!.token.toString());

            res.fold(
              (failure) {
                isLoading(false);
                Utils.snackBar('Profile', failure.message);
              },
              (resData) {
                if (resData.data != null) {
                  userPreference.saveUser(resData.data!).then(
                    (s) {
                      Get.rootDelegate.offNamed(Routes.home);
                    },
                  );
                }
              },
            );
          }
        }
      });
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchDeviceInfo() async {
    //  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      // final value = await apiServices.getPublicIP();
      // if (value != '') {
      //   type = value;
      // } else if (value == 'Failed') {
      //   type = '';
      // }
      await userPreference.addMac(type);
      // if (GetPlatform.isDesktop) {
      //   final info = NetworkInfo();
      //   String? wifiInfo = await info.getWifiBSSID();

      //   macid = wifiInfo ?? '';

      //   print('Fetched MAC ID: $macid');

      //   await userPreference.addMac(macid);

      // } else {
      //   // macid = 'Not available on non-Android platforms';
      // }
    } catch (e) {
      type = 'Error fetching Android ID';
    }

    // Update the UI using GetX
    update();
  }
}
