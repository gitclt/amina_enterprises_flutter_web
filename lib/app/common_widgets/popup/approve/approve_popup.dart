import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text/text_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/core/extention.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';

class ApprovePopup extends StatelessWidget {
  final Function(String) onChange;
  final Function onUpdate;
  const ApprovePopup(
      {super.key, required this.onChange, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      elevation: 5,
      shadowColor: Colors.black,
      //  backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(color: Colors.white),
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.4,
              maxHeight: MediaQuery.of(context).size.width * 0.4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close)),
              ),
              xtraBoldText(
                "Approve",
                18,
              ),
              20.height,
              SizedBox(
                width: Responsive.isDesktop(context)
                    ? size.width * 0.73 / 2
                    : size.width * .8,
                child: AddTextFieldWidget(
                  label: "Remark",
                  onChanged: onChange,
                  minLines: 5,
                ),
              ),
              20.height,
              Tooltip(
                message: "Approve",
                child: CommonButton(
                  width: Responsive.isDesktop(context)
                      ? size.width * 0.73 / 2
                      : size.width * .8,

                  // height: Responsive.isDesktop(context)
                  //     ? MediaQuery.of(context).size.height * 0.06
                  //     : null,
                  onClick: onUpdate,
                  label: "Approve",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
