import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/general_exception.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/internet_exceptions_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/popup/common_popup.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/shimmer/table_loader.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_header_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_icons.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/table_serch_bar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text/text_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/core/extention.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sub_category_controller.dart';

class SubCategoryView extends GetView<SubCategoryController> {
  const SubCategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.width * 0.008;
    // var tableHeight = size.height * 0.050;

    return Scaffold(
        backgroundColor: AppColor.scaffoldBgColor,
        body: CommonPagePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(
                title: 'Home / SubCategory / View',
                label: 'add_new'.tr,
                onClick: () {
                  controller.clear();
                  Get.rootDelegate.toNamed(Routes.subCategoryAdd);
                },
              ),
              10.height,
              TableSerchBar(
                size: size,
                onSearchChanged: (value) {
                  controller.searchData(value);
                },
              ).paddingAll(10),
              Obx(() {
                switch (controller.rxRequestStatus.value) {
                  case Status.loading:
                    return SizedBox(
                      height: size.height * 0.3,
                      child: ShimmerBuilder(
                        rowCount: 10,
                        sizes: [
                          size.width * 0.03,
                          size.width * 0.1,
                          size.width * 0.055,
                          size.width * 0.08,
                          size.width * 0.08,
                          size.width * 0.06,
                          size.width * 0.12,
                          size.width * 0.04,
                          size.width * 0.04,
                          size.width * 0.04,
                        ],
                      ).paddingAll(10),
                    );

                  case Status.error:
                    if (controller.error.value == 'No internet') {
                      return InterNetExceptionWidget(
                        onPress: () {
                          controller.getsubCategoryList();
                        },
                      );
                    } else {
                      return GeneralExceptionWidget(onPress: () {
                        controller.getsubCategoryList();
                      });
                    }

                  case Status.completed:
                    return PageContainer(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ColumnHeaderWidget(
                                width: size.width * 0.12,
                                label: 'Sl No.',
                              ),
                              Expanded(
                                child: ColumnHeaderWidget(
                                  label: 'Sub Category',
                                  width: size.width * 0.3,
                                ),
                              ),
                              ColumnHeaderWidget(
                                label: 'Category',
                                width: size.width * 0.24,
                              ),
                              ColumnHeaderWidget(
                                label: '',
                                width: size.width * 0.11,
                              )
                            ],
                          ),
                          SingleChildScrollView(
                            child: SizedBox(
                              height: size.height * 0.48,
                              child: Obx(
                                () => ListView.builder(
                                    itemCount:
                                        controller.subCategoryList.length,
                                    itemBuilder: (context, index) {
                                      const evenColor = Colors.white;
                                      const oddColor = AppColor.boxBorderColor;

                                      final bgColor =
                                          index % 2 == 0 ? oddColor : evenColor;
                                      final item =
                                          controller.subCategoryList[index];
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              ColumnWidget(
                                                text: columnText(
                                                  (index + 1).toString(),
                                                  fontSize,
                                                ),
                                                width: size.width * 0.12,
                                                color: bgColor,
                                              ),
                                              Expanded(
                                                child: ColumnWidget(
                                                    text: columnText(
                                                        item.name ?? '',
                                                        fontSize),
                                                    width: size.width * 0.3,
                                                    color: bgColor),
                                              ),
                                              ColumnWidget(
                                                  text: columnText(
                                                      item.procategory ?? '',
                                                      fontSize),
                                                  width: size.width * 0.24,
                                                  color: bgColor),
                                              IconsColumnWidget(
                                                width: size.width * 0.11,
                                                delete: () async {
                                                  dynamic returnResponse =
                                                      await commonDialog(
                                                          title: "Delete",
                                                          subTitle:
                                                              "Are you sure want to delete this item?",
                                                          titleIcon:
                                                              Icons.delete,
                                                          theamColor:
                                                              AppColor.red);

                                                  if (returnResponse == true) {
                                                    controller.delete(
                                                        item.id.toString());
                                                  }
                                                },
                                                edit: () async {
                                                  controller.editClick(item);
                                                },
                                                color: bgColor,
                                              )
                                            ],
                                          )
                                        ],
                                      );
                                    }),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                }
              })
            ],
          ),
        ));
  }
}
