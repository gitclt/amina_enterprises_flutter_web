import 'package:amina_enterprises_flutter_web/app/core/assets/image_assets.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/menu_entity.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SidemenuState {
  final RxInt _selectedIndex = 0.obs;
  RxInt get selectedIndex => _selectedIndex;
  final RxInt _selectedsubIndex = 0.obs;
  RxInt get selectedsubIndex => _selectedsubIndex;
  List<MenuEntity> menus = [];

  void onInit() {
    addMenuItems();
  }

  void addMenuItems() {
// dashboard
    menus.add(
      MenuEntity(
        id: 0,
        menu: 'DASHBOARD',
        svgIcon: SvgAssets.dashboard,
        items: [],
        onClick: () {
          Get.rootDelegate.toNamed(Routes.dashboard);
        },
      ),
    );
    menus.add(
      MenuEntity(
        id: 0,
        menu: 'EMPLOYEES',
        svgIcon: SvgAssets.employees,
        items: [],
        onClick: () {
          Get.rootDelegate.toNamed(Routes.dashboard);
        },
      ),
    );
    menus.add(
      MenuEntity(
        id: 0,
        menu: 'CUSTOMERS',
        svgIcon: SvgAssets.customers,
        items: [],
        onClick: () {
          Get.rootDelegate.toNamed(Routes.dashboard);
        },
      ),
    );
    menus.add(
      MenuEntity(
        id: 0,
        menu: 'SALES',
        svgIcon: SvgAssets.sales,
        items: [],
        onClick: () {
          Get.rootDelegate.toNamed(Routes.dashboard);
        },
      ),
    );

    menus.add(
      MenuEntity(
        id: 0,
        menu: 'MASTER',
        svgIcon: SvgAssets.settings,
        items: [],
        onClick: () {
          Get.rootDelegate.toNamed(Routes.settings);
          
        },
      ),
    );

    // Credit login

    // for (var i in LocalStorageKey.privilage) {
    //   // Verify Payment
    //   if (i.privilageId == 2 && i.isView == 1) {
    //     menus.add(
    //       MenuEntity(
    //         id: i.privilageId,
    //         menu: i.menu ?? '',
    //         svgIcon: SvgAssets.sidemenu,
    //         items: [],
    //         onClick: () {
    //           //Get.rootDelegate.toNamed(Routes.paymentVerification);
    //         },
    //       ),
    //     );
    //   }
  }
}
