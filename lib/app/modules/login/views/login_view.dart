import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/underline_textformfield.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/core/assets/image_assets.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        //  extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xffEDF3F5),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .5,
              height: double.infinity,
              color: AppColor.primary,
            ),
            Align(
              alignment: Alignment.center,
              child: Form(
                key: controller.formkey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageAssets.mainLogo,
                      fit: BoxFit.contain,
                      scale: 1.6,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.35
                          : size.width * 0.9,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          shape: BoxShape.rectangle),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'login'.tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 36),
                          ).paddingOnly(left: 20),
                          UnderlineTextFormField(
                            hint: 'admin',
                            label: 'user_name'.tr,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter user name';
                              }
                              return null;
                            },
                            textEditingController:
                                controller.emailController.value,
                          ).paddingSymmetric(horizontal: 20, vertical: 12),
                          const SizedBox(height: 12),
                          Obx(() => UnderlineTextFormField(
                                hint: '...........',
                                label: 'password'.tr,
                                obscureText:
                                    !controller.isVisiblePassword.value,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isVisiblePassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColor.primary,
                                  ),
                                  onPressed: () {
                                    controller.isVisiblePassword(
                                        !controller.isVisiblePassword.value);
                                  },
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter password';
                                  }
                                  return null;
                                },
                                textEditingController:
                                    controller.passwordController.value,
                              )).paddingSymmetric(horizontal: 20, vertical: 12),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => Tooltip(
                              message: "Click to login",
                              child: CommonButton(
                                isLoading: controller.isLoading.value,
                                onClick: () {
                                  if (controller.formkey.currentState!
                                      .validate()) {
                                    controller.login();
                                  }
                                },
                                label: 'login'.tr,
                              ).paddingSymmetric(horizontal: 20, vertical: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
