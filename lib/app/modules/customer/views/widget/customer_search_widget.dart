import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/modules/customer/controllers/customer_controller.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerSearchWidget extends StatelessWidget {
  final double searchWidth;
  final CustomerController controller;
  final Size size;
  const CustomerSearchWidget(
      {super.key,
      required this.searchWidth,
      required this.controller,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Wrap(
        spacing: Responsive.isDesktop(context)
            ? 12
            : Responsive.isMobile(context)
                ? 80
                : 80,
        runSpacing: 15,
        children: [
          Obx(
            () => SizedBox(
              width: searchWidth,
              child: DropDown3Widget(
                label: 'State',
                hint: '--Select State--',
                selectedItem: controller.sdSearchState.id == null
                    ? null
                    : controller.sdSearchState,
                items: controller.searchStateDropList,
                isLoading: controller.isSearchStateLoading.value,
                onChanged: (data) async {
                  if (data == null) return;
                  controller.sdSearchState = data;
                  // controller.getSearchBranchList();
                  controller.getSearchDistrict();
                },
              ),
            ),
          ),
          Obx(
            () => SizedBox(
              width: searchWidth,
              child: DropDown3Widget(
                label: 'District',
                hint: '--Select District--',
                selectedItem: controller.sdSearchDistrict.id == null
                    ? null
                    : controller.sdSearchDistrict,
                items: controller.searchDistrictDropList,
                isLoading: controller.isSearchDistrictLoading.value,
                onChanged: (data) async {
                  if (data == null) return;
                  controller.sdSearchDistrict = data;
                },
              ),
            ),
          ),
        

          Tooltip(
            message: "Search",
            child: CommonButton(
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width * .15
                  : null,
              onClick: () {
                if (controller.sdSearchState.id != null) {
                  controller.get();
                } else {
                  Utils.snackBar('Customer', 'Please select a State');
                }
              },
              label: "Search",
            ),
          ).paddingOnly(top: 28)
        ],
      ),
    );
  }
}
