import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/general_exception.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/internet_exceptions_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/pagination/pagination_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/popup/common_popup.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/shimmer/table_loader.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_header_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_icons.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text/text_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/core/extention.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.width * 0.008;
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      body: CommonPagePadding(
        child: Column(
          children: [
            HomeAppBar(
              title: 'Settings / Product / View',
              onClick: () {
                controller.clear();
                controller.isIndex.value = 0;
                controller.tabcontroller.animateTo(0);
                Get.rootDelegate.toNamed(Routes.productAdd);
              },
              label: 'add_new'.tr,
            ),
            Obx(() {
              switch (controller.rxRequestStatus.value) {
                case Status.loading:
                  return SizedBox(
                    height: size.height * 0.4,
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
                        controller.get();
                      },
                    );
                  } else {
                    return GeneralExceptionWidget(onPress: () {
                      controller.get();
                    });
                  }

                case Status.completed:
                  return PageContainer(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ColumnHeaderWidget(
                              width: size.width * 0.05,
                              label: 'Sl No.',
                            ),
                            Expanded(
                              child: ColumnHeaderWidget(
                                label: 'Name',
                                width: size.width * 0.3,
                              ),
                            ),
                            ColumnHeaderWidget(
                              label: 'Category',
                              width: size.width * 0.15,
                            ),
                            ColumnHeaderWidget(
                              label: 'Main Category',
                              width: size.width * 0.15,
                            ),
                            ColumnHeaderWidget(
                              label: 'Art no.',
                              width: size.width * 0.1,
                            ),
                            ColumnHeaderWidget(
                              label: 'Brand',
                              width: size.width * 0.15,
                            ),
                            ColumnHeaderWidget(
                              label: '',
                              width: size.width * 0.10,
                            )
                          ],
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            height: size.height * 0.53,
                            child: Obx(
                              () => ListView.builder(
                                  itemCount: controller.data.length,
                                  itemBuilder: (context, index) {
                                    const evenColor = Colors.white;
                                    const oddColor = AppColor.boxBorderColor;

                                    final bgColor =
                                        index % 2 == 0 ? oddColor : evenColor;
                                    final item = controller.data[index];
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
                                              alignment: Alignment.center,
                                              width: size.width * 0.05,
                                              color: bgColor,
                                            ),
                                            Expanded(
                                              child: ColumnWidget(
                                                  text: columnText(
                                                      item.product ?? '',
                                                      fontSize),
                                                  width: size.width * 0.3,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  color: bgColor),
                                            ),
                                            ColumnWidget(
                                                text: columnText(
                                                    item.proCat ?? '',
                                                    fontSize),
                                                width: size.width * 0.15,
                                                alignment: Alignment.centerLeft,
                                                color: bgColor),
                                            ColumnWidget(
                                                text: columnText(
                                                    item.mainCategory ?? '',
                                                    fontSize),
                                                width: size.width * 0.15,
                                                alignment: Alignment.centerLeft,
                                                color: bgColor),
                                            ColumnWidget(
                                                text: columnText(
                                                    item.artNo ?? '', fontSize),
                                                width: size.width * 0.1,
                                                alignment: Alignment.centerLeft,
                                                color: bgColor),
                                            ColumnWidget(
                                                text: columnText(
                                                    item.brand ?? '', fontSize),
                                                width: size.width * 0.15,
                                                alignment: Alignment.centerLeft,
                                                color: bgColor),
                                            IconsColumnWidget(
                                              width: size.width * 0.10,
                                              delete: () async {
                                                dynamic returnResponse =
                                                    await commonDialog(
                                                        title: "Delete",
                                                        subTitle:
                                                            "Are you sure want to delete this item?",
                                                        titleIcon: Icons.delete,
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
                        ),
                        10.height,
                        Obx(() => PaginationWidget(
                            totalPages: controller.totalPages.value,
                            currentPage: controller.currentPage.value,
                            onPageSelected: controller.changePage))
                      ],
                    ),
                  );
              }
            })
          ],
        ),
      ),
    );
  }
}
