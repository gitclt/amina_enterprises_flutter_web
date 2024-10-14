import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/common_circle_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/core/assets/image_assets.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';

class ChangePasswordPopUp extends StatefulWidget {
  const ChangePasswordPopUp({super.key});

  @override
  State<ChangePasswordPopUp> createState() => _ChangePasswordPopUpState();
}

class _ChangePasswordPopUpState extends State<ChangePasswordPopUp> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: const BoxDecoration(color: Colors.white),
            constraints: BoxConstraints(
                maxWidth: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width * 0.8 / 2
                    : MediaQuery.of(context).size.width * 0.7),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: circleContainer()),
                ),
                circleSvgContainer(
                  SvgAssets.changePassword,
                  size: 40.0,
                  color: AppColor.primary,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Change Your Password',
                  style: TextStyle(
                      color: AppColor.grey,
                      fontWeight: FontWeight.w800,
                      fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Enter a new password below to change your password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.profileButtonLabel,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 20,
                ),
                const AddTextFieldWidget(
                  label: 'New Password',
                ).paddingSymmetric(horizontal: 20),
                const SizedBox(
                  height: 20,
                ),
                const AddTextFieldWidget(
                  label: 'Confirm Password',
                ).paddingSymmetric(horizontal: 20),
                const SizedBox(
                  height: 25,
                ),
                CommonButton(
                        onClick: () {
                          setState(() {});
                        },
                        label: 'Change Password')
                    .paddingOnly(bottom: 15, left: 20, right: 20)
              ],
            ),
          )),
    );
  }
}
